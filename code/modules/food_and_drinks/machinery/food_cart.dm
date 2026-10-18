/// A cart that unpacks into a food stand with a griddle, fridge, table and tent
/obj/structure/machinery/food_cart
	name = "food cart"
	desc = "A compact unpackable mobile cooking stand. Wow! When unpacked, it reminds you of those greasy gamer setups some people on the net have."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "foodcart"
	density = TRUE
	anchored = FALSE
	use_power = USE_POWER_NONE
	needs_power = FALSE
	var/unpacked = FALSE
	var/obj/structure/machinery/cooker/surface/stand/cart_griddle
	var/obj/structure/machinery/smartfridge/cart_fridge
	var/obj/structure/surface/table/reinforced/cart_table
	var/obj/effect/food_cart_stand/cart_tent
	var/list/packed_things

/obj/structure/machinery/food_cart/Initialize()
	. = ..()
	cart_griddle = new(src)
	cart_fridge = new(src)
	cart_table = new(src)
	cart_tent = new(src)
	packed_things = list(cart_table, cart_fridge, cart_tent, cart_griddle)

/obj/structure/machinery/food_cart/Destroy()
	if(unpacked)
		pack_up()
	QDEL_NULL(cart_griddle)
	QDEL_NULL(cart_fridge)
	QDEL_NULL(cart_table)
	QDEL_NULL(cart_tent)
	packed_things = null
	return ..()

/obj/structure/machinery/food_cart/proc/pack_up()
	if(!unpacked)
		return
	visible_message(SPAN_NOTICE("\The [src] retracts all of its unpacked components."))
	for(var/atom/movable/part as anything in packed_things)
		part.forceMove(src)
	anchored = FALSE
	unpacked = FALSE

/// The three tiles below the one east of the cart
/obj/structure/machinery/food_cart/proc/get_stand_turfs()
	var/turf/east_turf = get_step(get_turf(src), EAST)
	return list(
		get_step(east_turf, SOUTH),
		get_step(east_turf, SOUTHWEST),
		get_step(east_turf, SOUTHWEST),
		get_step(east_turf, SOUTHEAST),
	)

/obj/structure/machinery/food_cart/proc/has_room()
	for(var/turf/stand_turf as anything in get_stand_turfs())
		if(!stand_turf || stand_turf.density)
			return FALSE
		for(var/atom/blocker in stand_turf)
			if(blocker.density)
				return FALSE
	return TRUE

/obj/structure/machinery/food_cart/proc/unpack(mob/user)
	if(unpacked)
		return
	if(!has_room())
		to_chat(user, SPAN_WARNING("There isn't enough room to unpack here."))
		return
	visible_message(SPAN_NOTICE("\The [src] expands into a full stand."))
	anchored = TRUE
	var/list/stand_turfs = get_stand_turfs()
	for(var/index in 1 to length(packed_things))
		var/atom/movable/part = packed_things[index]
		part.forceMove(stand_turfs[index])
	unpacked = TRUE

/obj/structure/machinery/food_cart/attack_hand(mob/user)
	if(user.is_mob_incapacitated())
		return
	to_chat(user, SPAN_NOTICE("You start to [unpacked ? "pack up" : "unpack"] \the [src]..."))
	if(!do_after(user, 5 SECONDS, INTERRUPT_ALL, BUSY_ICON_BUILD, src))
		to_chat(user, SPAN_WARNING("You were interrupted."))
		return
	if(unpacked)
		pack_up()
	else
		unpack(user)

/obj/effect/food_cart_stand
	name = "food cart tent"
	desc = "Something to battle the sun, for there are no breaks for the burger flippers."
	icon = 'icons/obj/3x3.dmi'
	icon_state = "stand"
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
