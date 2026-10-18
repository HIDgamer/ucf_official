/// Cooking equipment, food goes in, is picked from a menu and is replaced by its cooked version over time
/obj/structure/machinery/cooker
	name = "cooker"
	icon = 'icons/obj/machines/kitchenmachines.dmi'
	density = TRUE
	anchored = TRUE
	wrenchable = TRUE
	use_power = USE_POWER_NONE
	needs_power = FALSE
	layer = BELOW_OBJ_LAYER
	/// Food that is cooking right now
	var/list/cooking = list()
	var/max_items = 8
	var/on = FALSE
	var/last_cook_time = 0
	var/cook_loop_type
	var/datum/looping_sound/cook_loop
	var/particle_type

/obj/structure/machinery/cooker/Initialize()
	. = ..()
	if(cook_loop_type)
		cook_loop = new cook_loop_type(src, FALSE)

/obj/structure/machinery/cooker/Destroy()
	dump_cooking()
	QDEL_NULL(cook_loop)
	set_particles(null)
	return ..()

/// Whether the cooker is heating food right now
/obj/structure/machinery/cooker/proc/is_active()
	return on && length(cooking)

/obj/structure/machinery/cooker/proc/has_burnt_food()
	for(var/obj/item/item as anything in cooking)
		if(istype(item, /obj/item/food/badrecipe))
			return TRUE
	return FALSE

/// Starts and stops the cooking sounds and steam
/obj/structure/machinery/cooker/proc/update_effects()
	var/active = is_active()
	if(cook_loop)
		if(active)
			cook_loop.start()
		else
			cook_loop.stop()
	if(!active)
		set_particles(null)
	else if(has_burnt_food())
		set_particles(/particles/smoke/steam/bad)
	else
		set_particles(/particles/smoke/steam/mild)

/obj/structure/machinery/cooker/proc/set_particles(new_type)
	if(new_type == particle_type)
		return
	if(particle_type)
		remove_shared_particles(particle_type)
	particle_type = new_type
	if(particle_type)
		add_shared_particles(particle_type)

/// How far along an item is, 0 to 1, or null when it is not cooking
/obj/structure/machinery/cooker/proc/get_progress(obj/item/item)
	return null

/obj/structure/machinery/cooker/proc/get_progress_text(obj/item/item)
	if(istype(item, /obj/item/food/badrecipe))
		return "burnt"
	var/progress = get_progress(item)
	if(isnull(progress))
		return "done"
	if(progress < 0.34)
		return "raw"
	if(progress < 0.67)
		return "cooking"
	return "almost done"

/// The component that tells this cooker how an item cooks, null when it does not cook here
/obj/structure/machinery/cooker/proc/get_cook_component(obj/item/item)
	return null

/// Whether this item may go in, cooking or not
/obj/structure/machinery/cooker/proc/accepts_item(obj/item/item)
	return istype(item, /obj/item/reagent_container/food/snacks)

/obj/structure/machinery/cooker/proc/add_item(obj/item/item, mob/user)
	if(length(cooking) >= max_items)
		to_chat(user, SPAN_WARNING("\The [src] cannot fit any more."))
		return FALSE
	if(user && !user.drop_inv_item_to_loc(item, src))
		return FALSE
	if(!user)
		item.forceMove(src)
	cooking += item
	item.pixel_x = rand(-10, 10)
	item.pixel_y = rand(-8, 8)
	show_cooking_item(item)
	if(user)
		to_chat(user, SPAN_NOTICE("You put \the [item] in \the [src]."))
		playsound(src, 'sound/machines/click.ogg', 25, 1)
	if(on)
		start_processing()
	update_effects()
	update_icon()
	return TRUE

/obj/structure/machinery/cooker/proc/show_cooking_item(obj/item/item)
	return

/obj/structure/machinery/cooker/proc/hide_cooking_item(obj/item/item)
	return

/obj/structure/machinery/cooker/proc/remove_item(obj/item/item, mob/user)
	cooking -= item
	hide_cooking_item(item)
	item.pixel_x = initial(item.pixel_x)
	item.pixel_y = initial(item.pixel_y)
	if(user)
		user.put_in_hands(item)
		to_chat(user, SPAN_NOTICE("You take \the [item] from \the [src]."))
	else
		item.forceMove(get_turf(src))
	update_effects()
	update_icon()

/obj/structure/machinery/cooker/proc/dump_cooking()
	for(var/obj/item/item as anything in cooking)
		remove_item(item)

/obj/structure/machinery/cooker/proc/set_on(new_on)
	on = new_on
	last_cook_time = world.time
	if(on && length(cooking))
		start_processing()
	update_effects()
	update_icon()

/obj/structure/machinery/cooker/attackby(obj/item/item, mob/user)
	if(HAS_TRAIT(item, TRAIT_TOOL_WRENCH))
		return ..()
	if(istype(item, /obj/item/reagent_container) && !istype(item, /obj/item/reagent_container/food/snacks))
		return FALSE
	if(!accepts_item(item))
		to_chat(user, SPAN_WARNING("\The [src] is not for cooking that."))
		return TRUE
	if(!get_cook_component(item))
		to_chat(user, SPAN_WARNING("\The [item] will not cook in \the [src]."))
		return TRUE
	add_item(item, user)
	return TRUE

/// Entries of the menu shown to someone using the cooker
/obj/structure/machinery/cooker/proc/get_menu_options(mob/user)
	var/list/options = list()
	options[on ? "Turn off" : "Turn on"] = "toggle"
	for(var/obj/item/item as anything in cooking)
		options["Take [item.name]"] = item
	return options

/obj/structure/machinery/cooker/proc/handle_menu_choice(choice, mob/user)
	if(choice == "toggle")
		set_on(!on)
		to_chat(user, SPAN_NOTICE("You turn \the [src] [on ? "on" : "off"]."))
		return TRUE
	if(istype(choice, /obj/item) && (choice in cooking))
		remove_item(choice, user)
		return TRUE
	return FALSE

/obj/structure/machinery/cooker/attack_hand(mob/user)
	if(user.is_mob_incapacitated() || !Adjacent(user))
		return
	var/list/options = get_menu_options(user)
	if(!length(options))
		return
	var/picked = tgui_input_list(user, "What would you like to do?", name, options)
	if(!picked || !Adjacent(user) || user.is_mob_incapacitated())
		return
	handle_menu_choice(options[picked], user)

/obj/structure/machinery/cooker/process()
	if(!on || !length(cooking))
		stop_processing()
		return
	var/delta = world.time - last_cook_time
	last_cook_time = world.time
	for(var/obj/item/item as anything in cooking.Copy())
		var/datum/component/comp = get_cook_component(item)
		if(!comp)
			continue
		var/obj/item/result = cook_item(item, comp, delta)
		if(result)
			cooked(item, result)

/// Advances cooking of one item, returns what it turned into when finished
/obj/structure/machinery/cooker/proc/cook_item(obj/item/item, datum/component/comp, delta)
	return null

/obj/structure/machinery/cooker/proc/cooked(obj/item/old_item, obj/item/result)
	var/index = cooking.Find(old_item)
	if(index)
		cooking[index] = result
	else
		cooking += result
	result.forceMove(src)
	show_cooking_item(result)
	visible_message(SPAN_NOTICE("\The [src] finishes cooking \the [result]."))
	playsound(src, 'sound/machines/ding.ogg', 25, 1)
	update_effects()
	update_icon()

/obj/structure/machinery/cooker/get_examine_text(mob/user)
	. = ..()
	for(var/obj/item/item as anything in cooking)
		. += SPAN_NOTICE("\The [item] is [get_progress_text(item)].")
	. += SPAN_NOTICE("It is [on ? "on" : "off"].")

/// Grills and griddles, food sits on top in plain sight
/obj/structure/machinery/cooker/surface
	name = "griddle"
	desc = "Because using pans is for pansies."
	icon_state = "griddle1_off"
	cook_loop_type = /datum/looping_sound/grill
	var/variant = 1

/obj/structure/machinery/cooker/surface/Initialize()
	. = ..()
	variant = rand(1, 3)
	update_icon()

/obj/structure/machinery/cooker/surface/get_cook_component(obj/item/item)
	return item.GetComponent(/datum/component/grillable)

/obj/structure/machinery/cooker/surface/get_progress(obj/item/item)
	var/datum/component/grillable/comp = get_cook_component(item)
	if(!comp)
		return null
	return comp.current_cook_time / comp.required_cook_time

/obj/structure/machinery/cooker/surface/show_cooking_item(obj/item/item)
	vis_contents |= item

/obj/structure/machinery/cooker/surface/hide_cooking_item(obj/item/item)
	vis_contents -= item

/obj/structure/machinery/cooker/surface/cook_item(obj/item/item, datum/component/grillable/comp, delta)
	return comp.cook(delta)

/obj/structure/machinery/cooker/surface/update_icon()
	icon_state = "griddle[variant]_[on ? "on" : "off"]"

/obj/structure/machinery/cooker/surface/stand
	name = "griddle stand"
	desc = "A more commercialized version of your traditional griddle. What happened to the good old days where people griddled with passion?"
	variant = "stand"

/obj/structure/machinery/cooker/surface/stand/Initialize()
	. = ..()
	variant = "stand"
	update_icon()

/obj/structure/machinery/cooker/surface/grill
	name = "grill"
	desc = "Burgers, steaks and good company. Something is always cooking on a grill."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "grill_open"

/obj/structure/machinery/cooker/surface/grill/Initialize()
	. = ..()
	update_icon()

/obj/structure/machinery/cooker/surface/grill/update_icon()
	if(on)
		icon_state = "grill_on"
	else if(length(cooking))
		icon_state = "grill"
	else
		icon_state = "grill_open"

/// Ovens, food is hidden behind the door while it bakes
/obj/structure/machinery/cooker/oven
	name = "oven"
	desc = "Why do they call it oven when you of in the cold food of out hot eat the food?"
	icon_state = "oven_off"
	max_items = 6
	cook_loop_type = /datum/looping_sound/oven
	var/open = FALSE

/obj/structure/machinery/cooker/oven/Initialize()
	. = ..()
	update_icon()

/obj/structure/machinery/cooker/oven/get_cook_component(obj/item/item)
	return item.GetComponent(/datum/component/bakeable)

/obj/structure/machinery/cooker/oven/is_active()
	return ..() && !open

/obj/structure/machinery/cooker/oven/get_progress(obj/item/item)
	var/datum/component/bakeable/comp = get_cook_component(item)
	if(!comp)
		return null
	return comp.current_bake_time / comp.required_bake_time

/obj/structure/machinery/cooker/oven/accepts_item(obj/item/item)
	return istype(item, /obj/item/reagent_container/food/snacks) && open

/obj/structure/machinery/cooker/oven/attackby(obj/item/item, mob/user)
	if(!open && !HAS_TRAIT(item, TRAIT_TOOL_WRENCH))
		to_chat(user, SPAN_WARNING("Open the door of \the [src] first."))
		return TRUE
	return ..()

/obj/structure/machinery/cooker/oven/get_menu_options(mob/user)
	var/list/options = list()
	options[open ? "Close the door" : "Open the door"] = "door"
	if(open)
		for(var/obj/item/item as anything in cooking)
			options["Take [item.name]"] = item
	return options

/obj/structure/machinery/cooker/oven/handle_menu_choice(choice, mob/user)
	if(choice == "door")
		open = !open
		set_on(!open && length(cooking))
		to_chat(user, SPAN_NOTICE("You [open ? "open" : "close"] the door of \the [src]."))
		playsound(src, open ? 'sound/machines/oven/oven_open.ogg' : 'sound/machines/oven/oven_close.ogg', 50, 1)
		return TRUE
	if(!open)
		return FALSE
	return ..()

/obj/structure/machinery/cooker/oven/cook_item(obj/item/item, datum/component/bakeable/comp, delta)
	return comp.cook(delta)

/obj/structure/machinery/cooker/oven/update_icon()
	icon_state = "oven_[on && length(cooking) ? "on" : "off"]"
	overlays.Cut()
	if(open)
		var/image/lid = image(icon, src, "oven_lid_open")
		lid.pixel_y = -15
		overlays += lid
	else
		overlays += image(icon, src, "oven_lid_closed")

/// Deep fryers, food needs a vat of oil
/obj/structure/machinery/cooker/fryer
	name = "deep fryer"
	desc = "Deep fried everything. Needs a vat of cooking oil."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "fryer_off"
	flags_atom = OPENCONTAINER
	max_items = 4
	cook_loop_type = /datum/looping_sound/deep_fryer
	/// Oil needed to run
	var/oil_needed = 25
	/// How long food takes to fry and to burn, in deciseconds
	var/fry_time = 15 SECONDS
	var/burn_time = FOOD_FRYER_BURN_TIME

/obj/structure/machinery/cooker/fryer/Initialize()
	. = ..()
	create_reagents(50)
	update_icon()

/obj/structure/machinery/cooker/fryer/proc/has_oil()
	return reagents.get_reagent_amount("cornoil") >= oil_needed

/obj/structure/machinery/cooker/fryer/get_cook_component(obj/item/item)
	return istype(item, /obj/item/food) ? item : null

/obj/structure/machinery/cooker/fryer/get_progress(obj/item/item)
	var/obj/item/food/food_item = item
	if(food_item.fry_progress >= fry_time)
		return null
	return food_item.fry_progress / fry_time

/obj/structure/machinery/cooker/fryer/accepts_item(obj/item/item)
	return istype(item, /obj/item/food)

/obj/structure/machinery/cooker/fryer/add_item(obj/item/item, mob/user)
	if(!has_oil())
		to_chat(user, SPAN_WARNING("\The [src] needs at least [oil_needed] units of cooking oil."))
		return FALSE
	return ..()

/obj/structure/machinery/cooker/fryer/set_on(new_on)
	if(new_on && !has_oil())
		new_on = FALSE
	..(new_on)

/obj/structure/machinery/cooker/fryer/handle_menu_choice(choice, mob/user)
	if(choice == "toggle" && !on && !has_oil())
		to_chat(user, SPAN_WARNING("\The [src] needs at least [oil_needed] units of cooking oil."))
		return TRUE
	return ..()

/obj/structure/machinery/cooker/fryer/cook_item(obj/item/food/food_item, comp, delta)
	food_item.fry_progress += delta
	if(food_item.fry_progress >= burn_time)
		var/obj/item/food/badrecipe/burnt = new(src)
		qdel(food_item)
		return burnt
	if(food_item.fry_progress >= fry_time)
		food_item.become_fried()
	return null

/obj/structure/machinery/cooker/fryer/update_icon()
	icon_state = on && length(cooking) ? "fryer_on" : "fryer_off"

/// What deep frying does to food
/obj/item/food/proc/become_fried()
	if(foodtypes & FRIED)
		return
	foodtypes |= FRIED
	name = "deep fried [name]"
	color = "#d9a066"
	if(reagents)
		reagents.add_reagent("nutriment", 2)
		reagents.add_reagent("cornoil", 1)
