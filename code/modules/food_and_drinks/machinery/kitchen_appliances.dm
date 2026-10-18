GLOBAL_LIST_EMPTY(food_processor_inputs)

/// What a food processor turns one thing into
/datum/bastion_processor_recipe
	var/input
	var/list/blacklist
	var/output
	var/time = 40
	var/food_multiplier = 1

/proc/get_food_processor_inputs()
	if(length(GLOB.food_processor_inputs))
		return GLOB.food_processor_inputs
	for(var/path in subtypesof(/datum/bastion_processor_recipe))
		var/datum/bastion_processor_recipe/recipe = new path
		if(!recipe.input)
			qdel(recipe)
			continue
		var/list/bad_types = list()
		for(var/bad_type in recipe.blacklist)
			bad_types += typesof(bad_type)
		for(var/input_type in typesof(recipe.input) - bad_types)
			GLOB.food_processor_inputs[input_type] = recipe
	return GLOB.food_processor_inputs

/// A food processor, whole food goes in and the processed food comes out
/obj/structure/machinery/bastion_processor
	name = "food processor"
	desc = "An industrial grinder used to process meat and other foods. Keep hands clear of intake area while operating."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "processor"
	density = TRUE
	anchored = TRUE
	wrenchable = TRUE
	use_power = USE_POWER_NONE
	needs_power = FALSE
	layer = BELOW_OBJ_LAYER
	var/processing = FALSE
	var/max_items = 10
	var/list/processor_contents = list()

/obj/structure/machinery/bastion_processor/get_examine_text(mob/user)
	. = ..()
	if(length(processor_contents))
		. += SPAN_NOTICE("It holds [english_list(processor_contents)].")

/obj/structure/machinery/bastion_processor/attackby(obj/item/item, mob/user)
	if(HAS_TRAIT(item, TRAIT_TOOL_WRENCH))
		return ..()
	if(processing)
		to_chat(user, SPAN_WARNING("\The [src] is processing."))
		return TRUE
	if(!get_food_processor_inputs()[item.type])
		to_chat(user, SPAN_WARNING("\The [src] cannot process that."))
		return TRUE
	if(length(processor_contents) >= max_items)
		to_chat(user, SPAN_WARNING("\The [src] is full."))
		return TRUE
	if(user.drop_inv_item_to_loc(item, src))
		processor_contents += item
		user.visible_message(SPAN_NOTICE("[user] puts \the [item] into \the [src]."), SPAN_NOTICE("You put \the [item] into \the [src]."))
	return TRUE

/obj/structure/machinery/bastion_processor/attack_hand(mob/user)
	if(processing || user.is_mob_incapacitated() || !Adjacent(user))
		return
	var/list/options = list()
	if(length(processor_contents))
		options["Process"] = "process"
		for(var/obj/item/item as anything in processor_contents)
			options["Take [item.name]"] = item
	if(!length(options))
		to_chat(user, SPAN_NOTICE("\The [src] is empty."))
		return
	var/picked = tgui_input_list(user, "What would you like to do?", name, options)
	if(!picked || processing || !Adjacent(user) || user.is_mob_incapacitated())
		return
	var/choice = options[picked]
	if(choice == "process")
		start_processing_food(user)
	else if(istype(choice, /obj/item) && (choice in processor_contents))
		processor_contents -= choice
		user.put_in_hands(choice)

/obj/structure/machinery/bastion_processor/proc/start_processing_food(mob/user)
	processing = TRUE
	icon_state = "processor1"
	playsound(src, 'sound/machines/blender.ogg', 50, 1)
	var/total_time = 0
	for(var/obj/item/item as anything in processor_contents)
		var/datum/bastion_processor_recipe/recipe = get_food_processor_inputs()[item.type]
		if(recipe)
			total_time = max(total_time, recipe.time)
	addtimer(CALLBACK(src, PROC_REF(finish_processing)), max(total_time, 10))

/obj/structure/machinery/bastion_processor/proc/finish_processing()
	processing = FALSE
	icon_state = "processor"
	if(QDELETED(src))
		return
	for(var/obj/item/item as anything in processor_contents.Copy())
		var/datum/bastion_processor_recipe/recipe = get_food_processor_inputs()[item.type]
		processor_contents -= item
		if(recipe?.output)
			var/amount = max(1, recipe.food_multiplier)
			for(var/i in 1 to amount)
				var/obj/item/result = new recipe.output(get_turf(src))
				if(item.reagents?.total_volume && result.reagents)
					item.reagents.trans_to(result, item.reagents.total_volume / amount)
		qdel(item)
	visible_message(SPAN_NOTICE("\The [src] finishes processing."))
	playsound(src, 'sound/machines/ding.ogg', 25, 1)

/obj/structure/machinery/bastion_processor/Destroy()
	for(var/obj/item/item as anything in processor_contents)
		item.forceMove(get_turf(src))
	processor_contents.Cut()
	return ..()

/// What a grinder or juicer makes from things that do not say themselves
GLOBAL_LIST_INIT(blender_juice_results, list(
	/obj/item/food/grown/tomato = "tomatojuice",
	/obj/item/food/grown/citrus/orange = "orangejuice",
	/obj/item/food/grown/citrus/lemon = "lemonjuice",
	/obj/item/food/grown/citrus/lime = "limejuice",
	/obj/item/food/grown/apple = "applejuice",
	/obj/item/food/grown/berries = "berryjuice",
	/obj/item/food/grown/grapes = "grapejuice",
	/obj/item/food/grown/pineapple = "pineapplejuice",
	/obj/item/food/grown/watermelon = "watermelonjuice",
	/obj/item/food/grown/carrot = "carrotjuice",
	/obj/item/food/grown/banana = "banana",
))

GLOBAL_LIST_INIT(blender_grind_results, list(
	/obj/item/food/grown/wheat = "flour",
	/obj/item/food/grown/corn = "cornmeal",
	/obj/item/food/grown/soybeans = "soymilk",
	/obj/item/food/grown/peanut = "peanut_butter",
	/obj/item/food/grown/oat = "flour",
	/obj/item/food/grown/chili = "capsaicin",
))

/// The all in one grinder, grinds and juices food into a beaker
/obj/structure/machinery/bastion_grinder
	name = "\improper All-In-One Grinder"
	desc = "From BlenderTech. Will It Blend? Let's test it out!"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "juicer1"
	density = TRUE
	anchored = TRUE
	wrenchable = TRUE
	use_power = USE_POWER_NONE
	needs_power = FALSE
	layer = BELOW_OBJ_LAYER
	var/operating = FALSE
	var/obj/item/reagent_container/beaker
	var/limit = 10
	var/list/holding_items = list()

/obj/structure/machinery/bastion_grinder/Initialize()
	. = ..()
	beaker = new /obj/item/reagent_container/glass/beaker/large(src)
	update_icon()

/obj/structure/machinery/bastion_grinder/Destroy()
	QDEL_NULL(beaker)
	for(var/obj/item/item as anything in holding_items)
		item.forceMove(get_turf(src))
	holding_items.Cut()
	return ..()

/obj/structure/machinery/bastion_grinder/update_icon()
	icon_state = "juicer[beaker ? 1 : 0]"

/// What an item turns into when ground, as an assoc list of reagent ids and amounts
/obj/structure/machinery/bastion_grinder/proc/get_grind_results(obj/item/item)
	var/list/results = list()
	var/known = GLOB.blender_grind_results[item.type]
	if(known)
		results[known] = 10
	else if(istype(item, /obj/item/food))
		var/obj/item/food/food_item = item
		for(var/reagent_id in food_item.grind_results)
			results[reagent_id] = food_item.grind_results[reagent_id] || 5
	return results

/obj/structure/machinery/bastion_grinder/proc/get_juice_results(obj/item/item)
	var/list/results = list()
	var/known = GLOB.blender_juice_results[item.type]
	if(known)
		results[known] = 10
	else if(istype(item, /obj/item/food))
		var/obj/item/food/food_item = item
		for(var/reagent_id in food_item.juice_results)
			results[reagent_id] = food_item.juice_results[reagent_id] || 5
	return results

/obj/structure/machinery/bastion_grinder/attackby(obj/item/item, mob/user)
	if(HAS_TRAIT(item, TRAIT_TOOL_WRENCH))
		return ..()
	if(operating)
		to_chat(user, SPAN_WARNING("\The [src] is running."))
		return TRUE
	if(istype(item, /obj/item/reagent_container) && !istype(item, /obj/item/reagent_container/food/snacks) && (item.flags_atom & OPENCONTAINER))
		if(beaker)
			to_chat(user, SPAN_WARNING("There is already a container in \the [src]."))
			return TRUE
		if(user.drop_inv_item_to_loc(item, src))
			beaker = item
			update_icon()
			to_chat(user, SPAN_NOTICE("You put \the [item] in \the [src]."))
		return TRUE
	if(!length(get_grind_results(item)) && !length(get_juice_results(item)))
		to_chat(user, SPAN_WARNING("You cannot grind \the [item] into reagents."))
		return TRUE
	if(length(holding_items) >= limit)
		to_chat(user, SPAN_WARNING("\The [src] is full."))
		return TRUE
	if(user.drop_inv_item_to_loc(item, src))
		holding_items += item
		to_chat(user, SPAN_NOTICE("You add \the [item] to \the [src]."))
	return TRUE

/obj/structure/machinery/bastion_grinder/attack_hand(mob/user)
	if(operating || user.is_mob_incapacitated() || !Adjacent(user))
		return
	var/list/options = list()
	if(beaker || length(holding_items))
		options["Eject"] = "eject"
	if(length(holding_items))
		options["Grind"] = "grind"
		options["Juice"] = "juice"
	else if(beaker?.reagents.total_volume)
		options["Mix"] = "mix"
	if(!length(options))
		return
	var/picked = tgui_input_list(user, "What would you like to do?", name, options)
	if(!picked || operating || !Adjacent(user) || user.is_mob_incapacitated())
		return
	switch(options[picked])
		if("eject")
			eject(user)
		if("grind")
			grind()
		if("juice")
			juice()
		if("mix")
			mix()

/obj/structure/machinery/bastion_grinder/proc/eject(mob/user)
	for(var/obj/item/item as anything in holding_items)
		item.forceMove(get_turf(src))
	holding_items.Cut()
	if(beaker)
		user.put_in_hands(beaker)
		beaker = null
	update_icon()

/obj/structure/machinery/bastion_grinder/proc/operate_for(time, juicing = FALSE)
	operating = TRUE
	playsound(src, juicing ? 'sound/machines/juicer.ogg' : 'sound/machines/blender.ogg', 50, 1)
	addtimer(CALLBACK(src, PROC_REF(stop_operating)), time)

/obj/structure/machinery/bastion_grinder/proc/stop_operating()
	operating = FALSE

/obj/structure/machinery/bastion_grinder/proc/grind()
	if(!beaker || beaker.reagents.total_volume >= beaker.reagents.maximum_volume)
		return
	operate_for(6 SECONDS)
	for(var/obj/item/item as anything in holding_items.Copy())
		if(beaker.reagents.total_volume >= beaker.reagents.maximum_volume)
			break
		var/list/results = get_grind_results(item)
		if(!length(results))
			continue
		for(var/reagent_id in results)
			beaker.reagents.add_reagent(reagent_id, results[reagent_id])
		if(item.reagents)
			item.reagents.trans_to(beaker, item.reagents.total_volume)
		holding_items -= item
		qdel(item)

/obj/structure/machinery/bastion_grinder/proc/juice()
	if(!beaker || beaker.reagents.total_volume >= beaker.reagents.maximum_volume)
		return
	operate_for(5 SECONDS, TRUE)
	for(var/obj/item/item as anything in holding_items.Copy())
		if(beaker.reagents.total_volume >= beaker.reagents.maximum_volume)
			break
		var/list/results = get_juice_results(item)
		if(!length(results))
			continue
		for(var/reagent_id in results)
			beaker.reagents.add_reagent(reagent_id, results[reagent_id])
		holding_items -= item
		qdel(item)

/obj/structure/machinery/bastion_grinder/proc/mix()
	if(!beaker)
		return
	operate_for(5 SECONDS, TRUE)
	addtimer(CALLBACK(src, PROC_REF(mix_complete)), 5 SECONDS)

/obj/structure/machinery/bastion_grinder/proc/mix_complete()
	if(QDELETED(src) || !beaker?.reagents.total_volume)
		return
	var/butter_amount = floor(beaker.reagents.get_reagent_amount("milk") / 25)
	if(butter_amount)
		beaker.reagents.remove_reagent("milk", 25 * butter_amount)
		for(var/i in 1 to butter_amount)
			new /obj/item/food/butter(get_turf(src))
	var/egg_amount = beaker.reagents.get_reagent_amount("egg")
	if(egg_amount)
		beaker.reagents.remove_reagent("egg", egg_amount)
		beaker.reagents.add_reagent("mayonnaise", egg_amount)

/// A microwave, food goes in and comes out heated or ruined
/obj/structure/machinery/bastion_microwave
	name = "microwave oven"
	desc = "Cooks and boils things. Not for putting metal in."
	icon = 'icons/obj/machines/microwave.dmi'
	icon_state = "mw_complete"
	density = TRUE
	anchored = TRUE
	wrenchable = TRUE
	use_power = USE_POWER_NONE
	needs_power = FALSE
	layer = ABOVE_TABLE_LAYER
	var/operating = FALSE
	var/open = FALSE
	var/max_items = 8
	var/list/microwave_contents = list()

/obj/structure/machinery/bastion_microwave/Initialize()
	. = ..()
	update_icon()

/obj/structure/machinery/bastion_microwave/Destroy()
	for(var/obj/item/item as anything in microwave_contents)
		item.forceMove(get_turf(src))
	microwave_contents.Cut()
	return ..()

/obj/structure/machinery/bastion_microwave/update_icon()
	icon_state = ""
	overlays.Cut()
	overlays += image(icon, src, open ? "back_open" : (operating ? "back_on" : "back_off"))
	if(!open)
		overlays += image(icon, src, operating ? "door_on" : "door_off")
	overlays += image(icon, src, open ? "mwo" : (operating ? "mw1" : "mw"))
	if(!open)
		overlays += image(icon, src, "door_handle")

/obj/structure/machinery/bastion_microwave/get_examine_text(mob/user)
	. = ..()
	if(open && length(microwave_contents))
		. += SPAN_NOTICE("It holds [english_list(microwave_contents)].")

/obj/structure/machinery/bastion_microwave/attackby(obj/item/item, mob/user)
	if(HAS_TRAIT(item, TRAIT_TOOL_WRENCH))
		return ..()
	if(operating)
		to_chat(user, SPAN_WARNING("\The [src] is running."))
		return TRUE
	if(!open)
		to_chat(user, SPAN_WARNING("Open the door of \the [src] first."))
		return TRUE
	if(!istype(item, /obj/item/reagent_container/food/snacks))
		to_chat(user, SPAN_WARNING("\The [src] is only for food."))
		return TRUE
	if(length(microwave_contents) >= max_items)
		to_chat(user, SPAN_WARNING("\The [src] is full."))
		return TRUE
	if(user.drop_inv_item_to_loc(item, src))
		microwave_contents += item
		to_chat(user, SPAN_NOTICE("You put \the [item] in \the [src]."))
	return TRUE

/obj/structure/machinery/bastion_microwave/attack_hand(mob/user)
	if(operating || user.is_mob_incapacitated() || !Adjacent(user))
		return
	var/list/options = list()
	options[open ? "Close the door" : "Open the door"] = "door"
	if(!open && length(microwave_contents))
		options["Cook"] = "cook"
	if(open)
		for(var/obj/item/item as anything in microwave_contents)
			options["Take [item.name]"] = item
	var/picked = tgui_input_list(user, "What would you like to do?", name, options)
	if(!picked || operating || !Adjacent(user) || user.is_mob_incapacitated())
		return
	var/choice = options[picked]
	if(choice == "door")
		open = !open
		playsound(src, 'sound/machines/click.ogg', 25, 1)
		update_icon()
	else if(choice == "cook")
		cook()
	else if(istype(choice, /obj/item) && (choice in microwave_contents))
		microwave_contents -= choice
		user.put_in_hands(choice)

/obj/structure/machinery/bastion_microwave/proc/cook()
	operating = TRUE
	update_icon()
	playsound(src, 'sound/machines/click.ogg', 25, 1)
	addtimer(CALLBACK(src, PROC_REF(finish_cooking)), 10 SECONDS)

/obj/structure/machinery/bastion_microwave/proc/finish_cooking()
	operating = FALSE
	if(QDELETED(src))
		return
	for(var/obj/item/item as anything in microwave_contents.Copy())
		if(!istype(item, /obj/item/food) || istype(item, /obj/item/food/badrecipe))
			continue
		var/obj/item/food/food_item = item
		var/result_type = food_item.microwave_result || /obj/item/food/badrecipe
		var/obj/item/result = new result_type(src)
		if(food_item.reagents?.total_volume && result.reagents && result_type != /obj/item/food/badrecipe)
			food_item.reagents.trans_to(result, food_item.reagents.total_volume)
		microwave_contents -= item
		microwave_contents += result
		qdel(item)
	update_icon()
	playsound(src, 'sound/machines/ding.ogg', 50, 1)
	visible_message(SPAN_NOTICE("\The [src] pings."))
