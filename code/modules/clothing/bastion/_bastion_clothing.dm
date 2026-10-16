// Clothing ported from Bastion-Station, the generated item files sit next to this one

/obj/item/clothing/suit/bastion
	/// Suits that switch between a closed and an open sprite
	var/toggle_capable = FALSE
	var/toggle_noun = "buttons"
	var/toggled = FALSE
	var/closed_icon_state

/obj/item/clothing/suit/bastion/Initialize(mapload)
	. = ..()
	closed_icon_state = icon_state

/obj/item/clothing/suit/bastion/attack_self(mob/user)
	. = ..()
	if(!toggle_capable)
		return
	toggled = !toggled
	icon_state = toggled ? "[closed_icon_state]_t" : closed_icon_state
	to_chat(user, SPAN_NOTICE("You [toggled ? "undo" : "do up"] the [toggle_noun] of [src]."))
	update_clothing_icon()

/obj/item/clothing/suit/bastion/toggle
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/// Winter coats and other suits with a hood that folds into them
/obj/item/clothing/suit/bastion/hooded
	actions_types = list(/datum/action/item_action/toggle)
	var/hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood
	var/hood_up_affix = "_t"
	var/hood_up = FALSE
	var/obj/item/clothing/head/bastion/hooded/hood

/obj/item/clothing/suit/bastion/hooded/Initialize(mapload)
	. = ..()
	if(hoodtype)
		hood = new hoodtype(src)
		hood.coat = src

/obj/item/clothing/suit/bastion/hooded/Destroy()
	if(hood)
		hood.coat = null
		QDEL_NULL(hood)
	return ..()

/obj/item/clothing/suit/bastion/hooded/attack_self(mob/user)
	. = ..()
	if(hood_up)
		remove_hood(user)
	else
		deploy_hood(user)

/obj/item/clothing/suit/bastion/hooded/proc/deploy_hood(mob/user)
	if(!hood)
		return
	var/mob/living/carbon/human/wearer = user
	if(!istype(wearer) || wearer.wear_suit != src)
		to_chat(user, SPAN_WARNING("You need to wear [src] first."))
		return
	if(wearer.head)
		to_chat(user, SPAN_WARNING("You can't put the hood up, your head is covered."))
		return
	if(!wearer.equip_to_slot_if_possible(hood, WEAR_HEAD))
		to_chat(user, SPAN_WARNING("You can't put the hood up."))
		return
	hood_up = TRUE
	icon_state = "[closed_icon_state][hood_up_affix]"
	update_clothing_icon()

/// Puts the hood back into the suit, the wearer gets nothing back on their head
/obj/item/clothing/suit/bastion/hooded/proc/remove_hood(mob/user)
	if(!hood)
		return
	hood_up = FALSE
	icon_state = closed_icon_state
	if(ismob(hood.loc))
		var/mob/hood_wearer = hood.loc
		hood_wearer.temp_drop_inv_item(hood)
	hood.forceMove(src)
	update_clothing_icon()

/obj/item/clothing/suit/bastion/hooded/unequipped(mob/user, slot)
	. = ..()
	if(hood_up)
		remove_hood(user)

/// Jackets and winter coats, worn in the suit slot or attached over armor like a poncho
/obj/item/clothing/accessory/poncho/bastion
	var/toggle_capable = FALSE
	var/toggle_noun = "buttons"
	var/toggled = FALSE
	var/closed_icon_state

/obj/item/clothing/accessory/poncho/bastion/Initialize(mapload)
	. = ..()
	closed_icon_state = icon_state
	inv_overlay = image(icon, icon_state = icon_state)

/obj/item/clothing/accessory/poncho/bastion/get_mob_overlay(mob/user_mob, slot, default_bodytype = "Default")
	if(!LAZYISIN(item_icons, slot))
		return ..()
	var/state = get_icon_state(user_mob, slot)
	if(ishuman(user_mob))
		var/mob/living/carbon/human/user_human = user_mob
		return user_human.species.get_offset_overlay_image(FALSE, item_icons[slot], state, color, slot)
	return overlay_image(item_icons[slot], state, color, RESET_COLOR)

/obj/item/clothing/accessory/poncho/bastion/update_clothing_icon()
	if(has_suit)
		has_suit.update_clothing_icon()
	else if(ismob(loc))
		var/mob/wearer = loc
		wearer.update_inv_wear_suit()

/obj/item/clothing/accessory/poncho/bastion/attack_self(mob/user)
	. = ..()
	if(!toggle_capable)
		return
	toggled = !toggled
	icon_state = toggled ? "[closed_icon_state]_t" : closed_icon_state
	to_chat(user, SPAN_NOTICE("You [toggled ? "undo" : "do up"] the [toggle_noun] of [src]."))
	update_clothing_icon()

/obj/item/clothing/accessory/poncho/bastion/toggle
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/accessory/poncho/bastion/hooded
	actions_types = list(/datum/action/item_action/toggle)
	var/hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood
	var/hood_up_affix = "_t"
	var/hood_up = FALSE
	var/obj/item/clothing/head/bastion/hooded/hood

/obj/item/clothing/accessory/poncho/bastion/hooded/Initialize(mapload)
	. = ..()
	if(hoodtype)
		hood = new hoodtype(src)
		hood.coat = src

/obj/item/clothing/accessory/poncho/bastion/hooded/Destroy()
	if(hood)
		hood.coat = null
		QDEL_NULL(hood)
	return ..()

/obj/item/clothing/accessory/poncho/bastion/hooded/attack_self(mob/user)
	. = ..()
	if(hood_up)
		remove_hood(user)
	else
		deploy_hood(user)

/obj/item/clothing/accessory/poncho/bastion/hooded/proc/deploy_hood(mob/user)
	if(!hood)
		return
	var/mob/living/carbon/human/wearer = user
	if(!istype(wearer) || wearer.wear_suit != src)
		to_chat(user, SPAN_WARNING("You need to wear [src] first."))
		return
	if(wearer.head)
		to_chat(user, SPAN_WARNING("You can't put the hood up, your head is covered."))
		return
	if(!wearer.equip_to_slot_if_possible(hood, WEAR_HEAD))
		to_chat(user, SPAN_WARNING("You can't put the hood up."))
		return
	hood_up = TRUE
	icon_state = "[closed_icon_state][hood_up_affix]"
	update_clothing_icon()

/// Puts the hood back into the coat, the wearer gets nothing back on their head
/obj/item/clothing/accessory/poncho/bastion/hooded/proc/remove_hood(mob/user)
	if(!hood)
		return
	hood_up = FALSE
	icon_state = closed_icon_state
	if(ismob(hood.loc))
		var/mob/hood_wearer = hood.loc
		hood_wearer.temp_drop_inv_item(hood)
	hood.forceMove(src)
	update_clothing_icon()

/obj/item/clothing/accessory/poncho/bastion/hooded/unequipped(mob/user, slot)
	. = ..()
	if(hood_up)
		remove_hood(user)

/// Hood belonging to a hooded suit or poncho coat
/obj/item/clothing/head/bastion/hooded
	var/obj/item/clothing/coat

/obj/item/clothing/head/bastion/hooded/Destroy()
	coat = null
	return ..()

/obj/item/clothing/head/bastion/hooded/unequipped(mob/user, slot)
	. = ..()
	if(coat && coat:hood_up)
		coat:remove_hood(user)

/obj/item/clothing/head/bastion/hooded/dropped(mob/user)
	. = ..()
	if(coat && coat:hood_up)
		coat:remove_hood(user)

/// Wardrobe vending machines
/obj/structure/machinery/vending/bastion
	icon = 'icons/obj/structures/machinery/bastion_vending.dmi'
