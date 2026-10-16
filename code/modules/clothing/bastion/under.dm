/obj/item/clothing/under/bastion
	name = "under"
	icon = 'icons/obj/items/clothing/bastion/under/default.dmi'
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/default.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_bio = 10
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	w_class = SIZE_MEDIUM
	slowdown = 0

/obj/item/clothing/under/bastion/artisan
	name = "culinary artisan's uniform"
	desc = "For the chef who knows what their doing and cooks with ethically sourced monkey meat"
	icon = 'icons/obj/items/clothing/bastion/uniforms.dmi'
	icon_state = "artisan"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/uniform.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/civilprotection_uniform
	name = "civil protection's uniform"
	desc = "Suspect, prepare to receive civil judgement!"
	icon = 'icons/obj/items/clothing/bastion/uniforms.dmi'
	icon_state = "civilprotection_uniform"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/uniform.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/color/red
	name = "red jumpsuit"
	desc = "A standard issue colored jumpsuit. Variety is the spice of life!"
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "jumpsuit_eb0c07"
	item_state = "jumpsuit_eb0c07"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/under_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/under_right.dmi',
	)

/obj/item/clothing/under/bastion/costume/buttondown/shorts
	name = "button-down shirt with shorts"
	desc = "A fancy button-down shirt with shorts."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "buttondown_shorts_eeeeeeee8e2e222227d8d39c"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/buttondown/slacks
	name = "button-down shirt with slacks"
	desc = "A fancy button-down shirt with slacks."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "buttondown_slacks_eeeeeeee8e2e222227d8d39c"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/citizen_uniform
	name = "citizen uniform"
	desc = "A blue matching uniform. It makes you feel like you're in a labor camp."
	icon = 'icons/obj/items/clothing/bastion/uniforms.dmi'
	icon_state = "citizen_uniform"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/uniform.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/cop_mascot
	name = "policeman mascot suit"
	desc = "A blue police mascot suit. On the chest is a star badge with an eye in the middle. You feel like you should be chopping people apart with power tools while wearing this."
	icon = 'icons/obj/items/clothing/bastion/uniforms.dmi'
	icon_state = "cop_mascot"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/uniform.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_HANDS|BODY_FLAG_FEET
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_HANDS|BODY_FLAG_FEET
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS|BODY_FLAG_HANDS|BODY_FLAG_FEET

/obj/item/clothing/under/bastion/costume/donatorgrayscaleturtleneck/nondonator
	name = "turtleneck with pants"
	desc = "A turtleneck with a pair of pants, this one is easily dyeable."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "donatorgrayscaleturtleneck_8cd4a2404577"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/dutch
	name = "dutch's suit"
	desc = "You can feel a <b>god damn plan</b> coming on."
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "DutchUniform"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/football_suit
	name = "football uniform"
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "football_suit_d74722"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/geisha
	name = "geisha suit"
	desc = "Cute space ninja senpai not included."
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "geisha"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/costume/jabroni
	name = "jabroni outfit"
	desc = "The leather club is two sectors down."
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "darkholme"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/kilt
	name = "kilt"
	desc = "Includes shoes and plaid."
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "kilt"
	item_state = "kilt"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET

/obj/item/clothing/under/bastion/costume/kimono
	name = "black kimono"
	desc = "A luxurious black silk kimono with traditional flair, ideal for elegant festive occasions."
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "kimono1"
	item_state = "yukata1"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/costume/kimono/purple
	name = "purple kimono"
	desc = "A luxurious purple silk kimono with traditional flair, ideal for elegant festive occasions."
	icon_state = "kimono3"
	item_state = "kimono3"

/obj/item/clothing/under/bastion/costume/kimono/red
	name = "red kimono"
	desc = "A luxurious red silk kimono with traditional flair, ideal for elegant festive occasions."
	icon_state = "kimono2"
	item_state = "kimono2"

/obj/item/clothing/under/bastion/costume/mech_suit
	name = "mech pilot's suit"
	desc = "A mech pilot's suit. Might make your butt look big."
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "red_mech_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS

/obj/item/clothing/under/bastion/costume/osi
	name = "O.S.I. jumpsuit"
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "osi_jumpsuit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/playbunny
	name = "bunny suit"
	desc = "The staple of any bunny themed waiters and the like. It has a little cottonball tail too."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "playbunny_39393f39393fffffff87502e"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/costume/soviet
	name = "soviet uniform"
	desc = "For the Motherland!"
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "soviet"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/swagoutfit
	name = "Swag outfit"
	desc = "Why don't you go secure some bitches?"
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "SwagOutfit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/tmc
	name = "Lost MC clothing"
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "tmc_jumpsuit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/costume/yukata
	name = "black yukata"
	desc = "A comfortable black cotton yukata inspired by traditional designs, perfect for a non-formal setting."
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "yukata1"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/costume/yukata/green
	name = "green yukata"
	desc = "A comfortable green cotton yukata inspired by traditional designs, perfect for a non-formal setting."
	icon_state = "yukata2"

/obj/item/clothing/under/bastion/costume/yukata/white
	name = "white yukata"
	desc = "A comfortable white cotton yukata inspired by traditional designs, perfect for a non-formal setting."
	icon_state = "yukata3"

/obj/item/clothing/under/bastion/costume/yuri
	name = "yuri initiate jumpsuit"
	icon = 'icons/obj/items/clothing/bastion/under/costume.dmi'
	icon_state = "yuri_uniform"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/dress/ballgown
	name = "ballgown"
	desc = "A luxurious ballgown best worn before midnight. A signature of the letters 'VA` is stitched on the hem."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "ballgown_ffffffccecffffffff"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_inv_hide = HIDESHOES

/obj/item/clothing/under/bastion/dress/redeveninggown
	name = "red evening gown"
	desc = "Fancy dress for space bar singers."
	icon = 'icons/obj/items/clothing/bastion/under/dress.dmi'
	icon_state = "red_evening_gown"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/dress.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_inv_hide = HIDESHOES

/obj/item/clothing/under/bastion/dress/ribbondress
	name = "ribboned gown"
	desc = "A classy and elegant gown with ribbon sleeves. It has the initials 'VA' stitched on the back hem."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "ribbondress_845faad5a6f4"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_inv_hide = HIDESHOES

/obj/item/clothing/under/bastion/dress/sailor
	name = "sailor dress"
	desc = "Formal wear for a leading lady."
	icon = 'icons/obj/items/clothing/bastion/under/dress.dmi'
	icon_state = "sailor_dress"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/dress.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN

/obj/item/clothing/under/bastion/dress/skirt
	name = "black skirt"
	desc = "A black skirt, very fancy!"
	icon = 'icons/obj/items/clothing/bastion/under/dress.dmi'
	icon_state = "blackskirt"
	item_state = "blackskirt"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/dress.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/dress/skirt/plaid
	name = "plaid skirt"
	desc = "A preppy plaid skirt with a white blouse."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "plaidskirt_cc2102"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN

/obj/item/clothing/under/bastion/dress/skirt/turtleskirt
	name = "turtleneck skirt"
	desc = "A casual turtleneck skirt."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "turtleskirt_cc00005f5f5f"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/dress/striped
	name = "striped dress"
	desc = "Fashion in space."
	icon = 'icons/obj/items/clothing/bastion/under/dress.dmi'
	icon_state = "striped_dress"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/dress.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN

/obj/item/clothing/under/bastion/dress/sundress
	name = "sundress"
	desc = "Makes you want to frolic in a field of daisies."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "sundress_ffe60f9194a51f243c"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN

/obj/item/clothing/under/bastion/dress/tango
	name = "tango dress"
	desc = "Filled with Latin fire."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "tango_ff00001c1c1c"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/dress/wlpinafore
	name = "wonderland pinafore"
	desc = "An adorable pinafore, just don't chase any white rabbits down any holes this time. It has the initials 'VA' embroidered on the skirt hem."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "wlpinafore_5190c8ffffff"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/ethereal_tunic
	name = "ethereal tunic"
	desc = "A simple sleeveless tunic worn over an undersuit, it glows in the dark!"
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "eth_tunic_4e7cc7"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/guardmanuniform
	name = "guardman's uniform"
	desc = "The red color is meant to hide either your blood or the xeno's blood, do xenos even have red blood?"
	icon = 'icons/obj/items/clothing/bastion/uniforms.dmi'
	icon_state = "guardman_uniform"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/uniform.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/misc/mailman
	name = "mailman's jumpsuit"
	desc = "<i>'Special delivery!'</i>"
	icon = 'icons/obj/items/clothing/bastion/under/misc.dmi'
	icon_state = "mailman"
	item_state = "b_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/misc.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/misc/overalls
	name = "laborer's overalls"
	desc = "A set of durable overalls for getting the job done."
	icon = 'icons/obj/items/clothing/bastion/under/misc.dmi'
	icon_state = "overalls"
	item_state = "lb_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/misc.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/pants/camo
	name = "camo pants"
	desc = "A pair of woodland camouflage pants. Probably not the best choice for a space station."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "camopants_69704c6e5b4c343741"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/pants/jeans
	name = "jeans"
	desc = "A nondescript pair of tough jeans."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "jeans_787878723e0e4d7eac"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/pants/slacks
	name = "slacks"
	desc = "A pair of comfy slacks."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "slacks_5757573e3e3e75634f"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/pants/track
	name = "track pants"
	desc = "A pair of track pants, for the athletic."
	icon = 'icons/obj/items/clothing/bastion/under/shorts_pants_shirts.dmi'
	icon_state = "trackpants"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/shorts_pants_shirts.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/rank/blueshield
	name = "blueshield's suit"
	desc = "A classic bodyguard's suit, with custom-fitted Blueshield-Blue cuffs and a Nanotrasen insignia over one of the pockets."
	icon = 'icons/obj/items/clothing/bastion/monke/under/command.dmi'
	icon_state = "blueshield"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/command.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 10
	armor_bullet = 5
	armor_laser = 5
	armor_energy = 10
	armor_bomb = 10

/obj/item/clothing/under/bastion/rank/blueshield/skirt
	name = "blueshield's suitskirt"
	desc = "A classic bodyguard's suitskirt, with custom-fitted Blueshield-Blue cuffs and a Nanotrasen insignia over one of the pockets."
	icon_state = "blueshieldskirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/blueshield/turtleneck
	name = "blueshield's turtleneck"
	desc = "A tactical jumper fit for only the best of bodyguards, with plenty of tactical pockets for your tactical needs."
	icon_state = "bs_turtleneck"

/obj/item/clothing/under/bastion/rank/blueshield/turtleneck/skirt
	name = "blueshield's skirtleneck"
	desc = "A tactical jumper fit for only the best of bodyguards - instead of tactical pockets, this one has a tactical lack of leg protection."
	icon_state = "bs_skirtleneck"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/captain
	name = "captain's jumpsuit"
	desc = "It's a blue jumpsuit with some gold markings denoting the rank of \"Captain\"."
	icon = 'icons/obj/items/clothing/bastion/under/captain.dmi'
	icon_state = "captain"
	item_state = "b_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/captain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/captain/bunnysuit
	name = "captain's bunnysuit"
	desc = "The staple of any bunny themed captains. Great for securing the disk."
	icon = 'icons/obj/items/clothing/bastion/bunnysprites/bunnysuits.dmi'
	icon_state = "bunnysuit_captain"
	item_state = null
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/costumes/bunnysprites/bunnysuits_worn.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/rank/captain/nova/imperial
	name = "captain's naval jumpsuit"
	desc = "A white naval suit adorned with golden epaulets and a rank badge denoting a Captain. There are two ways to destroy a person, kill him, or ruin his reputation."
	icon = 'icons/obj/items/clothing/bastion/monke/under/command.dmi'
	icon_state = "impcap"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/command.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/captain/nova/imperial/generic
	name = "grey officer's naval jumpsuit"
	desc = "A grey naval suit with a rank badge denoting an Officer. Doesn't protect against blaster fire."
	icon_state = "impcom"

/obj/item/clothing/under/bastion/rank/captain/nova/imperial/generic/grey
	name = "dark grey officer's naval jumpsuit"
	desc = "A dark grey naval suit with a rank badge denoting an Officer. Doesn't protect against blaster fire."
	icon_state = "impcom_dark"

/obj/item/clothing/under/bastion/rank/captain/nova/imperial/generic/pants
	name = "officer's naval jumpsuit"
	desc = "A grey naval suit over black pants, with a rank badge denoting an Officer. Doesn't protect against blaster fire."
	icon_state = "impcom_pants"

/obj/item/clothing/under/bastion/rank/captain/nova/imperial/generic/red
	name = "red officer's naval jumpsuit"
	desc = "A red naval suit with a rank badge denoting an Officer. Doesn't protect against blaster fire."
	icon_state = "impcom_red"

/obj/item/clothing/under/bastion/rank/captain/nova/kilt
	name = "captain's kilt"
	desc = "A midnight blue kilt, padded with nano-kevlar and adorned with gold and a tartan sash."
	icon = 'icons/obj/items/clothing/bastion/monke/under/command.dmi'
	icon_state = "capkilt"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/command.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/captain/parade
	name = "captain's parade uniform"
	desc = "A captain's luxury-wear, for special occasions."
	icon_state = "captain_parade"
	item_state = null

/obj/item/clothing/under/bastion/rank/captain/skirt
	name = "captain's jumpskirt"
	desc = "It's a blue jumpskirt with some gold markings denoting the rank of \"Captain\"."
	icon_state = "captain_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/captain/suit
	name = "captain's suit"
	desc = "A green suit and yellow necktie. Exemplifies authority."
	icon_state = "green_suit"
	item_state = "dg_suit"

/obj/item/clothing/under/bastion/rank/captain/suit/skirt
	name = "green suitskirt"
	desc = "A green suitskirt and yellow necktie. Exemplifies authority."
	icon_state = "green_suit_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/cargo
	icon = 'icons/obj/items/clothing/bastion/under/cargo.dmi'
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/cargo.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/cargo/bitrunner
	name = "bitrunner's jumpsuit"
	desc = "It's a leathery jumpsuit worn by a bitrunner. Tacky, but comfortable to wear if sitting for prolonged periods of time."
	icon_state = "bitrunner"
	item_state = "w_suit"

/obj/item/clothing/under/bastion/rank/cargo/miner
	name = "shaft miner's jumpsuit"
	desc = "It's a snappy jumpsuit with a sturdy set of overalls. It is very dirty."
	icon_state = "miner"

/obj/item/clothing/under/bastion/rank/cargo/miner/lavaland
	desc = "A green uniform for operating in hazardous environments."
	icon_state = "explorer"

/obj/item/clothing/under/bastion/rank/cargo/qm
	name = "quartermaster's jumpsuit"
	desc = "It's a jumpsuit worn by the quartermaster. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "qm"
	item_state = "lb_suit"

/obj/item/clothing/under/bastion/rank/cargo/qm/nova/casual
	name = "quartermaster's casualwear"
	desc = "A brown jacket with matching trousers for the relaxed Quartermaster."
	icon = 'icons/obj/items/clothing/bastion/monke/under/cargo.dmi'
	icon_state = "qmc"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/cargo.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/cargo/qm/nova/formal
	name = "quartermaster's formal jumpsuit"
	desc = "A western-like alternate uniform for the old fashioned QM."
	icon = 'icons/obj/items/clothing/bastion/monke/under/cargo.dmi'
	icon_state = "supply_chief"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/cargo.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/cargo/qm/nova/formal/skirt
	name = "quartermaster's formal jumpskirt"
	desc = "A western-like alternate uniform for the old fashioned QM. Skirt included!"
	icon_state = "supply_chief_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/cargo/qm/nova/gorka
	name = "quartermaster's gorka"
	desc = "A rugged, utilitarian gorka with silver markings. Unlike the regular employees', this one is lined with silk on the inside."
	icon = 'icons/obj/items/clothing/bastion/monke/under/cargo.dmi'
	icon_state = "gorka_qm"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/cargo.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/cargo/qm/nova/turtleneck
	name = "quartermaster's turtleneck"
	desc = "A snug turtleneck sweater worn by the Quartermaster, characterized by the expensive-looking pair of suit pants."
	icon = 'icons/obj/items/clothing/bastion/monke/under/cargo.dmi'
	icon_state = "turtleneck_qm"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/cargo.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/cargo/qm/nova/turtleneck/skirt
	name = "quartermaster's skirtleneck"
	desc = "A snug turtleneck sweater worn by the Quartermaster, as shown by the elegant double-lining of its silk skirt."
	icon_state = "skirtleneckQM"

/obj/item/clothing/under/bastion/rank/cargo/qm/skirt
	name = "quartermaster's jumpskirt"
	desc = "It's a jumpskirt worn by the quartermaster. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "qm_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/cargo/tech
	name = "cargo technician's jumpsuit"
	desc = "Shooooorts! They're comfy and easy to wear!"
	icon_state = "cargotech"
	item_state = "lb_suit"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/cargo/tech/skirt
	name = "cargo technician's jumpskirt"
	desc = "Skiiiiirts! They're comfy and easy to wear!"
	icon_state = "cargo_skirt"

/obj/item/clothing/under/bastion/rank/centcom/commander
	name = "\improper CentCom commander's suit"
	desc = "It's a suit worn by CentCom's highest-tier Commanders."
	icon = 'icons/obj/items/clothing/bastion/under/centcom.dmi'
	icon_state = "centcom"
	item_state = "dg_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/centcom.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/centcom/commander/skirt
	name = "\improper CentCom commander's suitskirt"
	desc = "It's a suitskirt worn by CentCom's highest-tier Commanders."
	icon_state = "centcom_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/centcom/intern
	name = "\improper CentCom intern's outfit"
	desc = "It's an outfit worn by those interning for CentCom. The top is styled after a polo shirt for easy identification."
	icon = 'icons/obj/items/clothing/bastion/under/centcom.dmi'
	icon_state = "intern"
	item_state = "dg_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/centcom.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/centcom/nanotrasen_representative
	name = "representative's suit"
	desc = "Worn by those who work for the company. But don't let that fool you, they are pretty okay."
	icon = 'icons/obj/items/clothing/bastion/jobs/nanotrasen_representative_clothing_item.dmi'
	icon_state = "representative_jumpsuit"
	item_state = "dg_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/jobs/nanotrasen_representative_clothing.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/centcom/nanotrasen_representative/skirt
	name = "representative's suitskirt"
	icon_state = "representative_jumpskirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/centcom/nanotrasen_representative/skirtleneck
	name = "representative's turtleneck"
	desc = "Comfortable and Authoritarian "
	icon_state = "rep_skirtleneck"

/obj/item/clothing/under/bastion/rank/centcom/nanotrasen_representative/turtleneck
	name = "representative's turtleneck"
	desc = "Comfortable and Authoritarian"
	icon_state = "rep_turtleneck"

/obj/item/clothing/under/bastion/rank/centcom/officer
	name = "\improper CentCom turtleneck suit"
	desc = "A casual, yet refined green turtleneck, used by CentCom Officers. It has a fragrance of aloe."
	icon = 'icons/obj/items/clothing/bastion/under/centcom.dmi'
	icon_state = "officer"
	item_state = "dg_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/centcom.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/centcom/officer/replica
	name = "\improper CentCom turtleneck suit replica"
	desc = "A cheap copy of the CentCom turtleneck! A Donk Co. logo can be seen on the collar."

/obj/item/clothing/under/bastion/rank/centcom/officer/skirt
	name = "\improper CentCom turtleneck suitskirt"
	icon_state = "officer_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/centcom/officer/skirt/replica
	name = "\improper CentCom turtleneck suitskirt replica"
	desc = "A cheap copy of the CentCom turtleneck skirt! A Donk Co. logo can be seen on the collar."

/obj/item/clothing/under/bastion/rank/centcom/official
	name = "\improper CentCom official's suit"
	desc = "A suit worn by CentCom Officials, with a silver belt buckle to indicate their rank from a glance."
	icon = 'icons/obj/items/clothing/bastion/under/centcom.dmi'
	icon_state = "official"
	item_state = "dg_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/centcom.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian
	icon = 'icons/obj/items/clothing/bastion/under/civilian.dmi'
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/civilian.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/bartender
	name = "bartender's uniform"
	desc = "It looks like it could use some more flair."
	icon_state = "barman"
	item_state = "bar_suit"

/obj/item/clothing/under/bastion/rank/civilian/bartender/purple
	name = "purple bartender's uniform"
	desc = "It looks like it has lots of flair!"
	icon_state = "purplebartender"

/obj/item/clothing/under/bastion/rank/civilian/bartender/skirt
	name = "bartender's skirt"
	icon_state = "barman_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/chaplain
	name = "chaplain's jumpsuit"
	desc = "It's a black jumpsuit, often worn by religious folk."
	icon_state = "chaplain"
	item_state = "bl_suit"

/obj/item/clothing/under/bastion/rank/civilian/chaplain/skirt
	name = "chaplain's jumpskirt"
	desc = "It's a black jumpskirt. If you wear this, you probably need religious help more than you will be providing it."
	icon_state = "chapblack_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/chef
	name = "cook's suit"
	desc = "A suit which is given only to the most <b>hardcore</b> cooks in space."
	icon_state = "chef"
	item_state = "chef"

/obj/item/clothing/under/bastion/rank/civilian/chef/skirt
	name = "cook's skirt"
	desc = "A skirt which is given only to the most <b>hardcore</b> cooks in space."
	icon_state = "chef_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/clown
	name = "clown suit"
	desc = "<i>'HONK!'</i>"
	icon_state = "clown"
	item_state = "clown"

/obj/item/clothing/under/bastion/rank/civilian/clown/blue
	name = "blue clown suit"
	desc = "<i>'BLUE HONK!'</i>"
	icon_state = "blueclown"
	item_state = "blueclown"

/obj/item/clothing/under/bastion/rank/civilian/clown/green
	name = "green clown suit"
	desc = "<i>'GREEN HONK!'</i>"
	icon_state = "greenclown"
	item_state = "greenclown"

/obj/item/clothing/under/bastion/rank/civilian/clown/jester
	name = "jester suit"
	desc = "A jolly dress, well suited to entertain your master, nuncle."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "jester_51e33fff1f1f"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/clown/jester2
	name = "alternate jester suit"
	desc = "Smells like burgers and fries."
	icon_state = "jester2"

/obj/item/clothing/under/bastion/rank/civilian/clown/orange
	name = "orange clown suit"
	desc = "<i>'ORANGE HONK!'</i>"
	icon_state = "orangeclown"
	item_state = "orangeclown"

/obj/item/clothing/under/bastion/rank/civilian/clown/purple
	name = "purple clown suit"
	desc = "<i>'PURPLE HONK!'</i>"
	icon_state = "purpleclown"
	item_state = "purpleclown"

/obj/item/clothing/under/bastion/rank/civilian/clown/rainbow
	name = "rainbow clown suit"
	desc = "<i>'R A I N B O W HONK!'</i>"
	icon_state = "rainbowclown"
	item_state = "rainbowclown"

/obj/item/clothing/under/bastion/rank/civilian/clown/sexy
	name = "sexy-clown suit"
	desc = "It makes you look HONKable!"
	icon_state = "sexyclown"
	item_state = null

/obj/item/clothing/under/bastion/rank/civilian/clown/yellow
	name = "yellow clown suit"
	desc = "<i>'YELLOW HONK!'</i>"
	icon_state = "yellowclown"
	item_state = "yellowclown"

/obj/item/clothing/under/bastion/rank/civilian/cookjorts
	name = "grilling shorts"
	desc = "For when all you want in life is to grill for god's sake!"
	icon_state = "cookjorts"
	item_state = "cookjorts"

/obj/item/clothing/under/bastion/rank/civilian/curator
	name = "sensible suit"
	desc = "It's very... sensible."
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "red_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/curator/nasa
	name = "\improper NASA jumpsuit"
	desc = "It has a NASA logo on it and is made of space-proofed materials."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "jumpsuit_3f3f3f"
	item_state = "jumpsuit_3f3f3f"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/under_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/under_right.dmi',
	)
	armor_bio = 95
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	w_class = SIZE_LARGE

/obj/item/clothing/under/bastion/rank/civilian/curator/skirt
	name = "sensible suitskirt"
	icon_state = "red_suit_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/curator/treasure_hunter
	name = "treasure hunter uniform"
	desc = "A rugged uniform suitable for treasure hunting."
	icon = 'icons/obj/items/clothing/bastion/under/civilian.dmi'
	icon_state = "curator"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/civilian.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/head_of_personnel
	name = "head of personnel's uniform"
	desc = "A slick uniform worn by those to earn the position of \"Head of Personnel\"."
	icon_state = "hop"
	item_state = "b_suit"

/obj/item/clothing/under/bastion/rank/civilian/head_of_personnel/nova/imperial
	name = "head of personnel's naval jumpsuit"
	desc = "A pale green naval suit and a rank badge denoting the Personnel Officer. Target, maximum firepower."
	icon = 'icons/obj/items/clothing/bastion/monke/under/civilian.dmi'
	icon_state = "imphop"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/civilian.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/head_of_personnel/nova/parade
	name = "head of personnel's male formal uniform"
	desc = "A luxurious uniform for the head of personnel, woven in a deep blue. On the lapel is a small pin in the shape of a corgi's head."
	icon = 'icons/obj/items/clothing/bastion/monke/under/civilian.dmi'
	icon_state = "hop_parade_male"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/civilian.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/head_of_personnel/nova/parade/female
	name = "head of personnel's female formal uniform"
	icon_state = "hop_parade_female"

/obj/item/clothing/under/bastion/rank/civilian/head_of_personnel/nova/turtleneck
	name = "head of personnel's turtleneck"
	desc = "A soft blue turtleneck and black khakis worn by Executives who prefer a bit more comfort over style."
	icon = 'icons/obj/items/clothing/bastion/monke/under/civilian.dmi'
	icon_state = "hopturtle"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/civilian.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/head_of_personnel/nova/turtleneck/skirt
	name = "head of personnel's turtleneck skirt"
	desc = "A soft blue turtleneck and black skirt worn by Executives who prefer a bit more comfort over style."
	icon_state = "hopturtle_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/head_of_personnel/skirt
	name = "head of personnel's skirt"
	desc = "A slick uniform and skirt combo worn by those to earn the position of \"Head of Personnel\"."
	icon_state = "hop_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/head_of_personnel/suit
	name = "head of personnel's suit"
	desc = "A teal suit and yellow necktie. An authoritative yet tacky ensemble."
	icon_state = "teal_suit"
	item_state = "g_suit"

/obj/item/clothing/under/bastion/rank/civilian/head_of_personnel/suit/skirt
	name = "teal suitskirt"
	desc = "A teal suitskirt and yellow necktie. An authoritative yet tacky ensemble."
	icon_state = "teal_suit_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/hydroponics
	name = "botanist's jumpsuit"
	desc = "It's a jumpsuit designed to protect against minor plant-related hazards."
	icon_state = "hydroponics"
	item_state = "g_suit"
	armor_bio = 50

/obj/item/clothing/under/bastion/rank/civilian/hydroponics/skirt
	name = "botanist's jumpskirt"
	desc = "It's a jumpskirt designed to protect against minor plant-related hazards."
	icon_state = "hydroponics_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/janitor
	name = "janitor's jumpsuit"
	desc = "It's the official uniform of the station's janitor. It has minor protection from biohazards."
	icon = 'icons/obj/items/clothing/bastion/uniforms.dmi'
	icon_state = "janitor"
	item_state = "janitor"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/uniform.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/janitor/maid
	name = "maid uniform"
	desc = "A simple maid uniform for housekeeping."
	icon = 'icons/mob/humans/onmob/clothing/bastion/under/civilian.dmi'
	icon_state = "janimaid"
	item_state = "janimaid"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/civilian.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN

/obj/item/clothing/under/bastion/rank/civilian/janitor/skirt
	name = "janitor's jumpskirt"
	desc = "It's the official skirt of the station's janitor. It has minor protection from biohazards."
	icon = 'icons/obj/items/clothing/bastion/under/civilian.dmi'
	icon_state = "janitor_skirt"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/civilian.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/lawyer
	name = "Lawyer suit"
	desc = "Slick threads."

/obj/item/clothing/under/bastion/rank/civilian/lawyer/beige
	name = "good lawyer's suit"
	desc = "A tacky suit perfect for a CRIMINAL lawyer!"
	icon_state = "good_suit"
	item_state = "good_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/lawyer/beige/skirt
	name = "good lawyer's suitskirt"
	desc = "A tacky suitskirt perfect for a CRIMINAL lawyer!"
	icon_state = "good_suit_skirt"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/black
	name = "lawyer black suit"
	icon_state = "lawyer_black"
	item_state = "lawyer_black"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/black/skirt
	name = "lawyer black suitskirt"
	icon_state = "lawyer_black_skirt"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/blue
	name = "lawyer blue suit"
	icon_state = "lawyer_blue"
	item_state = "lawyer_blue"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/blue/skirt
	name = "lawyer blue suitskirt"
	icon_state = "lawyer_blue_skirt"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/bluesuit
	name = "blue suit"
	desc = "A classy suit."
	icon_state = "bluesuit"
	item_state = "b_suit"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/bluesuit/skirt
	name = "blue suitskirt"
	desc = "A classy suitskirt."
	icon_state = "bluesuit_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/lawyer/galaxy
	name = "blue galaxy suit"
	icon_state = "lawyer_galaxy_blue"
	item_state = "b_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/lawyer_galaxy.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/civilian/lawyer/galaxy/red
	name = "red galaxy suit"
	icon_state = "lawyer_galaxy_red"
	item_state = "r_suit"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/galaxy/red/skirt
	name = "red galaxy suitskirt"
	icon_state = "lawyer_galaxy_red_skirt"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/galaxy/skirt
	name = "blue galaxy suitskirt"
	icon_state = "lawyer_galaxy_blue_skirt"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/purpsuit
	name = "purple suit"
	icon_state = "lawyer_purp"
	item_state = "p_suit"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/purpsuit/skirt
	name = "purple suitskirt"
	icon_state = "lawyer_purp_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/civilian/lawyer/red
	name = "lawyer red suit"
	icon_state = "lawyer_red"
	item_state = "lawyer_red"

/obj/item/clothing/under/bastion/rank/civilian/lawyer/red/skirt
	name = "lawyer red suitskirt"
	icon_state = "lawyer_red_skirt"

/obj/item/clothing/under/bastion/rank/civilian/mime
	name = "mime's outfit"
	desc = "It's not very colourful."
	icon_state = "mime"

/obj/item/clothing/under/bastion/rank/civilian/mime/sexy
	name = "sexy mime outfit"
	desc = "Pretty inappropriate for a circus."
	icon_state = "sexymime"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/rank/civilian/mime/skirt
	name = "mime's skirt"
	icon_state = "mime_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/engineering
	icon = 'icons/obj/items/clothing/bastion/under/engineering.dmi'
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/engineering.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/engineering/atmospheric_technician
	name = "atmospheric technician's jumpsuit"
	desc = "It's a jumpsuit worn by atmospheric technicians. Made from fire resistant materials."
	icon_state = "atmos"
	item_state = "atmos_suit"

/obj/item/clothing/under/bastion/rank/engineering/atmospheric_technician/skirt
	name = "atmospheric technician's jumpskirt"
	desc = "It's a jumpskirt worn by atmospheric technicians. Made from fire resistant materials."
	icon_state = "atmos_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/engineering/chief_engineer
	name = "chief engineer's jumpsuit"
	desc = "It's a high visibility jumpsuit given to those engineers insane enough to achieve the rank of \"Chief Engineer\". Made from fire resistant materials."
	icon_state = "chiefengineer"
	item_state = "gy_suit"

/obj/item/clothing/under/bastion/rank/engineering/chief_engineer/nova/imperial
	name = "chief engineer's naval jumpsuit"
	desc = "A gray naval suit with a lead-lined vest and a rank badge denoting the Officer of the Internal Engineering Division. Doesn't come with a death machine building guide."
	icon = 'icons/obj/items/clothing/bastion/monke/under/engineering.dmi'
	icon_state = "impce"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/engineering.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/engineering/chief_engineer/skirt
	name = "chief engineer's jumpskirt"
	desc = "It's a high visibility jumpskirt given to those engineers insane enough to achieve the rank of \"Chief Engineer\". Made from fire resistant materials."
	icon_state = "chief_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/engineering/engineer
	name = "engineer's jumpsuit"
	desc = "It's an orange high visibility jumpsuit worn by engineers. Made from fire resistant materials."
	icon_state = "engine"
	item_state = "engi_suit"

/obj/item/clothing/under/bastion/rank/engineering/engineer/hazard
	name = "engineer's hazard jumpsuit"
	desc = "A high visibility jumpsuit. Made from fire resistant materials."
	icon_state = "hazard"
	item_state = "syndicate-orange"

/obj/item/clothing/under/bastion/rank/engineering/engineer/nova/hazard_chem
	name = "chemical hazard jumpsuit"
	desc = "A high visibility jumpsuit with additional protection from gas and chemical hazards, at the cost of less fire-proofing."
	icon = 'icons/obj/items/clothing/bastion/monke/under/engineering.dmi'
	icon_state = "hazard_green"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/engineering.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/engineering/engineer/nova/trouser
	name = "engineering trousers"
	desc = "An engineering-orange set of trousers. Their waistband proudly displays an 'anti-radiation' symbol, though the effectiveness of radiation-proof-pants-only is still up for debate."
	icon = 'icons/obj/items/clothing/bastion/monke/under/engineering.dmi'
	icon_state = "workpants_orange"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/engineering.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/rank/engineering/engineer/nova/utility
	name = "engineering utility uniform"
	desc = "A utility uniform worn by Engineering personnel."
	icon = 'icons/obj/items/clothing/bastion/monke/under/engineering.dmi'
	icon_state = "util_eng"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/engineering.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/engineering/engineer/skirt
	name = "engineer's jumpskirt"
	desc = "It's an orange high visibility jumpskirt worn by engineers. Made from fire resistant materials."
	icon_state = "engine_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/engineering/signal_tech
	name = "network admin's jumpsuit"
	desc = "It's an orange high visibility jumpsuit with green stripes worn by network admins. Made from fire resistant materials."
	icon = 'icons/obj/items/clothing/bastion/uniforms.dmi'
	icon_state = "signal_tech"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/uniform.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/medical
	icon = 'icons/obj/items/clothing/bastion/under/medical.dmi'
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/medical.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_bio = 50

/obj/item/clothing/under/bastion/rank/medical/chemist
	name = "chemist's jumpsuit"
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a chemist rank stripe on it."
	icon_state = "chemistry"
	item_state = "w_suit"
	armor_bio = 10

/obj/item/clothing/under/bastion/rank/medical/chemist/skirt
	name = "chemist's jumpskirt"
	icon_state = "chemistry_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/medical/chief_medical_officer
	name = "chief medical officer's jumpsuit"
	desc = "It's a jumpsuit worn by those with the experience to be \"Chief Medical Officer\". It provides minor biological protection."
	icon_state = "cmo"
	item_state = "w_suit"

/obj/item/clothing/under/bastion/rank/medical/chief_medical_officer/formal
	name = "chief medical officer's formal shirt"
	desc = "A light blue pressed shirt and tan khakis, for a chief medical officer with a tasteful sense of style."
	icon_state = "cmoformal"
	item_state = "b_suit"

/obj/item/clothing/under/bastion/rank/medical/chief_medical_officer/formal/skirt
	name = "chief medical officer's formal skirt"
	desc = "A light blue pressed shirt and tan khaki skirt, for a chief medical officer with a tasteful sense of style."
	icon_state = "cmoformal_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/medical/chief_medical_officer/scrubs
	name = "chief medical officer's scrubs"
	desc = "A distinctive set of white and turquoise scrubs given to chief medical officers who desire a clinical look."
	icon_state = "scrubscmo"

/obj/item/clothing/under/bastion/rank/medical/chief_medical_officer/skirt
	name = "chief medical officer's jumpskirt"
	desc = "It's a jumpskirt worn by those with the experience to be \"Chief Medical Officer\". It provides minor biological protection."
	icon_state = "cmo_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/medical/chief_medical_officer/turtleneck
	name = "chief medical officer's turtleneck"
	desc = "A light blue turtleneck and tan khakis, for a chief medical officer with a superior sense of style."
	icon_state = "cmoturtle"
	item_state = "b_suit"

/obj/item/clothing/under/bastion/rank/medical/chief_medical_officer/turtleneck/skirt
	name = "chief medical officer's turtleneck skirt"
	desc = "A light blue turtleneck and tan khaki skirt, for a chief medical officer with a superior sense of style."
	icon_state = "cmoturtle_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/medical/doctor
	name = "medical doctor's jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a cross on the chest denoting that the wearer is trained medical personnel."
	icon_state = "medical"
	item_state = "w_suit"

/obj/item/clothing/under/bastion/rank/medical/doctor/skirt
	name = "medical doctor's jumpskirt"
	icon_state = "medical_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/medical/doctor/utility
	name = "medical utility uniform"
	desc = "A utility uniform worn by Medical doctors."
	icon_state = "util_med"

/obj/item/clothing/under/bastion/rank/medical/doctor/utility/syndicate
	armor_melee = 10
	has_sensor = UNIFORM_NO_SENSORS

/obj/item/clothing/under/bastion/rank/medical/paramedic
	name = "paramedic jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a dark blue cross on the chest denoting that the wearer is a trained paramedic."
	icon_state = "paramedic"
	item_state = "w_suit"

/obj/item/clothing/under/bastion/rank/medical/paramedic/deforest
	name = "Deforest Uniform"
	desc = "A high-visibility medical uniform designed by Deforest Medical for search and rescue; pouches and pockets line the vest, ready to hold anything a would-be medic could need."
	icon_state = "hivisuniform"

/obj/item/clothing/under/bastion/rank/medical/paramedic/skirt
	name = "paramedic jumpskirt"
	icon_state = "paramedic_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/medical/scrubs
	name = "medical scrubs"

/obj/item/clothing/under/bastion/rank/medical/scrubs/blue
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in baby blue."
	icon_state = "scrubsblue"

/obj/item/clothing/under/bastion/rank/medical/scrubs/green
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in dark green."
	icon_state = "scrubsgreen"

/obj/item/clothing/under/bastion/rank/medical/scrubs/purple
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in deep purple."
	icon_state = "scrubswine"

/obj/item/clothing/under/bastion/rank/medical/virologist
	name = "pathologist's jumpsuit"
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a virologist rank stripe on it."
	icon_state = "virology"
	item_state = "w_suit"

/obj/item/clothing/under/bastion/rank/medical/virologist/skirt
	name = "pathologist's jumpskirt"
	icon_state = "virology_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/prisoner
	name = "prison jumpsuit"
	desc = "It's standardised Nanotrasen prisoner-wear. Its suit sensors are stuck in the \"Fully On\" position."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "jumpsuit_ff8300"
	item_state = "jumpsuit_ff8300"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/under_left.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/greyscale/under_right.dmi',
	)

/obj/item/clothing/under/bastion/rank/prisoner/skirt
	name = "prison jumpskirt"
	icon_state = "jumpskirt_ff8300"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/prisoner/skirt/syndicate
	name = "syndicate prisoner jumpskirt"
	desc = "A crimson red jumpskirt worn by syndicate captives. Its sensors have been shorted out."
	icon_state = "jumpskirt_992300"
	item_state = "jumpsuit_992300"

/obj/item/clothing/under/bastion/rank/prisoner/syndicate
	name = "syndicate prisoner jumpsuit"
	desc = "A crimson red jumpsuit worn by syndicate captives. Its sensors have been shorted out."
	icon_state = "jumpsuit_992300"
	item_state = "jumpsuit_992300"

/obj/item/clothing/under/bastion/rank/rnd
	icon = 'icons/obj/items/clothing/bastion/under/rnd.dmi'
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/rnd.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/rank/rnd/geneticist
	name = "geneticist's jumpsuit"
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a genetics rank stripe on it."
	icon_state = "genetics"
	item_state = "w_suit"
	armor_bio = 50

/obj/item/clothing/under/bastion/rank/rnd/geneticist/skirt
	name = "geneticist's jumpskirt"
	icon_state = "genetics_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/rnd/research_director
	name = "research director's vest suit"
	desc = "It's a suit worn by those with the know-how to achieve the position of \"Research Director\". Its fabric provides minor protection from biological contaminants."
	icon_state = "director"
	item_state = "lb_suit"
	armor_bomb = 10

/obj/item/clothing/under/bastion/rank/rnd/research_director/doctor_hilbert
	desc = "A Research Director jumpsuit belonging to the late and great Doctor Hilbert. The suit sensors have long since fizzled out from the stress of the Hilbert's Hotel."
	has_sensor = UNIFORM_NO_SENSORS

/obj/item/clothing/under/bastion/rank/rnd/research_director/skirt
	name = "research director's vest suitskirt"
	desc = "It's a suitskirt worn by those with the know-how to achieve the position of \"Research Director\". Its fabric provides minor protection from biological contaminants."
	icon_state = "director_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/rnd/research_director/turtleneck
	name = "research director's turtleneck"
	desc = "A Nanotrasen-purple turtleneck and black jeans, for a director with a superior sense of style."
	icon_state = "rdturtle"
	item_state = "p_suit"

/obj/item/clothing/under/bastion/rank/rnd/research_director/turtleneck/skirt
	name = "research director's turtleneck skirt"
	desc = "A Nanotrasen-purple turtleneck and a black skirt, for a director with a superior sense of style."
	icon_state = "rdturtle_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/rnd/roboticist
	name = "roboticist's jumpsuit"
	desc = "It's a slimming black with reinforced seams; great for industrial work."
	icon_state = "robotics"

/obj/item/clothing/under/bastion/rank/rnd/roboticist/skirt
	name = "roboticist's jumpskirt"
	icon_state = "robotics_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/rnd/scientist
	name = "scientist's jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against explosives. It has markings that denote the wearer as a scientist."
	icon_state = "science"
	item_state = "w_suit"
	armor_bomb = 15
	armor_bio = 15

/obj/item/clothing/under/bastion/rank/rnd/scientist/hlscience
	name = "science team uniform"
	desc = "A simple semi-formal uniform consisting of a grayish-blue shirt and off-white slacks, paired with a ridiculous, but mandatory, tie."
	icon_state = "hl_scientist"

/obj/item/clothing/under/bastion/rank/rnd/scientist/skirt
	name = "scientist's jumpskirt"
	icon_state = "science_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/rnd/scientist/utility
	name = "science utility uniform"
	desc = "A utility uniform worn by NT-certified Science staff."
	icon_state = "util_sci"

/obj/item/clothing/under/bastion/rank/rnd/scientist/utility/syndicate
	desc = "A utility uniform worn by Science staff."
	armor_melee = 10
	has_sensor = UNIFORM_NO_SENSORS

/obj/item/clothing/under/bastion/rank/rnd/xenobiologist
	name = "xenobiologist's jumpsuit"
	desc = "It's special fibers lets it handle biohazards better. It has the pink stripe of a xenobiologist."
	icon_state = "xenobio"
	item_state = "w_suit"
	armor_bio = 50

/obj/item/clothing/under/bastion/rank/rnd/xenobiologist/skirt
	name = "xenobiologist's jumpskirt"
	desc = "It's a slimming black with reinforced seams; great for industrial work."
	icon_state = "xenobio_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/security
	icon = 'icons/obj/items/clothing/bastion/under/security.dmi'
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/security.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 10

/obj/item/clothing/under/bastion/rank/security/constable
	name = "constable outfit"
	desc = "A british looking outfit."
	icon_state = "constable"

/obj/item/clothing/under/bastion/rank/security/detective
	name = "hard-worn suit"
	desc = "Someone who wears this means business."
	icon_state = "detective"
	item_state = "det"

/obj/item/clothing/under/bastion/rank/security/detective/disco
	name = "superstar cop uniform"
	desc = "Flare cut trousers and a dirty shirt that might have been classy before someone took a piss in the armpits. It's the dress of a superstar."
	icon_state = "jamrock_suit"
	item_state = null

/obj/item/clothing/under/bastion/rank/security/detective/kim
	name = "aerostatic suit"
	desc = "A crisp and well-pressed suit; professional, comfortable and curiously authoritative."
	icon_state = "aerostatic_suit"
	item_state = null

/obj/item/clothing/under/bastion/rank/security/detective/noir
	name = "noir suit"
	desc = "A hard-boiled private investigator's dark suit, complete with tie clip."
	icon_state = "noirdet"
	item_state = null

/obj/item/clothing/under/bastion/rank/security/detective/noir/skirt
	name = "noir suitskirt"
	desc = "A hard-boiled private investigator's grey suitskirt, complete with tie clip."
	icon_state = "noirdet_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/security/detective/skirt
	name = "detective's suitskirt"
	icon_state = "detective_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/security/head_of_security
	name = "head of security's jumpsuit"
	desc = "A security jumpsuit decorated for those few with the dedication to achieve the position of Head of Security."
	icon_state = "rhos"
	item_state = "r_suit"

/obj/item/clothing/under/bastion/rank/security/head_of_security/alt
	name = "head of security's turtleneck"
	desc = "A stylish alternative to the normal head of security jumpsuit, complete with tactical pants."
	icon_state = "hosalt"
	item_state = "bl_suit"

/obj/item/clothing/under/bastion/rank/security/head_of_security/alt/skirt
	name = "head of security's turtleneck skirt"
	desc = "A stylish alternative to the normal head of security jumpskirt, complete with a tactical skirt."
	icon_state = "hosalt_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/security/head_of_security/bunnysuit
	name = "Head of Security's bunnysuit"
	desc = "The staple of any bunny themed security commanders. Includes kevlar weave stockings and a gilded tail."
	icon = 'icons/obj/items/clothing/bastion/bunnysprites/bunnysuits.dmi'
	icon_state = "bunnysuit_hos"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/costumes/bunnysprites/bunnysuits_worn.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/under/bastion/rank/security/head_of_security/formal
	name = "head of security's formal uniform"
	desc = "The insignia on this uniform tells you that this uniform belongs to the Head of Security."
	icon_state = "hosblueclothes"
	item_state = null

/obj/item/clothing/under/bastion/rank/security/head_of_security/grey
	name = "head of security's grey jumpsuit"
	desc = "There are old men, and there are bold men, but there are very few old, bold men."
	icon_state = "hos"
	item_state = "gy_suit"

/obj/item/clothing/under/bastion/rank/security/head_of_security/parade
	name = "head of security's parade uniform"
	desc = "A male head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_male"

/obj/item/clothing/under/bastion/rank/security/head_of_security/parade/female
	desc = "A female head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_fem"

/obj/item/clothing/under/bastion/rank/security/head_of_security/skirt
	name = "head of security's jumpskirt"
	desc = "A security jumpskirt decorated for those few with the dedication to achieve the position of Head of Security."
	icon_state = "rhos_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/security/medical
	name = "security medical jumpsuit"
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a security rank stripe on it. It has a cross on the chest denoting that the wearer is trained medical personnel."
	icon_state = "secmed"
	item_state = "w_suit"
	armor_bio = 50

/obj/item/clothing/under/bastion/rank/security/medical/grey
	name = "grey security medical jumpsuit"
	desc = "A tactical relic of years past before Nanotrasen decided it was cheaper to dye the suits red instead of washing out the blood. It has a security rank stripe on it. It has a cross on the chest denoting that the wearer is trained medical personnel."
	icon_state = "secmed_alt"
	item_state = "gy_suit"
	armor_melee = 10
	armor_bio = 10

/obj/item/clothing/under/bastion/rank/security/medical/grey/skirt
	name = "grey security medical jumpskirt"
	icon_state = "secmed_alt_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/security/medical/scrubs
	name = "security medical scrubs"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is in security red."
	icon_state = "scrubssec"

/obj/item/clothing/under/bastion/rank/security/medical/skirt
	name = "security medical jumpskirt"
	icon_state = "secmed_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/security/officer
	name = "security jumpsuit"
	desc = "A tactical security jumpsuit for officers complete with Nanotrasen belt buckle."
	icon_state = "rsecurity"
	item_state = "r_suit"

/obj/item/clothing/under/bastion/rank/security/officer/blueshirt
	name = "blue shirt and tie"
	desc = "I'm a little busy right now, Calhoun."
	icon_state = "blueshift"
	item_state = null

/obj/item/clothing/under/bastion/rank/security/officer/formal
	name = "security officer's formal uniform"
	desc = "The latest in fashionable security outfits."
	icon_state = "officerblueclothes"
	item_state = null

/obj/item/clothing/under/bastion/rank/security/officer/grey
	name = "grey security jumpsuit"
	desc = "A tactical relic of years past before Nanotrasen decided it was cheaper to dye the suits red instead of washing out the blood."
	icon_state = "security"
	item_state = "gy_suit"

/obj/item/clothing/under/bastion/rank/security/officer/skirt
	name = "security jumpskirt"
	desc = "A \"tactical\" security jumpsuit with the legs replaced by a skirt."
	icon_state = "secskirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/rank/security/officer/spacepol
	name = "space police uniform"
	desc = "Space not controlled by megacorporations, planets, or pirates is under the jurisdiction of Spacepol."
	icon_state = "spacepol"
	item_state = null

/obj/item/clothing/under/bastion/rank/security/officer/spacepol/beatcop
	icon_state = "spacepolice_families"

/obj/item/clothing/under/bastion/rank/security/officer/tactical
	name = "security officer's tactical uniform"
	desc = "A security uniform that has tactical pants and a formal shirt. It comes with a with Nanotrasen belt buckle"
	icon_state = "security_tactical"
	item_state = null

/obj/item/clothing/under/bastion/rank/security/officer/tactical/blue
	icon_state = "security_tactical_blue"

/obj/item/clothing/under/bastion/rank/security/private
	name = "private security turtleneck"
	desc = "A tactical turtleneck for the privates of Nanotrasen's private security force."
	icon_state = "private"
	item_state = "b_suit"

/obj/item/clothing/under/bastion/rank/security/private/corporal
	name = "private security jumpsuit"
	desc = "A tactical security jumpsuit for the corporals of Nanotrasen's private security force, complete with Nanotrasen belt buckle."
	icon_state = "corporal"

/obj/item/clothing/under/bastion/rank/security/private/lieutenant
	name = "gold private security jumpsuit"
	desc = "A tactical security jumpsuit for the lieutenants of Nanotrasen's private security force, complete with Nanotrasen belt buckle."
	icon_state = "lieutenant"

/obj/item/clothing/under/bastion/rank/security/private/sergeant
	name = "silver private security jumpsuit"
	desc = "A tactical security jumpsuit for the sergeants of Nanotrasen's private security force, complete with Nanotrasen belt buckle."
	icon_state = "sergeant"

/obj/item/clothing/under/bastion/rank/security/utility
	name = "security utility uniform"
	desc = "A utility uniform worn by Lopland-certified Security officers."
	icon_state = "util_sec"

/obj/item/clothing/under/bastion/rank/security/warden
	name = "warden's jumpsuit"
	desc = "A tactical security jumpsuit for the Warden of a security force, complete with Nanotrasen belt buckle."
	icon_state = "rwarden"
	item_state = "r_suit"

/obj/item/clothing/under/bastion/rank/security/warden/formal
	name = "warden's formal uniform"
	desc = "The insignia on this uniform tells you that this uniform belongs to the Warden."
	icon_state = "wardenblueclothes"
	item_state = null

/obj/item/clothing/under/bastion/rank/security/warden/grey
	name = "warden's grey jumpsuit"
	desc = "A formal relic of years past before Nanotrasen decided it was cheaper to dye the suits red instead of washing out the blood."
	icon_state = "warden"
	item_state = "gy_suit"

/obj/item/clothing/under/bastion/rank/security/warden/skirt
	name = "warden's jumpskirt"
	desc = "A \"tactical\" security jumpskirt for the Warden of a security force, complete with Nanotrasen belt buckle."
	icon_state = "rwarden_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/shorts
	name = "shorts"
	desc = "A pair of comfy shorts."
	icon = 'icons/obj/items/clothing/bastion/greyscale/under.dmi'
	icon_state = "shorts_5757573e3e3e75634f"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/greyscale/under.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_GROIN

/obj/item/clothing/under/bastion/shorts/jeanshorts
	name = "jean shorts"
	desc = "A nondescript pair of tough jean shorts."
	icon_state = "jeanshorts_787878723e0e4d7eac"

/obj/item/clothing/under/bastion/suit/black
	name = "black suit"
	desc = "A professional looking black suit. Ready for some serious law."
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "blacksuit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/suit/black/skirt
	name = "black suitskirt"
	desc = "A professional black suitskirt. Nanotrasen Investigation Bureau approved!"
	icon_state = "blacksuit_skirt"
	item_state = "bar_suit"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/suit/black_really
	name = "executive suit"
	desc = "A formal black suit, intended for the station's finest."
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "really_black_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/suit/black_really/skirt
	name = "executive suitskirt"
	desc = "A formal black suitskirt, intended for the station's finest."
	icon_state = "really_black_suit_skirt"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/suit/burgundy
	name = "burgundy suit"
	desc = "A burgundy suit and black tie. Somewhat formal."
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "burgundy_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/suit/charcoal
	name = "charcoal suit"
	desc = "A charcoal suit and red tie. Very professional."
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "charcoal_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/suit/checkered
	name = "checkered suit"
	desc = "That's a very nice suit you have there. Shame if something were to happen to it, eh?"
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "checkered_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/suit/navy
	name = "navy suit"
	desc = "A navy suit and red tie, intended for the station's finest."
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "navy_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/suit/sl
	name = "amish suit"
	desc = "It's a very amish looking suit."
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "sl_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/suit/waiter
	name = "waiter's outfit"
	desc = "It's a very smart uniform with a special pocket for tip."
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "waiter"
	item_state = "waiter"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/suit/white
	name = "white suit"
	desc = "A white suit and jacket with a blue shirt. You wanna play rough? OKAY!"
	icon = 'icons/obj/items/clothing/bastion/under/suits.dmi'
	icon_state = "white_suit"
	item_state = "white_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/under/suits.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/suit/white/skirt
	name = "white suitskirt"
	desc = "A white suitskirt, suitable for an excellent host."
	icon_state = "white_suit_skirt"
	item_state = null
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/syndicate/tacticool
	name = "tacticool turtleneck"
	desc = "A snug turtleneck, in fabulous Nanotrasen-blue. Just looking at it makes you want to buy a NT-certifed coffee, go into the office, and -work-."
	icon = 'icons/obj/items/clothing/bastion/monke/under/syndicate.dmi'
	icon_state = "tactifool_blue"
	item_state = "b_suit"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/monke/under/syndicate.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/under/bastion/syndicate/tacticool/skirt
	name = "tacticool skirtleneck"
	desc = "A snug skirtleneck, in fabulous Nanotrasen-blue. Just looking at it makes you want to buy a NT-certifed coffee, go into the office, and -work-."
	icon_state = "tactifool_blue_skirt"
	item_state = "bl_suit"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/under/bastion/wonka
	name = "wonky suit"
	desc = "Come with me, and you'll be, in a world of OSHA violations!"
	icon = 'icons/obj/items/clothing/bastion/uniforms.dmi'
	icon_state = "wonka"
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/clothing/bastion/uniform.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	item_state_slots = list(WEAR_BODY = "wonka")
