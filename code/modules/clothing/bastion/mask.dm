/obj/item/clothing/mask/bastion
	name = "mask"
	icon = 'icons/obj/items/clothing/bastion/masks.dmi'
	item_icons = list(
		WEAR_FACE = 'icons/mob/humans/onmob/clothing/bastion/mask.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/masks_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/masks_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_HEAD
	w_class = SIZE_MEDIUM
	slowdown = 0

/obj/item/clothing/mask/bastion/balaclava
	name = "balaclava"
	desc = "LOADSAMONEY"
	icon_state = "balaclava1"
	item_state = "balaclava"
	flags_inv_hide = HIDEFACE|HIDETOPHAIR
	w_class = SIZE_SMALL

/obj/item/clothing/mask/bastion/gas
	name = "gas mask"
	desc = "A face-covering mask that can be connected to an air supply. Good for concealing your identity and with a filter slot to help remove those toxins."
	icon_state = "gas_alt"
	item_state = "gas_alt"
	armor_bio = 100
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/bastion/gas/driscoll
	name = "driscoll mask"
	desc = "Great for train hijackings. Works like a normal full face gas mask, but won't conceal your identity."
	icon_state = "driscoll_mask"
	item_state = null

/obj/item/clothing/mask/bastion/surgical
	name = "sterile mask"
	desc = "A sterile mask designed to help prevent the spread of diseases."
	icon_state = "sterile"
	item_state = "s_mask"
	armor_bio = 100
	flags_inv_hide = HIDEFACE
	w_class = SIZE_TINY
