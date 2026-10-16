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
		hood.suit = src

/obj/item/clothing/suit/bastion/hooded/Destroy()
	if(hood)
		hood.suit = null
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

/obj/item/clothing/head/bastion/hooded
	var/obj/item/clothing/suit/bastion/hooded/suit

/obj/item/clothing/head/bastion/hooded/Destroy()
	suit = null
	return ..()

/obj/item/clothing/head/bastion/hooded/unequipped(mob/user, slot)
	. = ..()
	if(suit?.hood_up)
		suit.remove_hood(user)

/obj/item/clothing/head/bastion/hooded/dropped(mob/user)
	. = ..()
	if(suit?.hood_up)
		suit.remove_hood(user)

/// Wardrobe vending machines
/obj/structure/machinery/vending/bastion
	icon = 'icons/obj/structures/machinery/bastion_vending.dmi'
