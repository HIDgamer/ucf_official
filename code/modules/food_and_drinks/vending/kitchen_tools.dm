/// Bastion kitchen tools
/obj/item/bastion_kitchen
	name = "kitchen tool"
	icon = 'icons/obj/kitchen.dmi'
	w_class = SIZE_SMALL
	item_icons = list(
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/equipment/bastion_kitchen_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/equipment/bastion_kitchen_righthand.dmi',
	)

/obj/item/bastion_kitchen/fork
	name = "fork"
	desc = "Pointy."
	icon_state = "fork"
	item_state = "fork"
	force = 4
	throwforce = 0
	w_class = SIZE_TINY
	sharp = IS_SHARP_ITEM_SIMPLE
	attack_verb = list("attacks", "stabs", "pokes")

/obj/item/bastion_kitchen/fork/plastic
	name = "plastic fork"
	desc = "Really takes you back to highschool lunch."
	icon_state = "plastic_fork"
	item_state = "fork"
	force = 0

/obj/item/bastion_kitchen/spoon
	name = "spoon"
	desc = "Just be careful your food doesn't melt the spoon first."
	icon_state = "spoon"
	item_state = "spoon"
	force = 2
	w_class = SIZE_TINY
	attack_verb = list("whacks", "spoons", "taps")

/obj/item/bastion_kitchen/spoon/plastic
	name = "plastic spoon"
	desc = "Just be careful your food doesn't melt the spoon first."
	icon_state = "plastic_spoon"
	item_state = "plastic_spoon"
	force = 0

/obj/item/bastion_kitchen/spoon/soup_ladle
	name = "ladle"
	desc = "A ladle for serving soup."
	icon_state = "ladle"
	item_state = "spoon"
	force = 5
	w_class = SIZE_SMALL

/obj/item/bastion_kitchen/knife
	name = "kitchen knife"
	desc = "A general purpose Chef's Knife made by SpaceCook Incorporated. Guaranteed to stay sharp for years to come."
	icon_state = "knife"
	item_state = "knife"
	force = 10
	throwforce = 6
	sharp = IS_SHARP_ITEM_ACCURATE
	edge = 1
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/bastion_kitchen/knife/butcher
	name = "butcher's cleaver"
	desc = "A huge thing used for chopping and chopping up meat. This includes clowns and clown-by-products."
	icon_state = "butch"
	item_state = "butch"
	force = 15
	throwforce = 8
	w_class = SIZE_MEDIUM
	sharp = IS_SHARP_ITEM_BIG

/obj/item/bastion_kitchen/rollingpin
	name = "rolling pin"
	desc = "Used to knock out the Bartender."
	icon_state = "rolling_pin"
	item_state = "rolling_pin"
	force = 8
	throwforce = 5
	w_class = SIZE_MEDIUM
	attack_verb = list("bashes", "batters", "bludgeons", "thrashes", "whacks")

/obj/item/bastion_kitchen/rollingpin/illegal
	name = "metal rolling pin"
	desc = "A heavy metallic rolling pin used to bash in those annoying ingredients."
	icon_state = "metal_rolling_pin"
	item_state = "metal_rolling_pin"
	force = 12

/// Packets and shakers of condiments
/obj/item/reagent_container/food/condiment/bastion/pack
	w_class = SIZE_TINY
	volume = 10
	fill_amount = 10
	icon_state = "generic_condiment"

/obj/item/reagent_container/food/condiment/bastion/pack/ketchup
	name = "ketchup packet"
	desc = "Contains 10u of ketchup."
	fill_reagent = "ketchup"

/obj/item/reagent_container/food/condiment/bastion/pack/hotsauce
	name = "hotsauce packet"
	desc = "Contains 10u of hot sauce."
	fill_reagent = "hotsauce"

/obj/item/reagent_container/food/condiment/bastion/pack/bbqsauce
	name = "BBQ sauce packet"
	desc = "Contains 10u of barbecue sauce."
	fill_reagent = "bbqsauce"

/obj/item/reagent_container/food/condiment/bastion/pack/astrotame
	name = "astrotame packet"
	desc = "Contains 10u of sweetener."
	fill_reagent = "sugar"

/obj/item/reagent_container/food/condiment/bastion/saltshaker
	name = "salt shaker"
	desc = "Salt. From space oceans, presumably."
	icon_state = "saltshakersmall"
	fill_reagent = "sodiumchloride"
	fill_amount = 20
	volume = 20

/obj/item/reagent_container/food/condiment/bastion/peppermill
	name = "pepper mill"
	desc = "Often used to flavor food or make people sneeze."
	icon_state = "peppermillsmall"
	fill_reagent = "blackpepper"
	fill_amount = 20
	volume = 20

/// Garnishes for drinks
/obj/item/bastion_garnish
	name = "garnish"
	icon = 'icons/obj/drinks/garnish_items.dmi'
	w_class = SIZE_SMALL

/obj/item/bastion_garnish/Initialize()
	. = ..()
	pixel_x = rand(-3, 3)
	pixel_y = rand(-3, 3)

/obj/item/bastion_garnish/olives
	name = "olives"
	desc = "A pair of olives on a toothpick."
	icon_state = "olives"

/obj/item/bastion_garnish/umbrellared
	name = "red cocktail umbrella"
	desc = "A tiny red umbrella for a drink."
	icon_state = "umbrellared"

/obj/item/bastion_garnish/umbrellablue
	name = "blue cocktail umbrella"
	desc = "A tiny blue umbrella for a drink."
	icon_state = "umbrellablue"

/obj/item/bastion_garnish/umbrellagreen
	name = "green cocktail umbrella"
	desc = "A tiny green umbrella for a drink."
	icon_state = "umbrellagreen"

/// Boxes of donk pockets
/obj/item/storage/box/bastion_donk
	name = "box of donk-pockets"
	desc = "Instructions: Heat in microwave. Product will cool if not eaten within seven minutes."
	icon_state = "donk_kit"
	item_state = "donk_kit"
	can_hold = list(/obj/item/reagent_container/food/snacks)
	w_class = SIZE_MEDIUM
	var/pocket_type = /obj/item/food/donkpocket

/obj/item/storage/box/bastion_donk/fill_preset_inventory()
	for(var/i in 1 to 6)
		new pocket_type(src)

/obj/item/storage/box/bastion_donk/berry
	name = "box of berry donk-pockets"
	pocket_type = /obj/item/food/donkpocket/berry

/obj/item/storage/box/bastion_donk/honk
	name = "box of banana donk-pockets"
	pocket_type = /obj/item/food/donkpocket/honk

/obj/item/storage/box/bastion_donk/pizza
	name = "box of pizza donk-pockets"
	pocket_type = /obj/item/food/donkpocket/pizza

/obj/item/storage/box/bastion_donk/spicy
	name = "box of spicy donk-pockets"
	pocket_type = /obj/item/food/donkpocket/spicy

/obj/item/storage/box/bastion_donk/teriyaki
	name = "box of teriyaki donk-pockets"
	pocket_type = /obj/item/food/donkpocket/teriyaki
