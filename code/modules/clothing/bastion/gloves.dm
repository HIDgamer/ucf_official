/obj/item/clothing/gloves/bastion
	name = "gloves"
	icon = 'icons/obj/items/clothing/bastion/gloves.dmi'
	item_state = "greyscale_gloves"
	item_icons = list(
		WEAR_HANDS = 'icons/mob/humans/onmob/clothing/bastion/hands.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/gloves_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/gloves_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_HANDS
	w_class = SIZE_SMALL
	slowdown = 0

/obj/item/clothing/gloves/bastion/civilprotection_gloves
	name = "civil protection gloves"
	desc = "Armored gloves for beating anticitizens."
	icon_state = "civilprotection_gloves"
	item_state = "greyscale_gloves_"
	item_icons = list(
		WEAR_HANDS = 'icons/mob/humans/onmob/clothing/bastion/hands.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_right.dmi',
	)

/obj/item/clothing/gloves/bastion/color/black
	name = "black gloves"
	desc = "These gloves are fire-resistant."
	icon_state = "black"
	item_state = "greyscale_gloves_2f2e31"
	item_icons = list(
		WEAR_HANDS = 'icons/mob/humans/onmob/clothing/bastion/hands.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_right.dmi',
	)

/obj/item/clothing/gloves/bastion/color/black/security
	name = "security gloves"
	desc = "These security gloves come with microchips that help the user quickly restrain suspects."
	icon_state = "sec"

/obj/item/clothing/gloves/bastion/color/black/security/blu
	icon_state = "sec_blu"

/obj/item/clothing/gloves/bastion/color/grey/protects_cold
	name = "\proper Endotherm gloves"
	desc = "A pair of thick grey gloves, lined to protect the wearer from freezing cold."
	icon_state = "gray"
	item_state = "greyscale_gloves_999999"
	item_icons = list(
		WEAR_HANDS = 'icons/mob/humans/onmob/clothing/bastion/hands.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_right.dmi',
	)
	w_class = SIZE_MEDIUM

/obj/item/clothing/gloves/bastion/combat
	name = "combat gloves"
	desc = "These tactical gloves are fireproof and electrically insulated."
	icon = 'icons/obj/items/clothing/bastion/monke/gloves.dmi'
	icon_state = "combat"
	item_state = "greyscale_gloves_2f2e31"
	item_icons = list(
		WEAR_HANDS = 'icons/mob/humans/onmob/clothing/bastion/monke/hands.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_right.dmi',
	)
	armor_bio = 90

/obj/item/clothing/gloves/bastion/fingerless
	name = "fingerless gloves"
	desc = "Plain black gloves without fingertips for the hard working."
	icon_state = "fingerless"
	item_state = "greyscale_gloves_2f2e31"
	item_icons = list(
		WEAR_HANDS = 'icons/mob/humans/onmob/clothing/bastion/hands.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_right.dmi',
	)

/obj/item/clothing/gloves/bastion/kim
	name = "aerostatic gloves"
	desc = "Breathable red gloves for expert handling of a pen and notebook."
	icon_state = "aerostatic_gloves"
	item_state = "greyscale_gloves_a63814"
	item_icons = list(
		WEAR_HANDS = 'icons/mob/humans/onmob/clothing/bastion/hands.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_right.dmi',
	)

/obj/item/clothing/gloves/bastion/latex
	name = "latex gloves"
	desc = "Cheap sterile gloves made from latex. Provides quicker carrying from a good grip. Its sterile material makes it great for surgery."
	icon_state = "latex"
	item_state = "latex_gloves_"
	item_icons = list(
		WEAR_HANDS = 'icons/mob/humans/onmob/clothing/bastion/hands.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/gloves_right.dmi',
	)
	armor_bio = 100

/obj/item/clothing/gloves/bastion/latex/nitrile
	name = "nitrile gloves"
	desc = "Pricy sterile gloves that are thicker than latex. Excellent grip ensures very fast carrying of patients along with the faster use time of various chemical related items. Its sterile material makes it great for surgery."
	icon_state = "nitrile"
	item_state = "greyscale_gloves_99eeff"
