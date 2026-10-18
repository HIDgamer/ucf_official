/// Coffee cartridges, like toner but for coffee
/obj/item/coffee_cartridge
	name = "coffeemaker cartridge - Caffè Generico"
	desc = "A coffee cartridge manufactured by Piccionaia Coffee, for use with the Modello 3 system."
	icon = 'icons/obj/food/cartridges.dmi'
	icon_state = "cartridge_basic"
	w_class = SIZE_SMALL
	var/charges = 4
	var/list/drink_type = list("coffee" = 120)

/obj/item/coffee_cartridge/get_examine_text(mob/user)
	. = ..()
	if(charges)
		. += SPAN_WARNING("The cartridge has [charges] portions of grounds remaining.")
	else
		. += SPAN_WARNING("The cartridge has no unspent grounds remaining.")

/obj/item/coffee_cartridge/fancy
	name = "coffeemaker cartridge - Caffè Fantasioso"
	desc = "A fancy coffee cartridge manufactured by Piccionaia Coffee, for use with the Modello 3 system."
	icon_state = "cartridge_blend"

/obj/item/coffee_cartridge/decaf
	name = "coffeemaker cartridge - Caffè Decaffeinato"
	desc = "A decaf coffee cartridge manufactured by Piccionaia Coffee, for use with the Modello 3 system."
	icon_state = "cartridge_decaf"

/obj/item/coffee_cartridge/bootleg
	name = "coffeemaker cartridge - Botany Blend"
	desc = "A jury-rigged coffee cartridge. Should work with a Modello 3 system, though it might void the warranty."
	icon_state = "cartridge_bootleg"

/// The pot the coffeemaker brews into
/obj/item/reagent_container/glass/coffeepot
	name = "coffeepot"
	desc = "A nice and sturdy coffeepot."
	icon = 'icons/obj/medical/chemical.dmi'
	icon_state = "coffeepot"
	volume = 120
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10, 15, 25, 30, 60, 120)
	splashable = FALSE
	has_lid = FALSE

/// Packets for the coffee
/obj/item/reagent_container/food/condiment/bastion/sugar_packet
	name = "sugar packet"
	desc = "Contains 5u of sugar."
	icon_state = "generic_condiment"
	fill_reagent = "sugar"
	fill_amount = 5
	volume = 5
	w_class = SIZE_TINY

/obj/item/reagent_container/food/condiment/bastion/creamer_packet
	name = "creamer packet"
	desc = "Contains 5u of creamer."
	icon_state = "generic_condiment"
	fill_reagent = "cream"
	fill_amount = 5
	volume = 5
	w_class = SIZE_TINY

/obj/item/reagent_container/food/condiment/bastion/sweetener_packet
	name = "sweetener packet"
	desc = "Contains 5u of sweetener."
	icon_state = "generic_condiment"
	fill_reagent = "sugar"
	fill_amount = 5
	volume = 5
	w_class = SIZE_TINY

/// A machine that brews coffee from cartridges into a pot
/obj/structure/machinery/coffeemaker
	name = "coffeemaker"
	desc = "A Modello 3 Coffeemaker that brews coffee and holds it at the perfect temperature of 176 fahrenheit. Made by Piccionaia Home Appliances."
	icon = 'icons/obj/medical/chemical.dmi'
	icon_state = "coffeemaker_nopot_nocart"
	density = FALSE
	anchored = TRUE
	wrenchable = TRUE
	use_power = USE_POWER_NONE
	needs_power = FALSE
	var/obj/item/reagent_container/glass/coffeepot/coffeepot
	var/obj/item/coffee_cartridge/cartridge
	var/brewing = FALSE
	var/brew_time = 20 SECONDS
	var/coffee_cups = 15
	var/max_coffee_cups = 15
	var/sugar_packs = 10
	var/sweetener_packs = 10
	var/creamer_packs = 10
	var/particle_type

/obj/structure/machinery/coffeemaker/Initialize()
	. = ..()
	coffeepot = new(src)
	cartridge = new(src)
	update_icon()

/obj/structure/machinery/coffeemaker/Destroy()
	QDEL_NULL(coffeepot)
	QDEL_NULL(cartridge)
	remove_shared_particles("smoke_coffeemaker")
	return ..()

/obj/structure/machinery/coffeemaker/update_icon()
	overlays.Cut()
	if(coffeepot)
		overlays += image(icon, src, "coffeemaker_pot")
	if(cartridge)
		overlays += image(icon, src, "coffeemaker_cartidge")

/obj/structure/machinery/coffeemaker/get_examine_text(mob/user)
	. = ..()
	if(brewing)
		. += SPAN_WARNING("It is brewing.")
	if(coffeepot)
		. += SPAN_NOTICE("It holds a coffeepot with [coffeepot.reagents.total_volume] units in it.")
	if(cartridge)
		. += SPAN_NOTICE("The cartridge has [cartridge.charges] charges left.")
	. += SPAN_NOTICE("There are [coffee_cups] cups, [sugar_packs] sugar, [sweetener_packs] sweetener and [creamer_packs] creamer packets left.")

/obj/structure/machinery/coffeemaker/attackby(obj/item/item, mob/user)
	if(HAS_TRAIT(item, TRAIT_TOOL_WRENCH))
		return ..()
	if(brewing)
		to_chat(user, SPAN_WARNING("\The [src] is brewing."))
		return TRUE
	if(istype(item, /obj/item/reagent_container/glass/coffeepot))
		if(coffeepot)
			to_chat(user, SPAN_WARNING("There is already a pot in \the [src]."))
			return TRUE
		if(user.drop_inv_item_to_loc(item, src))
			coffeepot = item
			update_icon()
		return TRUE
	if(istype(item, /obj/item/coffee_cartridge))
		if(cartridge)
			to_chat(user, SPAN_WARNING("There is already a cartridge in \the [src]."))
			return TRUE
		if(user.drop_inv_item_to_loc(item, src))
			cartridge = item
			update_icon()
		return TRUE
	if(istype(item, /obj/item/reagent_container/food/drinks/coffeecup))
		if(item.reagents.total_volume > 0)
			to_chat(user, SPAN_WARNING("The cup must be empty."))
			return TRUE
		if(coffee_cups >= max_coffee_cups)
			to_chat(user, SPAN_WARNING("The cup holder is full."))
			return TRUE
		if(user.drop_inv_item_to_loc(item, src))
			qdel(item)
			coffee_cups++
		return TRUE
	if(istype(item, /obj/item/reagent_container))
		return FALSE
	return ..()

/obj/structure/machinery/coffeemaker/attack_hand(mob/user)
	if(user.is_mob_incapacitated() || !Adjacent(user) || brewing)
		return
	var/list/options = list("Brew" = "brew")
	if(coffeepot)
		options["Eject the pot"] = "pot"
	if(cartridge)
		options["Eject the cartridge"] = "cartridge"
	if(coffee_cups > 0)
		options["Take a cup"] = "cup"
	if(sugar_packs > 0)
		options["Take sugar"] = "sugar"
	if(sweetener_packs > 0)
		options["Take sweetener"] = "sweetener"
	if(creamer_packs > 0)
		options["Take creamer"] = "creamer"
	var/picked = tgui_input_list(user, "What would you like to do?", name, options)
	if(!picked || !Adjacent(user) || user.is_mob_incapacitated() || brewing)
		return
	switch(options[picked])
		if("brew")
			brew(user)
		if("pot")
			user.put_in_hands(coffeepot)
			coffeepot = null
			update_icon()
		if("cartridge")
			user.put_in_hands(cartridge)
			cartridge = null
			update_icon()
		if("cup")
			coffee_cups--
			user.put_in_hands(new /obj/item/reagent_container/food/drinks/coffeecup(get_turf(src)))
		if("sugar")
			sugar_packs--
			user.put_in_hands(new /obj/item/reagent_container/food/condiment/bastion/sugar_packet(get_turf(src)))
		if("sweetener")
			sweetener_packs--
			user.put_in_hands(new /obj/item/reagent_container/food/condiment/bastion/sweetener_packet(get_turf(src)))
		if("creamer")
			creamer_packs--
			user.put_in_hands(new /obj/item/reagent_container/food/condiment/bastion/creamer_packet(get_turf(src)))

/obj/structure/machinery/coffeemaker/proc/can_brew(mob/user)
	if(!cartridge)
		to_chat(user, SPAN_WARNING("There is no coffee cartridge inserted."))
		return FALSE
	if(cartridge.charges < 1)
		to_chat(user, SPAN_WARNING("The coffee cartridge is empty."))
		return FALSE
	if(!coffeepot)
		to_chat(user, SPAN_WARNING("There is no coffeepot inside."))
		return FALSE
	if(coffeepot.reagents.total_volume >= coffeepot.reagents.maximum_volume)
		to_chat(user, SPAN_WARNING("The coffeepot is already full."))
		return FALSE
	return TRUE

/obj/structure/machinery/coffeemaker/proc/brew(mob/user)
	if(!can_brew(user))
		return
	brewing = TRUE
	playsound(src, 'sound/machines/coffeemaker_brew.ogg', 20, 1)
	var/obj/effect/abstract/shared_particle_holder/steam = add_shared_particles(/particles/smoke/steam/mild, "smoke_coffeemaker")
	particle_type = "smoke_coffeemaker"
	if(steam)
		steam.particles.position = list(-6, 0, 0)
	addtimer(CALLBACK(src, PROC_REF(finish_brewing)), brew_time)

/obj/structure/machinery/coffeemaker/proc/finish_brewing()
	brewing = FALSE
	if(particle_type)
		remove_shared_particles(particle_type)
		particle_type = null
	if(QDELETED(src) || !coffeepot || !cartridge || cartridge.charges < 1)
		return
	for(var/reagent_id in cartridge.drink_type)
		coffeepot.reagents.add_reagent(reagent_id, cartridge.drink_type[reagent_id])
	cartridge.charges--
	playsound(src, 'sound/machines/ding.ogg', 25, 1)
	visible_message(SPAN_NOTICE("\The [src] finishes brewing."))
