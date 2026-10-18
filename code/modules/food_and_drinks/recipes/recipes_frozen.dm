
/////////////////
//Misc. Frozen.//
/////////////////

/datum/crafting_recipe/food/icecreamsandwich
	name = "Icecream sandwich"
	reqs = list(
		"cream" = 5,
		"ice" = 5,
		/obj/item/food/icecream = 1
	)
	result = /obj/item/food/icecreamsandwich
	category = CAT_ICE

/datum/crafting_recipe/food/strawberryicecreamsandwich
	name = "Strawberry ice cream sandwich"
	reqs = list(
		"cream" = 5,
		"ice" = 5,
		/obj/item/food/grown/berries = 2,
		/obj/item/food/icecream = 1
	)
	result = /obj/item/food/strawberryicecreamsandwich
	category = CAT_ICE

/datum/crafting_recipe/food/spacefreezy
	name ="Space freezy"
	reqs = list(
		"bluecherryjelly" = 5,
		"spacemountainwind" = 15,
		/obj/item/food/icecream = 1
	)
	result = /obj/item/food/spacefreezy
	category = CAT_ICE

/datum/crafting_recipe/food/sundae
	name ="Sundae"
	reqs = list(
		"cream" = 5,
		/obj/item/food/grown/cherries = 1,
		/obj/item/food/grown/banana = 1,
		/obj/item/food/icecream = 1
	)
	result = /obj/item/food/sundae
	category = CAT_ICE

/datum/crafting_recipe/food/honkdae
	name ="Honkdae"
	reqs = list(
		"cream" = 5,
		/obj/item/clothing/mask/gas/clown_hat = 1,
		/obj/item/food/grown/cherries = 1,
		/obj/item/food/grown/banana = 2,
		/obj/item/food/icecream = 1
	)
	result = /obj/item/food/honkdae
	category = CAT_ICE

/datum/crafting_recipe/food/cornuto
	name = "Cornuto"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		"cream" = 5,
		"ice" = 5,
		"sugar" = 5,
		/obj/item/food/icecream = 1
	)
	result = /obj/item/food/cornuto
	category = CAT_ICE

//////////////////////////SNOW CONES///////////////////////

/datum/crafting_recipe/food/flavorless_sc
	name = "Flavorless snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
	)
	result = /obj/item/food/snowcones
	category = CAT_ICE

/datum/crafting_recipe/food/pineapple_sc
	name = "Pineapple snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"pineapplejuice" = 5,
	)
	result = /obj/item/food/snowcones/pineapple
	category = CAT_ICE

/datum/crafting_recipe/food/lime_sc
	name = "Lime snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"limejuice" = 5,
	)
	result = /obj/item/food/snowcones/lime
	category = CAT_ICE

/datum/crafting_recipe/food/lemon_sc
	name = "Lemon snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"lemonjuice" = 5,
	)
	result = /obj/item/food/snowcones/lemon
	category = CAT_ICE

/datum/crafting_recipe/food/apple_sc
	name = "Apple snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"applejuice" = 5,
	)
	result = /obj/item/food/snowcones/apple
	category = CAT_ICE

/datum/crafting_recipe/food/grape_sc
	name = "Grape snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"grapejuice" = 5,
	)
	result = /obj/item/food/snowcones/grape
	category = CAT_ICE

/datum/crafting_recipe/food/orange_sc
	name = "Orange snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"orangejuice" = 5,
	)
	result = /obj/item/food/snowcones/orange
	category = CAT_ICE

/datum/crafting_recipe/food/blue_sc
	name = "Bluecherry snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"bluecherryjelly" = 5,
	)
	result = /obj/item/food/snowcones/blue
	category = CAT_ICE

/datum/crafting_recipe/food/red_sc
	name = "Cherry snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"cherryjelly" = 5,
	)
	result = /obj/item/food/snowcones/red
	category = CAT_ICE

/datum/crafting_recipe/food/berry_sc
	name = "Berry snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"berryjuice" = 5,
	)
	result = /obj/item/food/snowcones/berry
	category = CAT_ICE

/datum/crafting_recipe/food/fruitsalad_sc
	name = "Fruit Salad snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"water" = 5,
		"ice" = 15,
		"orangejuice" = 5,
		"limejuice" = 5,
		"lemonjuice" = 5,
	)
	result = /obj/item/food/snowcones/fruitsalad
	category = CAT_ICE

/datum/crafting_recipe/food/mime_sc
	name = "Mime snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"nothing" = 5,
	)
	result = /obj/item/food/snowcones/mime
	category = CAT_ICE

/datum/crafting_recipe/food/soda_sc
	name = "Space Cola snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"cola" = 5,
	)
	result = /obj/item/food/snowcones/soda
	category = CAT_ICE

/datum/crafting_recipe/food/spacemountainwind_sc
	name = "Space Mountain Wind snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"spacemountainwind" = 5,
	)
	result = /obj/item/food/snowcones/spacemountainwind
	category = CAT_ICE

/datum/crafting_recipe/food/honey_sc
	name = "Honey snowcone"
	reqs = list(
		/obj/item/reagent_container/food/drinks/sillycup = 1,
		"ice" = 15,
		"honey" = 5,
	)
	result = /obj/item/food/snowcones/honey
	category = CAT_ICE

/datum/crafting_recipe/food/orange_popsicle
	name = "Orange popsicle"
	reqs = list(
		/obj/item/popsicle_stick = 1,
		"orangejuice" = 5,
		"ice" = 5,
		"cream" = 5,
		"vanilla" = 5,
		"sugar" = 5,
	)
	result = /obj/item/food/popsicle/creamsicle_orange
	category = CAT_ICE

/datum/crafting_recipe/food/berry_popsicle
	name = "Berry popsicle"
	reqs = list(
		/obj/item/popsicle_stick = 1,
		"berryjuice" = 5,
		"ice" = 5,
		"cream" = 5,
		"vanilla" = 5,
		"sugar" = 5,
	)
	result = /obj/item/food/popsicle/creamsicle_berry
	category = CAT_ICE

/datum/crafting_recipe/food/jumbo
	name = "Jumbo icecream"
	reqs = list(
		/obj/item/popsicle_stick = 1,
		/obj/item/food/chocolatebar = 1,
		"ice" = 5,
		"cream" = 5,
		"vanilla" = 5,
		"sugar" = 5,
	)
	result = /obj/item/food/popsicle/jumbo
	category = CAT_ICE

/datum/crafting_recipe/food/meatsicle
	name = "Meatsicle"
	reqs = list(
		/obj/item/popsicle_stick = 1,
		/obj/item/food/meat/slab = 1,
		"ice" = 5,
		"sugar" = 5,
	)
	result = /obj/item/food/popsicle/meatsicle
	category = CAT_ICE
