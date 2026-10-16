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

/obj/item/clothing/mask/bastion/bandana
	name = "bandana"
	desc = "A fine bandana with nanotech lining."
	icon = 'icons/obj/items/clothing/bastion/greyscale/mask.dmi'
	icon_state = "bandana_2e2e2e"
	item_state = "greyscale_bandana_2e2e2e"
	item_icons = list(
		WEAR_FACE = 'icons/mob/humans/onmob/clothing/bastion/greyscale/mask.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/mask_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/mask_right.dmi',
	)
	flags_inv_hide = HIDEFACE
	w_class = SIZE_TINY

/obj/item/clothing/mask/bastion/bandana/purple
	name = "purple bandana"
	desc = "A fine purple bandana with nanotech lining."
	icon_state = "bandana_9900cc"
	item_state = "greyscale_bandana_9900cc"

/obj/item/clothing/mask/bastion/bandana/skull
	name = "skull bandana"
	desc = "A fine bandana with nanotech lining and a skull emblem."
	icon_state = "bandskull_2e2e2ec6c6c6"
	item_state = "greyscale_bandana_2e2e2ec6c6c6"

/obj/item/clothing/mask/bastion/bandana/skull/black
	desc = "A fine black bandana with nanotech lining and a skull emblem."

/obj/item/clothing/mask/bastion/bandana/striped
	name = "striped bandana"
	desc = "A fine bandana with nanotech lining and a stripe across."
	icon_state = "bandstriped_2e2e2ec6c6c6"
	item_state = "greyscale_bandana_2e2e2ec6c6c6"

/obj/item/clothing/mask/bastion/bandana/striped/botany
	name = "striped botany bandana"
	desc = "A fine bandana with nanotech lining, a stripe across and botany colors."
	icon_state = "bandstriped_3d9829294a98"
	item_state = "greyscale_bandana_3d9829294a98"

/obj/item/clothing/mask/bastion/bandana/striped/cargo
	name = "striped cargo bandana"
	desc = "A fine bandana with nanotech lining, a stripe across and cargo colors."
	icon_state = "bandstriped_9670325f350b"
	item_state = "greyscale_bandana_9670325f350b"

/obj/item/clothing/mask/bastion/bandana/striped/engineering
	name = "striped engineering bandana"
	desc = "A fine bandana with nanotech lining, a stripe across and engineering colors."
	icon_state = "bandstriped_dab50eec7404"
	item_state = "greyscale_bandana_dab50eec7404"

/obj/item/clothing/mask/bastion/bandana/striped/medical
	name = "striped medical bandana"
	desc = "A fine bandana with nanotech lining, a stripe across and medical colors."
	icon_state = "bandstriped_dcdcdc5995ba"
	item_state = "greyscale_bandana_dcdcdc5995ba"

/obj/item/clothing/mask/bastion/bandana/striped/science
	name = "striped science bandana"
	desc = "A fine bandana with nanotech lining, a stripe across and science colors."
	icon_state = "bandstriped_dcdcdc8019a0"
	item_state = "greyscale_bandana_dcdcdc8019a0"

/obj/item/clothing/mask/bastion/bandana/striped/security
	name = "striped security bandana"
	desc = "A fine bandana with nanotech lining, a stripe across and security colors."
	icon_state = "bandstriped_a025252e2e2e"
	item_state = "greyscale_bandana_a025252e2e2e"

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

/obj/item/clothing/mask/bastion/kitsune
	name = "kitsune mask"
	desc = "Porcelain mask made in the style of the Sol-3 region. It is painted to look like a kitsune."
	icon = 'icons/obj/items/clothing/bastion/greyscale/mask.dmi'
	icon_state = "kitsune_eeeeeeaa0000"
	item_icons = list(
		WEAR_FACE = 'icons/mob/humans/onmob/clothing/bastion/greyscale/mask.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/masks_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/masks_righthand.dmi',
	)
	flags_inv_hide = HIDEFACE
	w_class = SIZE_SMALL

/obj/item/clothing/mask/bastion/rebellion
	name = "rebellion mask"
	desc = "Mask that is usually used during rebellions by insurgents. It covers the entire face and makes you unrecognizable."
	icon = 'icons/obj/items/clothing/bastion/greyscale/mask.dmi'
	icon_state = "rebellion_mask_eeeeee"
	item_icons = list(
		WEAR_FACE = 'icons/mob/humans/onmob/clothing/bastion/greyscale/mask.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/masks_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/masks_righthand.dmi',
	)
	flags_inv_hide = HIDEFACE
	w_class = SIZE_SMALL

/obj/item/clothing/mask/bastion/surgical
	name = "sterile mask"
	desc = "A sterile mask designed to help prevent the spread of diseases."
	icon_state = "sterile"
	item_state = "s_mask"
	armor_bio = 100
	flags_inv_hide = HIDEFACE
	w_class = SIZE_TINY
