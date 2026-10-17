/obj/item/clothing/suit/bastion
	name = "suit"
	icon = 'icons/obj/items/clothing/bastion/suits/default.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/default.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = NO_FLAGS
	flags_cold_protection = NO_FLAGS
	flags_heat_protection = NO_FLAGS
	w_class = SIZE_MEDIUM
	slowdown = 0

/obj/item/clothing/accessory/poncho/bastion
	name = "suit"
	icon = 'icons/obj/items/clothing/bastion/suits/default.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/default.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = NO_FLAGS
	flags_cold_protection = NO_FLAGS
	flags_heat_protection = NO_FLAGS
	w_class = SIZE_MEDIUM
	slowdown = 0

/obj/item/clothing/suit/bastion/apron
	name = "apron"
	desc = "A basic blue apron."
	icon = 'icons/obj/items/clothing/bastion/suits/utility.dmi'
	icon_state = "apron"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/utility.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_bio = 50
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN

/obj/item/clothing/suit/bastion/apron/chef
	name = "cook's apron"
	desc = "A basic, dull, white chef's apron."
	icon_state = "apronchef"

/obj/item/clothing/suit/bastion/apron/overalls
	name = "coveralls"
	desc = "A set of denim overalls."
	icon_state = "overalls"
	item_state = "overalls"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/suit/bastion/apron/purple_bartender
	name = "purple bartender apron"
	desc = "A fancy purple apron for a stylish person."
	icon_state = "purplebartenderapron"

/obj/item/clothing/suit/bastion/apron/surgical
	name = "surgical apron"
	desc = "A sterile blue surgical apron."
	icon_state = "surgical"

/obj/item/clothing/suit/bastion/apron/waders
	name = "horticultural waders"
	desc = "A pair of heavy duty leather waders, perfect for insulating your soft flesh from spills, soil and thorns."
	icon_state = "hort_waders"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS

/obj/item/clothing/suit/bastion/armor/centcom_formal
	name = "\improper CentCom formal coat"
	desc = "A stylish coat given to CentCom Commanders. Perfect for sending ERTs to suicide missions with style!"
	icon = 'icons/obj/items/clothing/bastion/suits/armor.dmi'
	icon_state = "centcom_formal"
	item_state = "centcom"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 40
	armor_laser = 40
	armor_energy = 50
	armor_bomb = 35
	armor_bio = 10
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/bastion/armor/civilprotection_vest
	name = "civil protection vest"
	desc = "Used by rebels and cops alike."
	icon = 'icons/obj/items/clothing/bastion/suits.dmi'
	icon_state = "civilprotection_vest"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST

/obj/item/clothing/suit/bastion/armor/guardmanvest
	name = "guardman's vest"
	desc = "It keeps your guts intact, thats really all that matters"
	icon = 'icons/obj/items/clothing/bastion/suits.dmi'
	icon_state = "guardman_vest"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST

/obj/item/clothing/suit/bastion/armor/hos/hos_formal
	name = "\improper Head of Security's parade jacket"
	desc = "For when an armoured vest isn't fashionable enough."
	icon = 'icons/obj/items/clothing/bastion/suits/armor.dmi'
	icon_state = "hosformal"
	item_state = "hostrench"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 30
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/bastion/armor/hos_tailcoat
	name = "head of security's tailcoat"
	desc = "A reinforced tailcoat worn by bunny themed security commanders. Enhanced with a special alloy for some extra protection and style."
	icon = 'icons/obj/items/clothing/bastion/bunnysprites/tailcoats.dmi'
	icon_state = "hos"
	item_state = "armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/costumes/bunnysprites/tailcoats_worn.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 30
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/armor/secduster
	name = "security duster"
	desc = "A standard-issue armored duster that keeps a security officer protected and fashionable."
	icon = 'icons/obj/items/clothing/bastion/suits.dmi'
	icon_state = "cowboy_sec_default"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST

/obj/item/clothing/suit/bastion/armor/secduster/cargo
	name = "cargo security duster"
	icon_state = "cowboy_sec_cargo"

/obj/item/clothing/suit/bastion/armor/secduster/engineering
	name = "engineering security duster"
	desc = "Duster? I hardly know 'er!"
	icon_state = "cowboy_sec_engi"

/obj/item/clothing/suit/bastion/armor/secduster/medical
	name = "medical security duster"
	icon_state = "cowboy_sec_medical"

/obj/item/clothing/suit/bastion/armor/secduster/science
	name = "science security duster"
	icon_state = "cowboy_sec_science"

/obj/item/clothing/suit/bastion/armor/surplus
	name = "surplus armor vest"
	desc = "An armored vest that provides decent protection against most types of damage."
	icon = 'icons/obj/items/clothing/bastion/suits.dmi'
	icon_state = "armorvest"
	item_state = "armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST

/obj/item/clothing/suit/bastion/armor/vest/alt
	name = "armor vest"
	desc = "A Type I armored vest that provides decent protection against most types of damage."
	icon = 'icons/obj/items/clothing/bastion/suits/armor.dmi'
	icon_state = "armor"
	item_state = "armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST

/obj/item/clothing/suit/bastion/armor/vest/blueshield
	name = "blueshield's armor"
	desc = "A tight-fitting kevlar-lined vest with a blue badge on the chest of it."
	icon = 'icons/obj/items/clothing/bastion/monke/suits/armor.dmi'
	icon_state = "blueshieldarmor"
	item_state = "armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/monke/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST
	valid_accessory_slots = list(ACCESSORY_SLOT_PONCHO)

/obj/item/clothing/accessory/poncho/bastion/armor/vest/blueshield/jacket
	name = "blueshield's jacket"
	desc = "An expensive kevlar-lined jacket with a golden badge on the chest and \"NT\" emblazoned on the back. It weighs surprisingly little, despite how heavy it looks."
	icon = 'icons/obj/items/clothing/bastion/monke/suits/armor.dmi'
	icon_state = "blueshield"
	item_state = "armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/monke/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/bastion/armor/vest/blueshirt
	name = "large armor vest"
	desc = "A large, yet comfortable piece of armor, protecting you from some threats."
	icon = 'icons/obj/items/clothing/bastion/suits/armor.dmi'
	icon_state = "blueshift"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST

/obj/item/clothing/suit/bastion/armor/vest/buoyantrigvest
	name = "armor vest"
	desc = "A slim Type I armored vest that provides decent protection against most types of damage."
	icon = 'icons/obj/items/clothing/bastion/suits/armor.dmi'
	icon_state = "security_rigvest"
	item_state = "armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST

/obj/item/clothing/suit/bastion/armor/vest/capcarapace/captains_formal
	name = "captain's parade coat"
	desc = "For when an armoured vest isn't fashionable enough."
	icon = 'icons/obj/items/clothing/bastion/suits/armor.dmi'
	icon_state = "capformal"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 50
	armor_bullet = 40
	armor_laser = 50
	armor_energy = 50
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/accessory/poncho/bastion/armor/vest/capcarapace/jacket
	name = "captain's jacket"
	desc = "A lightweight armored jacket in the Captain's colors. For when you want something sleeker."
	icon = 'icons/obj/items/clothing/bastion/monke/suits/armor.dmi'
	icon_state = "capjacket_casual"
	item_state = "armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/monke/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 50
	armor_bullet = 40
	armor_laser = 50
	armor_energy = 50
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/armor/vest/capcarapace/tailcoat_captain
	name = "captain's tailcoat"
	desc = "A nautical coat usually worn by bunny themed captains. It’s reinforced with genetically modified armored blue rabbit fluff."
	icon = 'icons/obj/items/clothing/bastion/bunnysprites/tailcoats.dmi'
	icon_state = "captain"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/costumes/bunnysprites/tailcoats_worn.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 50
	armor_bullet = 40
	armor_laser = 50
	armor_energy = 50
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/armor/vest/hop/hop_formal
	name = "head of personnel's parade jacket"
	desc = "A luxurious deep blue jacket for the Head of Personnel, woven with a red trim. It smells of bureaucracy."
	icon = 'icons/obj/items/clothing/bastion/monke/suits/armor.dmi'
	icon_state = "hopformal"
	item_state = "b_suit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/monke/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/bastion/armor/vest/nanotrasen_representative
	name = "representative's armored vest"
	desc = "The pen is mightier than the sword but a sword still hurts."
	icon = 'icons/obj/items/clothing/bastion/jobs/nanotrasen_representative_clothing_item.dmi'
	icon_state = "representative_vest"
	item_state = "armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/jobs/nanotrasen_representative_clothing.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	flags_armor_protection = BODY_FLAG_CHEST
	flags_cold_protection = BODY_FLAG_CHEST
	flags_heat_protection = BODY_FLAG_CHEST
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/bastion/armor/vest/nanotrasen_representative/bathrobe
	name = "representative's bathrobe"
	desc = "For those who are lazy and fit right in this time and place."
	icon_state = "representative_bathrobe"
	item_state = "dg_suit"
	armor_melee = 25
	armor_bullet = 10
	armor_energy = 10
	armor_bomb = 10
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS

/obj/item/clothing/accessory/poncho/bastion/armor/vest/secjacket
	name = "security jacket"
	desc = "A red jacket in red Security colors. It has hi-vis stripes all over it."
	icon = 'icons/obj/items/clothing/bastion/suits/armor.dmi'
	icon_state = "secjacket"
	item_state = "armor"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/armor.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 25
	armor_bullet = 25
	armor_laser = 25
	armor_energy = 35
	armor_bomb = 20
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/brownfurrich
	name = "quartermaster fur coat"
	desc = "Cargonia, or if you're a dork, Cargoslavia has shipped out a coat for loyal quartermasters, despite accusations it's just a dyed black fur coat, it's...not, promise!"
	icon = 'icons/obj/items/clothing/bastion/monke/suits.dmi'
	icon_state = "winter_coat"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/monke/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 10
	armor_bullet = 10
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/caution
	name = "wet floor sign"
	desc = "Caution! Wet Floor!"
	icon = 'icons/obj/items/clothing/bastion/suits/utility.dmi'
	icon_state = "caution"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/utility.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/equipment/custodial_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/equipment/custodial_righthand.dmi',
	)
	armor_melee = 5
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	w_class = SIZE_SMALL

/obj/item/clothing/suit/bastion/chaplainsuit/bishoprobe
	name = "bishop's robes"
	desc = "Glad to see the tithes you collected were well spent."
	icon = 'icons/obj/items/clothing/bastion/suits/chaplain.dmi'
	icon_state = "bishoprobe"
	item_state = "bishoprobe"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/chaplain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_inv_hide = HIDEJUMPSUIT

/obj/item/clothing/suit/bastion/chaplainsuit/bishoprobe/black
	name = "black bishop's robes"
	icon_state = "blackbishoprobe"
	item_state = "ro_suit"

/obj/item/clothing/suit/bastion/chaplainsuit/clownpriest
	name = "Robes of the Honkmother"
	desc = "Meant for a clown of the cloth."
	icon = 'icons/obj/items/clothing/bastion/suits/chaplain.dmi'
	icon_state = "clownpriest"
	item_state = "clownpriest"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/chaplain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_inv_hide = HIDEJUMPSUIT

/obj/item/clothing/suit/bastion/chaplainsuit/holidaypriest
	name = "holiday priest"
	desc = "This is a nice holiday, my son."
	icon = 'icons/obj/items/clothing/bastion/suits/chaplain.dmi'
	icon_state = "holidaypriest"
	item_state = "w_suit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/chaplain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_inv_hide = HIDEJUMPSUIT

/obj/item/clothing/suit/bastion/chaplainsuit/monkrobeeast
	name = "eastern monk's robes"
	desc = "Best combined with a shaved head."
	icon = 'icons/obj/items/clothing/bastion/suits/chaplain.dmi'
	icon_state = "monkrobeeast"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/chaplain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_inv_hide = HIDEJUMPSUIT

/obj/item/clothing/suit/bastion/chaplainsuit/nun
	name = "nun robe"
	desc = "Maximum piety in this star system."
	icon = 'icons/obj/items/clothing/bastion/suits/chaplain.dmi'
	icon_state = "nun"
	item_state = "nun"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/chaplain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_inv_hide = HIDEJUMPSUIT

/obj/item/clothing/suit/bastion/chaplainsuit/shrinehand
	name = "shrinehand robe"
	desc = "Won't help you communicate with spirits, but you'll certainly look the part."
	icon = 'icons/obj/items/clothing/bastion/suits/chaplain.dmi'
	icon_state = "shrinehand"
	item_state = "shrinehand"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/chaplain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_inv_hide = HIDEJUMPSUIT

/obj/item/clothing/suit/bastion/chaplainsuit/technotao
	name = "techno taoist robe"
	desc = "A yellow robe said to bring ones spirit closer to the Tao. Does not come with a talisman."
	icon = 'icons/obj/items/clothing/bastion/suits/chaplain.dmi'
	icon_state = "technotao"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/chaplain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_inv_hide = HIDEJUMPSUIT

/obj/item/clothing/suit/bastion/chaplainsuit/whiterobe
	name = "white robe"
	desc = "Good for clerics and sleepy crewmembers."
	icon = 'icons/obj/items/clothing/bastion/suits/chaplain.dmi'
	icon_state = "whiterobe"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/chaplain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_inv_hide = HIDEJUMPSUIT

/obj/item/clothing/suit/bastion/costume/deckers
	name = "decker hoodie"
	desc = "Based? Based on what?"
	icon = 'icons/obj/items/clothing/bastion/suits/costume.dmi'
	icon_state = "decker_suit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/costume/ianshirt
	name = "worn shirt"
	desc = "A worn out, curiously comfortable t-shirt with a picture of Ian. You wouldn't go so far as to say it feels like being hugged when you wear it, but it's pretty close. Good for sleeping in."
	icon = 'icons/obj/items/clothing/bastion/suits/costume.dmi'
	icon_state = "ianshirt"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/suit/bastion/costume/irs
	name = "internal revenue service jacket"
	desc = "I'm crazy enough to take on The Owl, but the IRS? Nooo thank you!"
	icon = 'icons/obj/items/clothing/bastion/suits/costume.dmi'
	icon_state = "irs_suit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/costume/pg
	name = "powder ganger jacket"
	desc = "Remind Security of their mistakes in giving prisoners blasting charges."
	icon = 'icons/obj/items/clothing/bastion/suits/costume.dmi'
	icon_state = "pg_suit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/costume/poncho
	name = "poncho"
	desc = "Your classic, non-racist poncho."
	icon = 'icons/obj/items/clothing/bastion/suits/costume.dmi'
	icon_state = "classicponcho"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/suit/bastion/costume/soviet
	name = "soviet armored coat"
	desc = "Conscript reporting! Sponsored by DonkSoft Co. for historical reenactment of the Third World War!"
	icon = 'icons/obj/items/clothing/bastion/suits/costume.dmi'
	icon_state = "soviet_suit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/costume/tmc
	name = "\improper Lost M.C. cut"
	desc = "Making sure everyone knows you're in the best biker gang this side of Alderney."
	icon = 'icons/obj/items/clothing/bastion/suits/costume.dmi'
	icon_state = "tmc_suit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/costume/yuri
	name = "yuri initiate coat"
	desc = "Yuri is master! Sponsored by DonkSoft Co. for historical reenactment of the Third World War!"
	icon = 'icons/obj/items/clothing/bastion/suits/costume.dmi'
	icon_state = "yuri_coat"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/hazardvest
	name = "hazard vest"
	desc = "A high-visibility vest used in work zones."
	icon = 'icons/obj/items/clothing/bastion/suits/utility.dmi'
	icon_state = "hazard"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/utility.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)

/obj/item/clothing/suit/bastion/hazardvest/press
	name = "press hazard vest"
	desc = "A blue high-visibility vest used to distinguish <i>non-combatant</i> \"PRESS\" members, like if anyone cares."
	icon_state = "hazard_press"

/obj/item/clothing/suit/bastion/hooded/chaplainsuit/monkhabit
	name = "monk's habit"
	desc = "A few steps above rended sackcloth."
	icon = 'icons/obj/items/clothing/bastion/suits/chaplain.dmi'
	icon_state = "monkfrock"
	item_state = "monkfrock"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/chaplain.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	hoodtype = /obj/item/clothing/head/bastion/hooded/monkhabit
	hood_up_affix = "_t"

/obj/item/clothing/suit/bastion/hooded/dinojammies
	name = "dinosaur pajamas"
	desc = "The ultimate in reptile-pajama-costume fusion."
	icon = 'icons/obj/items/clothing/bastion/suits.dmi'
	icon_state = "dinojammies"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	item_state_slots = list(WEAR_JACKET = "dinojammies")
	hoodtype = /obj/item/clothing/head/bastion/hooded/dinojammies
	hood_up_affix = "_t"

/obj/item/clothing/suit/bastion/hooded/techpriest
	name = "techpriest robes"
	desc = "For those who REALLY love their toasters."
	icon = 'icons/obj/items/clothing/bastion/suits/costume.dmi'
	icon_state = "techpriest"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/costume.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_ARMS
	hoodtype = /obj/item/clothing/head/bastion/hooded/techpriest
	hood_up_affix = "_t"

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat
	name = "winter coat"
	desc = "A heavy jacket made from 'synthetic' animal furs."
	icon = 'icons/obj/items/clothing/bastion/suits/wintercoat.dmi'
	icon_state = "coatwinter"
	item_state = "coatwinter"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/wintercoat.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_bio = 10
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood
	hood_up_affix = "_t"

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/captain
	name = "captain's winter coat"
	desc = "A luxurious winter coat, stuffed with the down of the endangered Uka bird and trimmed with genuine sable. The fabric is an indulgently soft micro-fiber, and the deep ultramarine colour is only one that could be achieved with minute amounts of crystalline bluespace dust woven into the thread between the plectrums. Extremely lavish, and extremely durable."
	icon_state = "coatcaptain"
	item_state = "coatcaptain"
	armor_melee = 25
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/captain

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/cargo
	name = "cargo winter coat"
	desc = "A tan-and-grey winter coat. The zipper tab is a small pin resembling a MULE. It fills you with the warmth of a fierce independence."
	icon_state = "coatcargo"
	item_state = "coatcargo"
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/cargo

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/cargo/qm
	name = "quartermaster's winter coat"
	desc = "A dark brown winter coat that has a golden crate pin for its zipper pully."
	icon_state = "coatqm"
	item_state = null
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/cargo/qm

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/centcom
	name = "centcom winter coat"
	desc = "A luxurious winter coat woven in the bright green and gold colours of Central Command. It has a small pin in the shape of the Nanotrasen logo for a zipper."
	icon_state = "coatcentcom"
	item_state = null
	armor_melee = 35
	armor_bullet = 40
	armor_laser = 40
	armor_energy = 50
	armor_bomb = 35
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/centcom

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/engineering
	name = "engineering winter coat"
	desc = "A surprisingly heavy yellow winter coat with reflective orange stripes. It has a small wrench for its zipper tab, and the inside layer is covered with a radiation-resistant silver-nylon blend. Because you're worth it."
	icon_state = "coatengineer"
	item_state = "coatengineer"
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/engineering

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/engineering/atmos
	name = "atmospherics winter coat"
	desc = "A yellow and blue winter coat. The zipper pull-tab is made to look like a miniature breath mask."
	icon_state = "coatatmos"
	item_state = "coatatmos"
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/engineering/atmos

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/engineering/ce
	name = "chief engineer's winter coat"
	desc = "A white winter coat with reflective green and yellow stripes. Stuffed with asbestos, treated with fire retardant PBDE, lined with a micro thin sheet of lead foil and snugly fitted to your body's measurements. This baby's ready to save you from anything except the thyroid cancer and systemic fibrosis you'll get from wearing it. The zipper tab is a tiny golden wrench."
	icon_state = "coatce"
	item_state = null
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/engineering/ce

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/engineering/signal_tech
	name = "network admin's winter coat"
	desc = "A surprisingly heavy yellow winter coat with reflective green stripes. It has a small antennae for its zipper tab, and the inside layer is covered with a radiation-resistant silver-nylon blend. Because heat insulation is clearly not a priority."
	icon = 'icons/obj/items/clothing/bastion/suits.dmi'
	icon_state = "coat_signal_tech"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/engineering/signal_tech

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/eva
	name = "\proper Endotherm winter coat"
	desc = "A thickly padded winter coat to keep the wearer well insulated no matter the circumstances. It has a harness for a larger oxygen tank attached to the back."
	icon_state = "coateva"
	armor_melee = 10
	armor_laser = 10
	armor_energy = 10
	armor_bio = 50
	flags_inv_hide = HIDEJUMPSUIT
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/eva
	w_class = SIZE_LARGE
	slowdown = 0.75

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/hop
	name = "head of personnel's winter coat"
	desc = "A cozy winter coat, covered in thick fur. The breast features a proud yellow chevron, reminding everyone that you're the second banana."
	icon_state = "coathop"
	item_state = null
	armor_melee = 10
	armor_bullet = 15
	armor_laser = 15
	armor_energy = 25
	armor_bomb = 10
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/hop

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/hydro
	name = "hydroponics winter coat"
	desc = "A green and blue winter coat. The zipper tab looks like the flower from a member of Rosa Hesperrhodos, a pretty pink-and-white rose. The colours absolutely clash."
	icon_state = "coathydro"
	item_state = "coathydro"
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/hydro

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/janitor
	name = "janitors winter coat"
	desc = "A purple-and-beige winter coat that smells of space cleaner."
	icon_state = "coatjanitor"
	item_state = null
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/janitor

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/medical
	name = "medical winter coat"
	desc = "An arctic white winter coat with a small blue caduceus instead of a plastic zipper tab. Snazzy."
	icon_state = "coatmedical"
	item_state = "coatmedical"
	armor_bio = 40
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/medical

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/medical/chemistry
	name = "chemistry winter coat"
	desc = "A lab-grade winter coat made with acid resistant polymers. For the enterprising chemist who was exiled to a frozen wasteland on the go."
	icon_state = "coatchemistry"
	item_state = null
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/medical/chemistry

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/medical/cmo
	name = "chief medical officer's winter coat"
	desc = "A winter coat in a vibrant shade of blue with a small silver caduceus instead of a plastic zipper tab. The normal liner is replaced with an exceptionally thick, soft layer of fur."
	icon_state = "coatcmo"
	item_state = null
	armor_bio = 50
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/medical/cmo

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/medical/paramedic
	name = "paramedic winter coat"
	desc = "A winter coat with blue markings. Warm, but probably won't protect from biological agents. For the cozy doctor on the go."
	icon_state = "coatparamed"
	item_state = null
	armor_bio = 50
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/medical/paramedic

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/medical/viro
	name = "virology winter coat"
	desc = "A white winter coat with green markings. Warm, but wont fight off the common cold or any other disease. Might make people stand far away from you in the hallway. The zipper tab looks like an oversized bacteriophage."
	icon_state = "coatviro"
	item_state = null
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/medical/viro

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/miner
	name = "mining winter coat"
	desc = "A dusty button up winter coat. The zipper tab looks like a tiny pickaxe."
	icon_state = "coatminer"
	item_state = "coatminer"
	armor_melee = 10
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/miner

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/nova
	name = "assistant's formal winter coat"
	desc = "A dark gray winter coat with bronze-gold detailing, and a zipper in the shape of a toolbox."
	icon = 'icons/obj/items/clothing/bastion/monke/suits/wintercoat.dmi'
	icon_state = "coataformal"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/monke/suits/wintercoat.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/nova

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/nova/blueshield
	name = "blueshield's winter coat"
	desc = "A comfy kevlar-lined coat with blue highlights, fit to keep the blueshield armored and warm."
	icon_state = "coatblueshield"
	armor_melee = 35
	armor_bullet = 30
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/nova/blueshield

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/science
	name = "science winter coat"
	desc = "A white winter coat with an outdated atomic model instead of a plastic zipper tab."
	icon_state = "coatscience"
	item_state = "coatscience"
	armor_bomb = 10
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/science

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/science/genetics
	name = "genetics winter coat"
	desc = "A white winter coat with a DNA helix for the zipper tab."
	icon_state = "coatgenetics"
	item_state = null
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/science/genetics

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/science/rd
	name = "research director's winter coat"
	desc = "A thick arctic winter coat with an outdated atomic model instead of a plastic zipper tab. Most in the know are heavily aware that Bohr's model of the atom was outdated by the time of the 1930s when the Heisenbergian and Schrodinger models were generally accepted for true. Nevertheless, we still see its use in anachronism, roleplaying, and, in this case, as a zipper tab. At least it should keep you warm on your ivory pillar."
	icon_state = "coatrd"
	item_state = null
	armor_bomb = 20
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/science/rd

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/science/robotics
	name = "robotics winter coat"
	desc = "A black winter coat with a badass flaming robotic skull for the zipper tab. This one has bright red designs and a few useless buttons."
	icon_state = "coatrobotics"
	item_state = null
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/science/robotics

/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/security
	name = "security winter jacket"
	desc = "A red, armour-padded winter coat. It glitters with a mild ablative coating and a robust air of authority.  The zipper tab is a pair of jingly little handcuffs that get annoying after the first ten seconds."
	icon_state = "coatsecurity"
	item_state = "coatsecurity"
	armor_melee = 25
	armor_bullet = 15
	armor_laser = 30
	armor_energy = 40
	armor_bomb = 25
	hoodtype = /obj/item/clothing/head/bastion/hooded/winterhood/security

/obj/item/clothing/accessory/poncho/bastion/jacket/bomber
	name = "bomber jacket"
	desc = "Aviators not included."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "bomberjacket"
	item_state = "brownjsuit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/capjacket
	name = "captain's parade jacket"
	desc = "Worn by a Captain to show their class."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "capjacket"
	item_state = "bio_suit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/curator
	name = "treasure hunter's coat"
	desc = "Both fashionable and lightly armoured, this jacket is favoured by treasure hunters the galaxy over."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "curator"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 25
	armor_bullet = 10
	armor_laser = 25
	armor_energy = 35
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/det_suit
	name = "trenchcoat"
	desc = "A 18th-century multi-purpose trenchcoat. Someone who wears this means serious business."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "detective"
	item_state = "det_suit"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 25
	armor_bullet = 10
	armor_laser = 25
	armor_energy = 35
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/det_suit/dark
	name = "noir trenchcoat"
	desc = "A hard-boiled private investigator's dark trenchcoat."
	icon_state = "noirdet"
	item_state = null

/obj/item/clothing/accessory/poncho/bastion/jacket/det_suit/disco
	name = "disco ass blazer"
	desc = "Looks like someone skinned this blazer off some long extinct disco-animal. It has an enigmatic white rectangle on the back and the right sleeve."
	icon_state = "jamrock_blazer"
	item_state = null

/obj/item/clothing/accessory/poncho/bastion/jacket/det_suit/kim
	name = "aerostatic bomber jacket"
	desc = "A jacket once worn by the revolutionary air brigades during the Antecentennial Revolution. There are quite a few pockets on the inside, mostly for storing notebooks and compasses."
	icon_state = "aerostatic_bomber_jacket"
	item_state = null

/obj/item/clothing/accessory/poncho/bastion/jacket/det_suit/noir
	name = "noir suit coat"
	desc = "A dapper private investigator's dark suit coat."
	icon_state = "detsuit"
	item_state = null

/obj/item/clothing/accessory/poncho/bastion/jacket/hos/blue
	name = "head of security's jacket"
	desc = "This piece of clothing was specifically designed for asserting superior authority."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "hosbluejacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/hos/tan
	name = "head of security's jacket"
	desc = "This piece of clothing was specifically designed for asserting superior authority."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "hostanjacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/leather
	name = "leather jacket"
	desc = "Pompadour not included."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "leatherjacket"
	item_state = "hostrench"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/leather/biker
	name = "biker jacket"
	desc = "You think I'm not even worth a single dollar, but I feel like a millionare."
	icon_state = "leatherjacket_biker"

/obj/item/clothing/accessory/poncho/bastion/jacket/letterman
	name = "letterman jacket"
	desc = "A classic brown letterman jacket. Looks pretty hot and heavy."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "letterman"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/letterman_nanotrasen
	name = "blue letterman jacket"
	desc = "A blue letterman jacket with a proud Nanotrasen N on the back. The tag says that it was made in Space China."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "letterman_n"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/letterman_red
	name = "red letterman jacket"
	desc = "A letterman jacket in a sick red color. Radical."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "letterman_red"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/letterman_syndie
	name = "blood-red letterman jacket"
	desc = "Oddly, this jacket seems to have a large S on the back..."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "letterman_s"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/miljacket
	name = "military jacket"
	desc = "A canvas jacket styled after classical American military garb. Feels sturdy, yet comfortable."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "militaryjacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/officer/blue
	name = "security officer's jacket"
	desc = "This jacket is for those special occasions when a security officer isn't required to wear their armor."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "officerbluejacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/officer/tan
	name = "security officer's jacket"
	desc = "This jacket is for those special occasions when a security officer isn't required to wear their armor."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "officertanjacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/puffer
	name = "puffer jacket"
	desc = "A thick jacket with a rubbery, water-resistant shell."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "pufferjacket"
	item_state = "hostrench"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_bio = 50
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/puffer/vest
	name = "puffer vest"
	desc = "A thick vest with a rubbery, water-resistant shell."
	icon_state = "puffervest"
	item_state = "armor"
	armor_bio = 30
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN

/obj/item/clothing/accessory/poncho/bastion/jacket/research_director
	name = "research director's coat"
	desc = "A mix between a labcoat and just a regular coat. It's made out of a special anti-bacterial, anti-acidic, and anti-biohazardous synthetic fabric."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "labcoat_rd"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_bio = 75
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/warden/blue
	name = "warden's jacket"
	desc = "Perfectly suited for the warden that wants to leave an impression of style on those who visit the brig."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "wardenbluejacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS

/obj/item/clothing/accessory/poncho/bastion/jacket/warden/tan
	name = "warden's jacket"
	desc = "Perfectly suited for the warden that wants to leave an impression of style on those who visit the brig."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "wardentanjacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS

/obj/item/clothing/suit/bastion/space/officer
	name = "CentCom officer's coat"
	desc = "An armored, space-proof coat used in special operations."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "centcom_coat"
	item_state = "centcom"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_melee = 80
	armor_bullet = 80
	armor_laser = 50
	armor_energy = 60
	armor_bomb = 100
	armor_bio = 100
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS|BODY_FLAG_FEET|BODY_FLAG_ARMS|BODY_FLAG_HANDS

/obj/item/clothing/suit/bastion/toggle/chef
	name = "chef's apron"
	desc = "An apron-jacket used by a high class chef."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "chef"
	item_state = "chef"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_bio = 50
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	toggle_noun = "sleeves"
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/accessory/poncho/bastion/toggle/jacket/engi
	name = "engineering jacket"
	desc = "A comfortable jacket in engineering yellow."
	icon = 'icons/obj/items/clothing/bastion/monke/suits.dmi'
	icon_state = "engi_dep_jacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/monke/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS|BODY_FLAG_GROIN
	toggle_noun = "zipper"
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/accessory/poncho/bastion/toggle/jacket/sci
	name = "science jacket"
	desc = "A comfortable jacket in science purple."
	icon = 'icons/obj/items/clothing/bastion/monke/suits.dmi'
	icon_state = "sci_dep_jacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/monke/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_bomb = 10
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS|BODY_FLAG_GROIN
	toggle_noun = "zipper"
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/accessory/poncho/bastion/toggle/jacket/supply/head
	name = "quartermaster's jacket"
	desc = "Even if people refuse to recognize you as a head, they can recognize you as a badass."
	icon = 'icons/obj/items/clothing/bastion/monke/suits.dmi'
	icon_state = "qmjacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/monke/suit.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS|BODY_FLAG_GROIN
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS|BODY_FLAG_GROIN
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS|BODY_FLAG_GROIN
	toggle_noun = "zipper"
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/bastion/toggle/labcoat
	name = "labcoat"
	desc = "A suit that protects against minor chemical spills."
	icon = 'icons/obj/items/clothing/bastion/suits/labcoat.dmi'
	icon_state = "labcoat"
	item_state = "labcoat"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/labcoat.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	armor_bio = 50
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/bastion/toggle/labcoat/chemist
	name = "chemist labcoat"
	desc = "A suit that protects against minor chemical spills. Has an orange stripe on the shoulder."
	icon_state = "labcoat_chem"

/obj/item/clothing/suit/bastion/toggle/labcoat/genetics
	name = "geneticist labcoat"
	desc = "A suit that protects against minor chemical spills. Has a blue stripe on the shoulder."
	icon_state = "labcoat_gen"

/obj/item/clothing/suit/bastion/toggle/labcoat/medical
	name = "medical labcoat"
	desc = "A suit that protects against minor chemical spills. Has a light blue stripe on the shoulder."
	icon_state = "labcoat_med"

/obj/item/clothing/suit/bastion/toggle/labcoat/paramedic
	name = "paramedic's jacket"
	desc = "A dark blue jacket for paramedics with reflective stripes."
	icon_state = "labcoat_paramedic"
	item_state = null

/obj/item/clothing/suit/bastion/toggle/labcoat/roboticist
	name = "roboticist labcoat"
	desc = "More like an eccentric coat than a labcoat. Helps pass off bloodstains as part of the aesthetic. Comes with red shoulder pads."
	icon_state = "labcoat_robo"

/obj/item/clothing/suit/bastion/toggle/labcoat/science
	name = "scientist labcoat"
	desc = "A suit that protects against minor chemical spills. Has a purple stripe on the shoulder."
	icon_state = "labcoat_sci"

/obj/item/clothing/suit/bastion/toggle/labcoat/secmed
	name = "security medical labcoat"
	desc = "A suit that protects against minor chemical spills. Has a red stripe on the shoulder."
	icon_state = "labcoat_secmed"

/obj/item/clothing/suit/bastion/toggle/labcoat/secmed/alt
	name = "security medical jacket"
	desc = "A red lightly armored jacket with reflective stripes for security medical personnel."
	icon_state = "labcoat_secmed_alt"
	item_state = null
	armor_melee = 25
	armor_bullet = 25
	armor_laser = 25
	armor_energy = 35
	armor_bomb = 20

/obj/item/clothing/suit/bastion/toggle/labcoat/secmed/old
	name = "grey security medical labcoat"
	desc = "A formerly retired labcoat pattern now brought back for those working the medical profession in the security apparatus."
	icon_state = "labcoat_secmed_old"

/obj/item/clothing/suit/bastion/toggle/labcoat/virologist
	name = "virologist labcoat"
	desc = "A suit that protects against minor chemical spills. Has a green stripe on the shoulder."
	icon_state = "labcoat_vir"

/obj/item/clothing/suit/bastion/toggle/labcoat/xenobiologist
	name = "xenobiologist labcoat"
	desc = "A suit that protects against minor chemical spills. Has a pink stripe on the shoulder."
	icon_state = "labcoat_xeno"

/obj/item/clothing/suit/bastion/toggle/lawyer
	name = "blue suit jacket"
	desc = "A snappy dress jacket."
	icon = 'icons/obj/items/clothing/bastion/suits/jacket.dmi'
	icon_state = "suitjacket_blue"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/suits/jacket.dmi',
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/bastion/suits_righthand.dmi',
	)
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	toggle_capable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/suit/bastion/toggle/lawyer/black
	name = "black suit jacket"
	desc = "A professional suit jacket."
	icon_state = "suitjacket_black"
	item_state = "ro_suit"

/obj/item/clothing/suit/bastion/toggle/lawyer/purple
	name = "purple suit jacket"
	desc = "A foppish dress jacket."
	icon_state = "suitjacket_purp"
