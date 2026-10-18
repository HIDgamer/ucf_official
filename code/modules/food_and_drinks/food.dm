/// Bastion food, a data driven layer over the classic snack code
/obj/item/food
	parent_type = /obj/item/reagent_container/food/snacks
	name = "food"
	desc = "you eat this"
	icon = 'icons/obj/food/food.dmi'
	icon_state = null
	w_class = SIZE_SMALL
	item_icons = list(
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/items/bastion_food_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/items/bastion_food_righthand.dmi',
	)
	/// Reagent ids and amounts this food starts with
	var/list/food_reagents
	var/food_flags
	var/foodtypes
	var/max_volume
	var/eat_time
	var/list/tastes
	var/list/eatverbs
	var/bite_consumption
	var/trash_type
	var/junkiness
	var/burns_on_grill = FALSE
	var/burns_in_oven = FALSE
	var/venue_value
	var/preserved_food = FALSE
	var/ant_attracting = FALSE
	var/decomp_type
	var/decomp_req_handle = FALSE
	var/decomposition_time = 0
	var/force_feed_on_aggression = FALSE
	/// Cutting recipes added by the processable element
	var/list/processing_recipes
	/// What a microwave turns this into
	var/microwave_result
	/// How long it has been in a fryer
	var/fry_progress = 0
	var/inhand_icon_state
	var/base_icon_state
	var/lefthand_file
	var/righthand_file
	var/worn_icon_state
	var/obj_flags
	var/resistance_flags
	var/slot_flags
	var/food_buffs
	var/custom_price
	var/bait_quality
	var/list/custom_materials
	var/list/grind_results
	var/list/juice_results
	var/attack_verb_simple
	var/attack_verb_continuous

/obj/item/food/Initialize(mapload)
	if(max_volume)
		volume = max_volume
	. = ..()
	if(inhand_icon_state)
		item_state = inhand_icon_state
	if(trash_type)
		trash = trash_type
	bitesize = bite_consumption || 2
	for(var/reagent in food_reagents)
		reagents.add_reagent(reagent, food_reagents[reagent])
	make_processable()
	make_grillable()
	make_bakeable()
	make_microwaveable()

/// Overridden by food that cuts into other food
/obj/item/food/proc/make_processable()
	return

/obj/item/food/proc/make_grillable()
	if(burns_on_grill)
		AddComponent(/datum/component/grillable, /obj/item/food/badrecipe, rand(FOOD_GRILL_BURN_MIN, FOOD_GRILL_BURN_MAX), FALSE)

/obj/item/food/proc/make_bakeable()
	if(burns_in_oven)
		AddComponent(/datum/component/bakeable, /obj/item/food/badrecipe, rand(FOOD_OVEN_BURN_MIN, FOOD_OVEN_BURN_MAX), FALSE)

/obj/item/food/proc/make_microwaveable()
	return

/obj/item/food/get_examine_text(mob/user)
	. = ..()
	for(var/list/recipe as anything in processing_recipes)
		var/atom/result = recipe["result"]
		var/tool_name = recipe["tool"]
		var/amount = recipe["amount"]
		. += SPAN_NOTICE("It can be turned into [amount > 1 ? "[amount] " : "a "][initial(result.name)] with a [tool_name].")

/obj/item/food/attackby(obj/item/W, mob/user)
	for(var/list/recipe as anything in processing_recipes)
		if(!food_tool_matches(W, recipe["tool"]))
			continue
		process_with_tool(W, user, recipe)
		return TRUE
	return ..()

/// Whether an item counts as the given food preparation tool
/proc/food_tool_matches(obj/item/tool, behaviour)
	switch(behaviour)
		if(TOOL_KNIFE)
			return tool.sharp == IS_SHARP_ITEM_ACCURATE || tool.sharp == IS_SHARP_ITEM_BIG || istype(tool, /obj/item/tool/kitchen/pizzacutter)
		if(TOOL_ROLLINGPIN)
			return istype(tool, /obj/item/tool/kitchen/rollingpin) || istype(tool, /obj/item/bastion_kitchen/rollingpin)
		if(TOOL_SAW)
			return istype(tool, /obj/item/tool/surgery/circular_saw)
		if(TOOL_SCALPEL)
			return istype(tool, /obj/item/tool/surgery/scalpel)
	return FALSE

/obj/item/food/proc/process_with_tool(obj/item/tool, mob/user, list/recipe)
	if(recipe["table_required"] && !food_on_prep_surface())
		to_chat(user, SPAN_WARNING("You need a table or at least a tray to do that."))
		return
	var/atom/result_type = recipe["result"]
	user.visible_message(SPAN_NOTICE("[user] starts to work on \the [src]."), SPAN_NOTICE("You start to turn \the [src] into [initial(result_type.name)]."))
	if(!do_after(user, recipe["time"], INTERRUPT_ALL, BUSY_ICON_BUILD, src))
		return
	var/amount = recipe["amount"]
	var/turf/drop_loc = get_turf(src)
	var/each = reagents ? reagents.total_volume / amount : 0
	for(var/i in 1 to amount)
		var/obj/result = new result_type(drop_loc)
		if(each && result.reagents)
			result.reagents.clear_reagents()
			reagents.trans_to(result, each)
	user.visible_message(SPAN_NOTICE("[user] finishes working on \the [src]."), SPAN_NOTICE("You turn \the [src] into [amount > 1 ? "[amount] " : "a "][initial(result_type.name)]."))
	qdel(src)

/obj/item/food/proc/food_on_prep_surface()
	var/turf/here = get_turf(src)
	if(!here)
		return FALSE
	if(istype(loc, /obj/structure/surface/table) || istype(loc, /obj/item/tool/kitchen/tray))
		return TRUE
	return !!(locate(/obj/structure/surface/table) in here) || !!(locate(/obj/item/tool/kitchen/tray) in here)

/// Cut into other food with a tool
/datum/element/processable
	element_flags = NONE

/datum/element/processable/Attach(datum/target, tool_behaviour, result_atom_type, amount_created = 3, time_to_process = 2 SECONDS, table_required = FALSE, screentip_verb = "Process")
	. = ..()
	if(!istype(target, /obj/item/food))
		return ELEMENT_INCOMPATIBLE
	var/obj/item/food/food_target = target
	LAZYADD(food_target.processing_recipes, list(list(
		"tool" = tool_behaviour,
		"result" = result_atom_type,
		"amount" = amount_created,
		"time" = time_to_process,
		"table_required" = table_required,
	)))

/// Food that leaves something behind when eaten
/datum/element/food_trash
	element_flags = NONE

/datum/element/food_trash/Attach(datum/target, trash_type, flags, generate_trash_proc)
	. = ..()
	if(!istype(target, /obj/item/food))
		return ELEMENT_INCOMPATIBLE
	var/obj/item/food/food_target = target
	food_target.trash = trash_type

/// Behaviours from the original that this game does not use
/datum/element/swabable
	element_flags = NONE

/datum/element/swabable/Attach(datum/target, ...)
	return ..()

/datum/element/dryable
	element_flags = NONE

/datum/element/dryable/Attach(datum/target, ...)
	return ..()

/datum/element/chewable
	element_flags = NONE

/datum/element/chewable/Attach(datum/target, metabolization_amount, ...)
	return ..()

/datum/element/venue_price
	element_flags = NONE

/datum/element/venue_price/Attach(datum/target, ...)
	return ..()

/datum/element/foodlike_drink
	element_flags = NONE

/datum/element/foodlike_drink/Attach(datum/target, ...)
	return ..()

/datum/element/dunkable
	element_flags = NONE

/datum/element/dunkable/Attach(datum/target, amount_per_dunk, ...)
	return ..()

/datum/element/microwavable
	element_flags = NONE

/datum/element/microwavable/Attach(datum/target, microwave_type)
	. = ..()
	if(istype(target, /obj/item/food))
		var/obj/item/food/food_target = target
		food_target.microwave_result = microwave_type

/datum/component/spill

/datum/component/spill/Initialize(...)
	return

/datum/component/fertile_egg

/datum/component/fertile_egg/Initialize(...)
	return

/datum/component/creamed

/datum/component/creamed/Initialize(...)
	return

/datum/component/boomerang

/datum/component/boomerang/Initialize(...)
	return

/datum/component/decomposition

/datum/component/decomposition/Initialize(...)
	return

/datum/component/food_storage

/datum/component/food_storage/Initialize(...)
	return

/datum/component/slippery

/datum/component/slippery/Initialize(...)
	return

/datum/component/ice_cream_holder

/datum/component/ice_cream_holder/Initialize(...)
	return

/// Marks an item as ovenable, the oven reads these
/datum/component/bakeable
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS
	var/atom/bake_result
	var/required_bake_time = 2 MINUTES
	var/positive_result = TRUE
	var/current_bake_time = 0

/datum/component/bakeable/Initialize(bake_result, required_bake_time = 2 MINUTES, positive_result = TRUE, use_large_steam_sprite)
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	src.bake_result = bake_result
	src.required_bake_time = required_bake_time
	src.positive_result = positive_result

/// Bakes for a while, returns the baked item once it is done
/datum/component/bakeable/proc/cook(delta)
	current_bake_time += delta
	if(current_bake_time < required_bake_time)
		return null
	var/obj/item/original = parent
	var/obj/item/result = new bake_result(original.loc)
	result.pixel_x = original.pixel_x
	result.pixel_y = original.pixel_y
	qdel(original)
	return result

/datum/component/bakeable/InheritComponent(datum/component/bakeable/new_comp, original, bake_result, required_bake_time, positive_result, use_large_steam_sprite)
	if(!original)
		return
	if(bake_result)
		src.bake_result = bake_result
	if(required_bake_time)
		src.required_bake_time = required_bake_time
	if(!isnull(positive_result))
		src.positive_result = positive_result

/// Marks an item as grillable, the grill and griddle read these
/datum/component/grillable
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS
	var/atom/cook_result
	var/required_cook_time = 2 MINUTES
	var/positive_result = TRUE
	var/current_cook_time = 0
	var/use_large_steam_sprite = FALSE

/datum/component/grillable/Initialize(cook_result, required_cook_time = 2 MINUTES, positive_result = TRUE, use_large_steam_sprite = FALSE, pollutant_type)
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	src.cook_result = cook_result
	src.required_cook_time = required_cook_time
	src.positive_result = positive_result
	src.use_large_steam_sprite = use_large_steam_sprite

/// Grills for a while, returns the cooked item once it is done
/datum/component/grillable/proc/cook(delta)
	current_cook_time += delta
	if(current_cook_time < required_cook_time)
		return null
	var/obj/item/original = parent
	var/obj/item/result = new cook_result(original.loc)
	result.pixel_x = original.pixel_x
	result.pixel_y = original.pixel_y
	qdel(original)
	return result

/datum/component/grillable/InheritComponent(datum/component/grillable/new_comp, original, cook_result, required_cook_time, positive_result, use_large_steam_sprite)
	if(!original)
		return
	if(cook_result)
		src.cook_result = cook_result
	if(required_cook_time)
		src.required_cook_time = required_cook_time
	if(!isnull(positive_result))
		src.positive_result = positive_result
	if(use_large_steam_sprite)
		src.use_large_steam_sprite = use_large_steam_sprite

/datum/pollutant/food/fried_meat

/datum/component/customizable_reagent_holder

/datum/component/customizable_reagent_holder/Initialize(replacement, ingredient_icon, max_ingredients, ...)
	return
