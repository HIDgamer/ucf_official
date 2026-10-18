GLOBAL_LIST_EMPTY(soup_recipes)

/// A soup is a recipe cooked in a pot on a stove
/datum/soup_recipe
	var/name
	var/list/required_reagents
	var/list/required_ingredients
	var/list/results
	/// Food typepaths and how many of each appear beside the pot instead of soup
	var/list/result_foods
	var/category = CAT_SOUP
	var/cook_time = 30 SECONDS
	/// Share of an ingredient's own reagents that end up in the soup
	var/ingredient_reagent_share = 0.5

/// Reagent type of the soup this recipe makes
/datum/soup_recipe/proc/get_soup_type()
	for(var/result in results)
		for(var/path in subtypesof(/datum/reagent/nutriment/soup))
			var/datum/reagent/nutriment/soup/soup = path
			if(initial(soup.id) == result)
				return path

/proc/get_soup_recipes()
	if(length(GLOB.soup_recipes))
		return GLOB.soup_recipes
	for(var/path in subtypesof(/datum/soup_recipe))
		var/datum/soup_recipe/recipe = new path
		if(!length(recipe.results) && !length(recipe.result_foods))
			qdel(recipe)
			continue
		GLOB.soup_recipes += recipe
	return GLOB.soup_recipes

/datum/reagent/nutriment/soup
	name = "Soup"
	id = "soup"
	description = "Something hot in a bowl."
	reagent_state = LIQUID
	nutriment_factor = 12 * REAGENTS_METABOLISM
	color = "#d9b36b"
	chemclass = CHEM_CLASS_NONE
	properties = list(PROPERTY_NUTRITIOUS = 2)
	flags = REAGENT_NO_GENERATION
	/// Sprite shown when the soup sits in a bowl
	var/bowl_state = "bowl"

/// A bowl for soup, drunk like a cup
/obj/item/reagent_container/food/drinks/bowl
	name = "bowl"
	desc = "A simple bowl for soup and salad."
	icon = 'icons/obj/food/soupsalad.dmi'
	icon_state = "bowl"
	item_state = null
	volume = 50
	amount_per_transfer_from_this = 25
	possible_transfer_amounts = list(5, 10, 25)
	w_class = SIZE_SMALL

/obj/item/reagent_container/food/drinks/bowl/on_reagent_change()
	..()
	var/datum/reagent/nutriment/soup/soup = reagents?.get_master_reagent()
	if(istype(soup))
		icon_state = soup.bowl_state
		name = "bowl of [lowertext(soup.name)]"
		desc = soup.description
	else
		icon_state = "bowl"
		name = initial(name)
		desc = initial(desc)

/// A pot that ingredients and water go into, cooked on a stove into soup
/obj/item/reagent_container/glass/soup_pot
	name = "soup pot"
	desc = "A tall soup pot designed to mix and cook all kinds of soup."
	icon = 'icons/obj/soup_pot.dmi'
	icon_state = "pot"
	volume = 200
	amount_per_transfer_from_this = 50
	possible_transfer_amounts = list(25, 50, 100, 200)
	w_class = SIZE_LARGE
	splashable = FALSE
	has_lid = FALSE
	var/max_ingredients = 24
	var/list/added_ingredients = list()
	var/datum/soup_recipe/cooking_recipe
	var/cook_progress = 0

/obj/item/reagent_container/glass/soup_pot/Destroy()
	dump_ingredients()
	return ..()

/obj/item/reagent_container/glass/soup_pot/proc/dump_ingredients(atom/drop_loc)
	if(!drop_loc)
		drop_loc = get_turf(src)
	for(var/obj/item/ingredient as anything in added_ingredients)
		ingredient.forceMove(drop_loc)
	added_ingredients.Cut()
	update_icon()

/obj/item/reagent_container/glass/soup_pot/attackby(obj/item/item, mob/user)
	if(istype(item, /obj/item/reagent_container/food/snacks))
		if(length(added_ingredients) >= max_ingredients)
			to_chat(user, SPAN_WARNING("There are too many ingredients in \the [src]."))
			return TRUE
		if(!user.drop_inv_item_to_loc(item, src))
			return TRUE
		added_ingredients += item
		to_chat(user, SPAN_NOTICE("You add \the [item] to \the [src]."))
		update_icon()
		return TRUE
	return ..()

/obj/item/reagent_container/glass/soup_pot/attack_self(mob/user)
	if(!length(added_ingredients))
		return ..()
	var/list/options = list()
	for(var/obj/item/ingredient as anything in added_ingredients)
		options["[ingredient.name] #[length(options) + 1]"] = ingredient
	var/picked = tgui_input_list(user, "Take out which ingredient?", name, options)
	if(!picked || !(options[picked] in added_ingredients))
		return
	var/obj/item/removed = options[picked]
	added_ingredients -= removed
	removed.forceMove(get_turf(src))
	user.put_in_hands(removed)
	update_icon()

/obj/item/reagent_container/glass/soup_pot/get_examine_text(mob/user)
	. = ..()
	if(length(added_ingredients))
		var/list/counts = list()
		for(var/obj/item/ingredient as anything in added_ingredients)
			counts[ingredient.name] += 1
		var/list/lines = list()
		for(var/ingredient_name in counts)
			lines += "[counts[ingredient_name]] [ingredient_name]"
		. += SPAN_NOTICE("Inside are [english_list(lines)].")
	if(reagents?.total_volume)
		var/list/reagent_names = list()
		for(var/datum/reagent/reagent as anything in reagents.reagent_list)
			reagent_names += "[round(reagent.volume, 0.1)] units of [reagent.name]"
		. += SPAN_NOTICE("It holds [english_list(reagent_names)].")
	else if(!length(added_ingredients))
		. += SPAN_NOTICE("It is empty.")
	if(cooking_recipe)
		. += SPAN_NOTICE("Something is cooking in it.")

/obj/item/reagent_container/glass/soup_pot/update_icon()
	overlays.Cut()
	if(!length(added_ingredients) && !reagents?.total_volume)
		return
	var/image/filling = image(icon, src, "pot_filling_overlay")
	filling.color = reagents?.total_volume ? mix_color_from_reagents(reagents.reagent_list) : "#c9a46a"
	overlays += filling

/obj/item/reagent_container/glass/soup_pot/on_reagent_change()
	..()
	update_icon()

/// How many of an ingredient type the pot holds
/obj/item/reagent_container/glass/soup_pot/proc/count_ingredients(requirement)
	. = 0
	for(var/obj/item/ingredient as anything in added_ingredients)
		if(crafting_type_matches(ingredient.type, requirement))
			. += 1

/obj/item/reagent_container/glass/soup_pot/proc/recipe_matches(datum/soup_recipe/recipe)
	for(var/reagent_id in recipe.required_reagents)
		if(reagents.get_reagent_amount(reagent_id) < recipe.required_reagents[reagent_id])
			return FALSE
	for(var/requirement in recipe.required_ingredients)
		if(count_ingredients(requirement) < recipe.required_ingredients[requirement])
			return FALSE
	return TRUE

/// The most specific soup the pot's contents make
/obj/item/reagent_container/glass/soup_pot/proc/find_recipe()
	var/datum/soup_recipe/best
	for(var/datum/soup_recipe/recipe as anything in get_soup_recipes())
		if(!recipe_matches(recipe))
			continue
		if(!best || length(recipe.required_ingredients) > length(best.required_ingredients))
			best = recipe
	return best

/// Cooks for a while, returns TRUE when a soup finishes
/obj/item/reagent_container/glass/soup_pot/proc/cook(delta)
	var/datum/soup_recipe/recipe = find_recipe()
	if(recipe != cooking_recipe)
		cooking_recipe = recipe
		cook_progress = 0
	if(!recipe)
		return FALSE
	cook_progress += delta
	if(cook_progress < recipe.cook_time)
		return FALSE
	finish_soup(recipe)
	return TRUE

/obj/item/reagent_container/glass/soup_pot/proc/finish_soup(datum/soup_recipe/recipe)
	for(var/reagent_id in recipe.required_reagents)
		reagents.remove_reagent(reagent_id, recipe.required_reagents[reagent_id])
	for(var/requirement in recipe.required_ingredients)
		var/needed = recipe.required_ingredients[requirement]
		for(var/obj/item/ingredient as anything in added_ingredients.Copy())
			if(needed <= 0)
				break
			if(!crafting_type_matches(ingredient.type, requirement))
				continue
			if(ingredient.reagents?.total_volume)
				ingredient.reagents.trans_to(src, ingredient.reagents.total_volume * recipe.ingredient_reagent_share)
			added_ingredients -= ingredient
			qdel(ingredient)
			needed--
	for(var/reagent_id in recipe.results)
		reagents.add_reagent(reagent_id, recipe.results[reagent_id])
	for(var/food_path in recipe.result_foods)
		for(var/i in 1 to recipe.result_foods[food_path])
			new food_path(get_turf(src))
	cooking_recipe = null
	cook_progress = 0
	update_icon()

/// A stove with one burner, soup is cooked in the pot standing on it
/obj/structure/machinery/cooker/stove
	name = "stove"
	desc = "You'd think this thing would be more useful in here."
	icon = 'icons/obj/machines/kitchen_stove.dmi'
	icon_state = "stove"
	max_items = 1
	cook_loop_type = /datum/looping_sound/stove

/obj/structure/machinery/cooker/stove/Initialize()
	. = ..()
	update_icon()

/obj/structure/machinery/cooker/stove/accepts_item(obj/item/item)
	return istype(item, /obj/item/reagent_container/glass/soup_pot)

/obj/structure/machinery/cooker/stove/get_cook_component(obj/item/item)
	return item

/obj/structure/machinery/cooker/stove/attackby(obj/item/item, mob/user)
	if(istype(item, /obj/item/reagent_container/glass/soup_pot))
		if(length(cooking))
			to_chat(user, SPAN_WARNING("There is already a pot on \the [src]."))
			return TRUE
		add_item(item, user)
		return TRUE
	return ..()

/obj/structure/machinery/cooker/stove/show_cooking_item(obj/item/item)
	item.pixel_x = -6
	item.pixel_y = 16
	vis_contents |= item

/obj/structure/machinery/cooker/stove/hide_cooking_item(obj/item/item)
	vis_contents -= item

/obj/structure/machinery/cooker/stove/get_menu_options(mob/user)
	var/list/options = list()
	options[on ? "Turn the burner off" : "Turn the burner on"] = "toggle"
	for(var/obj/item/item as anything in cooking)
		options["Take [item.name]"] = item
	return options

/obj/structure/machinery/cooker/stove/handle_menu_choice(choice, mob/user)
	if(choice == "toggle")
		playsound(src, 'sound/machines/click.ogg', 25, 1)
	return ..()

/obj/structure/machinery/cooker/stove/process()
	if(!on || !length(cooking))
		stop_processing()
		return
	var/delta = world.time - last_cook_time
	last_cook_time = world.time
	for(var/obj/item/reagent_container/glass/soup_pot/pot as anything in cooking.Copy())
		if(pot.cook(delta))
			visible_message(SPAN_NOTICE("The soup in \the [pot] is ready."))
			playsound(src, 'sound/machines/ding.ogg', 25, 1)
		update_effects()

/obj/structure/machinery/cooker/stove/get_progress_text(obj/item/item)
	var/obj/item/reagent_container/glass/soup_pot/pot = item
	if(!pot.cooking_recipe)
		return "not cooking anything"
	return "simmering [lowertext(pot.cooking_recipe.name)]"

/obj/structure/machinery/cooker/stove/update_icon()
	overlays.Cut()
	if(on)
		overlays += image(icon, src, "stove_on_overlay")
		overlays += image(icon, src, "stove_on_flame")

/datum/looping_sound/stove
	mid_sounds = list('sound/machines/grill/grillsizzle.ogg')
	mid_length = 2 SECONDS
	volume = 15
