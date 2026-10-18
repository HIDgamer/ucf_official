/// Hand crafting from things within reach, opened from the Crafting Menu verb
/datum/personal_crafting
	var/busy = FALSE
	var/display_craftable_only = FALSE

/mob/living/carbon/human/var/datum/personal_crafting/crafting

/mob/living/carbon/human/verb/crafting_menu()
	set name = "Crafting Menu"
	set category = "IC"

	if(!crafting)
		crafting = new
	crafting.tgui_interact(src)

/// Items the user can reach to craft with
/datum/personal_crafting/proc/get_reachable_items(mob/user)
	. = list()
	if(user.l_hand)
		. += user.l_hand
	if(user.r_hand)
		. += user.r_hand
	if(!isturf(user.loc))
		return
	for(var/turf/nearby in range(1, user))
		for(var/obj/item/item in nearby)
			. += item

/// Counts of item types, reagent volumes and tool kinds that are within reach
/datum/personal_crafting/proc/get_surroundings(mob/user, list/blacklist)
	var/list/counts = list()
	var/list/instances = list()
	var/list/reagent_totals = list()
	var/list/tools = list()
	for(var/obj/item/item as anything in get_reachable_items(user))
		if(blacklist && (item.type in blacklist))
			continue
		LAZYADDASSOCLIST(instances, item.type, item)
		if(istype(item, /obj/item/stack))
			var/obj/item/stack/stack = item
			counts[item.type] += stack.amount
		else
			counts[item.type] += 1
		if(item.reagents && (item.flags_atom & OPENCONTAINER))
			for(var/datum/reagent/reagent as anything in item.reagents.reagent_list)
				reagent_totals[reagent.id] += reagent.volume
		for(var/behaviour in list(TOOL_KNIFE, TOOL_ROLLINGPIN, TOOL_SAW, TOOL_SCALPEL))
			if(food_tool_matches(item, behaviour))
				tools[behaviour] = TRUE
	return list("counts" = counts, "instances" = instances, "reagents" = reagent_totals, "tools" = tools)

/datum/personal_crafting/proc/check_contents(datum/crafting_recipe/recipe, list/surroundings)
	var/list/counts = surroundings["counts"]
	var/list/reagent_totals = surroundings["reagents"]
	for(var/requirement in recipe.reqs)
		var/needed = recipe.reqs[requirement]
		if(istext(requirement))
			if(reagent_totals[requirement] < needed)
				return FALSE
			continue
		for(var/have_path in counts)
			if(!crafting_type_matches(have_path, requirement) || (have_path in recipe.blacklist))
				continue
			needed -= counts[have_path]
			if(needed <= 0)
				break
		if(needed > 0)
			return FALSE
	return TRUE

/datum/personal_crafting/proc/check_tools(datum/crafting_recipe/recipe, list/surroundings)
	var/list/tools = surroundings["tools"]
	for(var/behaviour in recipe.tool_behaviors)
		if(!tools[behaviour])
			return FALSE
	var/list/counts = surroundings["counts"]
	for(var/required_path in recipe.tool_paths)
		var/found = FALSE
		for(var/have_path in counts)
			if(ispath(have_path, required_path))
				found = TRUE
				break
		if(!found)
			return FALSE
	return TRUE

/// Consumes the ingredients and returns the items that move into the result
/datum/personal_crafting/proc/consume_requirements(datum/crafting_recipe/recipe, mob/user)
	var/list/surroundings = get_surroundings(user, recipe.blacklist)
	var/list/instances = surroundings["instances"]
	var/list/consumed = list()
	for(var/requirement in recipe.reqs)
		var/needed = recipe.reqs[requirement]
		if(istext(requirement))
			for(var/obj/item/item as anything in get_reachable_items(user))
				if(needed <= 0)
					break
				if(!item.reagents || !(item.flags_atom & OPENCONTAINER))
					continue
				var/have = item.reagents.get_reagent_amount(requirement)
				if(have <= 0)
					continue
				var/taken = min(have, needed)
				item.reagents.remove_reagent(requirement, taken)
				needed -= taken
			continue
		for(var/have_path in instances)
			if(needed <= 0)
				break
			if(!crafting_type_matches(have_path, requirement))
				continue
			for(var/obj/item/item as anything in instances[have_path])
				if(needed <= 0)
					break
				if(item in consumed)
					continue
				if(istype(item, /obj/item/stack))
					var/obj/item/stack/stack = item
					var/taken = min(stack.amount, needed)
					stack.use(taken)
					needed -= taken
					continue
				consumed += item
				needed--
	var/list/kept = list()
	for(var/part in recipe.parts)
		var/wanted = recipe.parts[part]
		for(var/obj/item/item as anything in consumed)
			if(wanted <= 0)
				break
			if(ispath(item.type, part))
				kept += item
				wanted--
	for(var/obj/item/item as anything in kept)
		consumed -= item
	for(var/obj/item/item as anything in kept)
		user.temp_drop_inv_item(item)
	for(var/obj/item/item as anything in consumed)
		if(ismob(item.loc))
			var/mob/holder = item.loc
			holder.temp_drop_inv_item(item)
	return list("kept" = kept, "consumed" = consumed)

/// Tries to craft, returns the result or a failure reason
/datum/personal_crafting/proc/construct_item(mob/user, datum/crafting_recipe/recipe)
	var/list/surroundings = get_surroundings(user, recipe.blacklist)
	if(!check_contents(recipe, surroundings))
		return ", missing ingredients."
	if(!check_tools(recipe, surroundings))
		return ", missing tool."
	if(recipe.one_per_turf)
		for(var/atom/content in get_turf(user))
			if(istype(content, recipe.result))
				return ", object already present."
	if(!do_after(user, recipe.time, INTERRUPT_ALL, BUSY_ICON_BUILD))
		return ", interrupted."
	surroundings = get_surroundings(user, recipe.blacklist)
	if(!check_contents(recipe, surroundings) || !check_tools(recipe, surroundings))
		return ", the ingredients changed."
	var/list/used = consume_requirements(recipe, user)
	var/list/kept = used["kept"]
	var/list/consumed = used["consumed"]
	var/atom/movable/made
	if(ispath(recipe.result, /obj/item/stack))
		made = new recipe.result(get_turf(user), recipe.result_amount || 1)
	else
		made = new recipe.result(get_turf(user))
	if(isitem(made))
		var/obj/item/made_item = made
		made_item.on_crafted(user, kept, consumed)
	for(var/obj/item/item as anything in consumed)
		qdel(item)
	return made

/// Called on a freshly crafted item with the ingredients that were kept and used up
/obj/item/proc/on_crafted(mob/user, list/kept, list/consumed)
	for(var/obj/item/part as anything in kept)
		part.forceMove(src)

/obj/item/food/on_crafted(mob/user, list/kept, list/consumed)
	..()
	if(!reagents)
		return
	for(var/obj/item/reagent_container/food/snacks/ingredient in consumed + kept)
		if(!ingredient.reagents?.total_volume)
			continue
		ingredient.reagents.trans_to(src, ingredient.reagents.total_volume * CRAFTED_FOOD_INGREDIENT_REAGENT_MODIFIER)

/datum/personal_crafting/ui_state(mob/user)
	return GLOB.not_incapacitated_state

/datum/personal_crafting/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "FoodCrafting", "Crafting")
		ui.open()

/datum/personal_crafting/ui_assets(mob/user)
	return list(get_asset_datum(/datum/asset/spritesheet/cooking))

/datum/personal_crafting/ui_data(mob/user)
	var/list/data = list()
	data["busy"] = busy
	data["display_craftable_only"] = display_craftable_only
	var/list/surroundings = get_surroundings(user)
	var/list/craftable = list()
	for(var/datum/crafting_recipe/recipe as anything in get_crafting_recipes())
		if(recipe.non_craftable)
			continue
		var/list/recipe_surroundings = length(recipe.blacklist) ? get_surroundings(user, recipe.blacklist) : surroundings
		if(check_contents(recipe, recipe_surroundings) && check_tools(recipe, recipe_surroundings))
			craftable += "[REF(recipe)]"
	data["craftable"] = craftable
	return data

/datum/personal_crafting/ui_static_data(mob/user)
	var/list/data = list()
	var/list/recipes = list()
	var/list/categories = list()
	var/index = 0
	for(var/datum/crafting_recipe/recipe as anything in get_crafting_recipes())
		index++
		var/list/entry = list()
		entry["ref"] = "[REF(recipe)]"
		entry["sprite"] = "r[index]"
		entry["name"] = recipe.name
		entry["category"] = recipe.category || CAT_MISCFOOD
		categories |= entry["category"]
		var/atom/result_atom = recipe.result
		entry["desc"] = recipe.desc || initial(result_atom.desc)
		var/list/requirements = list()
		for(var/requirement in recipe.reqs)
			requirements += list(list("name" = crafting_requirement_name(requirement), "amount" = recipe.reqs[requirement], "reagent" = istext(requirement)))
		entry["reqs"] = requirements
		entry["tools"] = crafting_recipe_tool_names(recipe)
		if(recipe.steps)
			entry["steps"] = recipe.steps
		if(recipe.non_craftable)
			entry["non_craftable"] = TRUE
		recipes += list(entry)
	var/soup_index = 0
	for(var/datum/soup_recipe/soup as anything in get_soup_recipes())
		soup_index++
		var/list/entry = list()
		entry["ref"] = "soup[soup_index]"
		entry["sprite"] = "s[soup_index]"
		entry["name"] = soup.name
		entry["category"] = soup.category
		categories |= soup.category
		entry["desc"] = "Cooked in a soup pot on a lit stove for [soup.cook_time / 10] seconds[length(soup.results) ? ", then ladled into bowls" : ""]."
		var/list/requirements = list()
		for(var/reagent_id in soup.required_reagents)
			requirements += list(list("name" = crafting_requirement_name(reagent_id), "amount" = soup.required_reagents[reagent_id], "reagent" = TRUE))
		for(var/ingredient in soup.required_ingredients)
			requirements += list(list("name" = crafting_requirement_name(ingredient), "amount" = soup.required_ingredients[ingredient], "reagent" = FALSE))
		entry["reqs"] = requirements
		entry["tools"] = list()
		entry["non_craftable"] = TRUE
		recipes += list(entry)
	data["recipes"] = recipes
	data["categories"] = sortList(categories)
	return data

/datum/personal_crafting/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	var/mob/user = usr
	switch(action)
		if("make")
			if(busy)
				return
			var/datum/crafting_recipe/recipe = GLOB.crafting_recipes_by_ref[params["recipe"]]
			if(!recipe || recipe.non_craftable)
				return
			busy = TRUE
			SStgui.update_uis(src)
			var/result = construct_item(user, recipe)
			if(istext(result))
				to_chat(user, SPAN_WARNING("Crafting failed[result]"))
			else
				var/atom/movable/made = result
				if(isitem(made))
					user.put_in_hands(made)
				to_chat(user, SPAN_NOTICE("You make \the [made]."))
				recipe.on_craft_completion(user, made)
			busy = FALSE
			return TRUE
		if("toggle_craftable_only")
			display_craftable_only = !display_craftable_only
			return TRUE

/// Icons of everything the crafting menu can make
/datum/asset/spritesheet/cooking
	name = "cooking"

/datum/asset/spritesheet/cooking/register()
	var/index = 0
	for(var/datum/crafting_recipe/recipe as anything in get_crafting_recipes())
		index++
		var/atom/result_atom = recipe.result
		var/icon_file = initial(result_atom.icon)
		var/icon_state = initial(result_atom.icon_state)
		if(!icon_file || !(icon_state in icon_states(icon_file)))
			continue
		Insert("r[index]", icon(icon_file, icon_state, SOUTH))
	index = 0
	for(var/datum/soup_recipe/soup as anything in get_soup_recipes())
		index++
		var/icon_file
		var/icon_state
		var/datum/reagent/nutriment/soup/soup_type = soup.get_soup_type()
		if(soup_type)
			icon_file = 'icons/obj/food/soupsalad.dmi'
			icon_state = initial(soup_type.bowl_state)
		else
			for(var/food_path in soup.result_foods)
				var/atom/food_atom = food_path
				icon_file = initial(food_atom.icon)
				icon_state = initial(food_atom.icon_state)
				break
		if(icon_file && (icon_state in icon_states(icon_file)))
			Insert("s[index]", icon(icon_file, icon_state, SOUTH))
	for(var/list/basic in GLOB.cookbook_basics)
		if(basic[1])
			insert_item(basic[1])
	for(var/input_type in get_food_processor_inputs())
		var/datum/bastion_processor_recipe/recipe = get_food_processor_inputs()[input_type]
		if(recipe.output)
			insert_item(recipe.output)
	return ..()

/// Adds the sprite of an item type under its name from cooking_sprite_name
/datum/asset/spritesheet/cooking/proc/insert_item(path)
	var/sprite_name = cooking_sprite_name(path)
	if(sprites[sprite_name])
		return
	var/atom/atom_path = path
	var/icon_file = initial(atom_path.icon)
	var/icon_state = initial(atom_path.icon_state)
	if(!icon_file || !(icon_state in icon_states(icon_file)))
		return
	Insert(sprite_name, icon(icon_file, icon_state, SOUTH))

/// Spritesheet name of an item type
/proc/cooking_sprite_name(path)
	return "t[replacetext("[path]", "/", "-")]"
