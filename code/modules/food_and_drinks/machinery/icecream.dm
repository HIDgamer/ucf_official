GLOBAL_LIST_EMPTY(ice_cream_flavours)

/// A flavour of ice cream the vat can scoop
/datum/ice_cream_flavour
	var/name = "vanilla"
	var/icon_state = "icecream_vanilla"
	var/desc = "filled with vanilla ice cream. All the other ice creams take content from it."
	var/list/ingredients = list("milk", "ice", "vanilla")
	var/reagent_id
	var/reagent_amount = 3
	var/hidden = FALSE

/datum/ice_cream_flavour/vanilla
	name = "vanilla"
	reagent_id = "vanilla"

/datum/ice_cream_flavour/chocolate
	name = "chocolate"
	icon_state = "icecream_chocolate"
	desc = "filled with chocolate ice cream. Surprisingly, made with real cocoa."
	ingredients = list("milk", "ice", "coco")
	reagent_id = "coco"

/datum/ice_cream_flavour/strawberry
	name = "strawberry"
	icon_state = "icecream_strawberry"
	desc = "filled with strawberry ice cream. Definitely not made with real strawberries."
	ingredients = list("milk", "ice", "berryjuice")
	reagent_id = "berryjuice"

/datum/ice_cream_flavour/blue
	name = "blue"
	icon_state = "icecream_blue"
	desc = "filled with blue ice cream. Made with real... blue?"
	ingredients = list("milk", "ice", "singulo")
	reagent_id = "singulo"

/proc/get_ice_cream_flavours()
	if(length(GLOB.ice_cream_flavours))
		return GLOB.ice_cream_flavours
	for(var/path in subtypesof(/datum/ice_cream_flavour))
		var/datum/ice_cream_flavour/flavour = new path
		GLOB.ice_cream_flavours[flavour.name] = flavour
	return GLOB.ice_cream_flavours

/// Cones hold up to three scoops
/obj/item/food/icecream
	var/max_scoops = 3
	var/list/scoops = list()

/obj/item/food/icecream/proc/add_scoop(datum/ice_cream_flavour/flavour)
	if(length(scoops) >= max_scoops)
		return FALSE
	scoops += flavour.name
	reagents.maximum_volume += 20
	if(flavour.reagent_id)
		reagents.add_reagent(flavour.reagent_id, flavour.reagent_amount)
	reagents.add_reagent("sugar", 10)
	update_scoops()
	return TRUE

/obj/item/food/icecream/proc/update_scoops()
	overlays.Cut()
	var/offset = 0
	var/list/flavours = get_ice_cream_flavours()
	for(var/scoop in scoops)
		var/datum/ice_cream_flavour/flavour = flavours[scoop]
		var/image/scoop_image = image('icons/obj/kitchen.dmi', flavour.icon_state)
		scoop_image.pixel_y = offset
		overlays += scoop_image
		offset += 4
	if(!length(scoops))
		name = initial(name)
		desc = initial(desc)
		return
	var/list/unique = list()
	for(var/scoop in scoops)
		unique |= scoop
	if(length(scoops) > 1 && length(unique) == 1)
		name = "[length(scoops) == 2 ? "double" : "triple"] [scoops[1]] ice cream"
	else
		name = "[english_list(unique)] ice cream"
	var/datum/ice_cream_flavour/first = flavours[scoops[1]]
	desc = length(unique) == 1 ? "A delicious [initial(name)] [first.desc]" : "A delicious [initial(name)] filled with scoops of [english_list(scoops)] ice cream."

/// A vat that dispenses cones and scoops of ice cream
/obj/structure/machinery/icecream_vat
	name = "ice cream vat"
	desc = "Ding-aling ding dong. Get your ice cream!"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "icecream_vat"
	density = TRUE
	anchored = TRUE
	wrenchable = TRUE
	use_power = USE_POWER_NONE
	needs_power = FALSE
	flags_atom = OPENCONTAINER|NOREACT
	layer = BELOW_OBJ_LAYER
	var/selected_flavour = "vanilla"
	var/list/product_stock = list()
	var/static/list/cone_ingredients_by_path
	var/static/list/vat_reagents = list("milk" = 6, "flour" = 6, "sugar" = 6, "ice" = 6, "coco" = 6, "vanilla" = 6, "berryjuice" = 6, "singulo" = 6)

/obj/structure/machinery/icecream_vat/Initialize()
	. = ..()
	create_reagents(300)
	for(var/reagent_id in vat_reagents)
		reagents.add_reagent(reagent_id, vat_reagents[reagent_id])
	for(var/flavour_name in get_ice_cream_flavours())
		product_stock[flavour_name] = 5
	for(var/cone_path in get_cone_types())
		product_stock[cone_path] = 5

/// Typepath of each cone to the reagents it takes to make
/obj/structure/machinery/icecream_vat/proc/get_cone_types()
	var/list/cones = list()
	for(var/path in typesof(/obj/item/food/icecream))
		var/obj/item/food/icecream/cone = path
		if(length(initial(cone.ingredients)))
			cones += path
	return cones

/obj/structure/machinery/icecream_vat/attackby(obj/item/item, mob/user)
	if(istype(item, /obj/item/food/icecream))
		var/obj/item/food/icecream/cone = item
		if(length(cone.scoops) >= cone.max_scoops)
			to_chat(user, SPAN_WARNING("\The [cone] cannot hold any more ice cream."))
			return TRUE
		if(product_stock[selected_flavour] <= 0)
			to_chat(user, SPAN_WARNING("There is no [selected_flavour] ice cream left."))
			return TRUE
		var/datum/ice_cream_flavour/flavour = get_ice_cream_flavours()[selected_flavour]
		if(cone.add_scoop(flavour))
			product_stock[selected_flavour]--
			visible_message(SPAN_NOTICE("[user] scoops [selected_flavour] ice cream into \the [cone]."))
		return TRUE
	if(istype(item, /obj/item/reagent_container))
		return FALSE
	return ..()

/obj/structure/machinery/icecream_vat/attack_hand(mob/user)
	if(user.is_mob_incapacitated() || !Adjacent(user))
		return
	var/list/options = list()
	options["Choose the flavour (now [selected_flavour])"] = "select"
	for(var/flavour_name in get_ice_cream_flavours())
		options["Make [flavour_name] ice cream, [product_stock[flavour_name]] left"] = flavour_name
	for(var/cone_path in get_cone_types())
		var/obj/item/food/icecream/cone = cone_path
		options["Take a [initial(cone.name)], [product_stock[cone_path]] left"] = cone_path
		options["Make [initial(cone.name)]s"] = list("make", cone_path)
	var/picked = tgui_input_list(user, "What would you like to do?", name, options)
	if(!picked || !Adjacent(user) || user.is_mob_incapacitated())
		return
	var/choice = options[picked]
	if(choice == "select")
		var/new_flavour = tgui_input_list(user, "Which flavour?", name, get_ice_cream_flavours())
		if(new_flavour && Adjacent(user))
			selected_flavour = new_flavour
			visible_message(SPAN_NOTICE("[user] sets \the [src] to [selected_flavour]."))
	else if(istext(choice))
		make(user, choice, get_ice_cream_flavours()[choice].ingredients)
	else if(ispath(choice))
		if(product_stock[choice] <= 0)
			to_chat(user, SPAN_WARNING("There are none left."))
			return
		product_stock[choice]--
		var/obj/item/food/icecream/cone = new choice(get_turf(src))
		user.put_in_hands(cone)
	else if(islist(choice))
		var/cone_path = choice[2]
		var/obj/item/food/icecream/cone = cone_path
		make(user, cone_path, initial(cone.ingredients))

/obj/structure/machinery/icecream_vat/proc/make(mob/user, product, list/ingredients)
	for(var/reagent_id in ingredients)
		if(!reagents.has_reagent(reagent_id, 3))
			to_chat(user, SPAN_WARNING("The vat does not have the ingredients for that."))
			return FALSE
	for(var/reagent_id in ingredients)
		reagents.remove_reagent(reagent_id, 3)
	product_stock[product]++
	visible_message(SPAN_NOTICE("[user] whips up some more in \the [src]."))
	return TRUE
