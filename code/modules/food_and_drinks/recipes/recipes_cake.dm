
// see code/module/crafting/table.dm

////////////////////////////////////////////////CAKE////////////////////////////////////////////////

/datum/crafting_recipe/food/carrotcake
	name = "Carrot cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/carrot = 2,
	)
	result = /obj/item/food/cake/carrot
	category = CAT_CAKE

/datum/crafting_recipe/food/cheesecake
	name = "Cheese cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/cheese/wedge = 2,
	)
	result = /obj/item/food/cake/cheese
	category = CAT_CAKE

/datum/crafting_recipe/food/applecake
	name = "Apple cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/apple = 2,
	)
	result = /obj/item/food/cake/apple
	category = CAT_CAKE

/datum/crafting_recipe/food/orangecake
	name = "Orange cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/citrus/orange = 2,
	)
	result = /obj/item/food/cake/orange
	category = CAT_CAKE

/datum/crafting_recipe/food/limecake
	name = "Lime cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/citrus/lime = 2,
	)
	result = /obj/item/food/cake/lime
	category = CAT_CAKE

/datum/crafting_recipe/food/lemoncake
	name = "Lemon cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/citrus/lemon = 2,
	)
	result = /obj/item/food/cake/lemon
	category = CAT_CAKE

/datum/crafting_recipe/food/chocolatecake
	name = "Chocolate cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/chocolatebar = 2,
	)
	result = /obj/item/food/cake/chocolate
	category = CAT_CAKE

/datum/crafting_recipe/food/pumpkinspicecake
	name = "Pumpkin spice cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/pumpkin = 2,
	)
	result = /obj/item/food/cake/pumpkinspice
	category = CAT_CAKE

/datum/crafting_recipe/food/holycake
	name = "Angel food cake"
	reqs = list(
		"holywater" = 15,
		/obj/item/food/cake/plain = 1,
	)
	result = /obj/item/food/cake/holy_cake
	category = CAT_CAKE

/datum/crafting_recipe/food/poundcake
	name = "Pound cake"
	reqs = list(
		/obj/item/food/cake/plain = 4,
	)
	result = /obj/item/food/cake/pound_cake
	category = CAT_CAKE

/datum/crafting_recipe/food/hardwarecake
	name = "Hardware cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/circuitboard = 2,
		"pacid" = 5,
	)
	result = /obj/item/food/cake/hardware_cake
	category = CAT_CAKE

/datum/crafting_recipe/food/bscccake
	name = "blackberry and strawberry chocolate cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/chocolatebar = 2,
		/obj/item/food/grown/berries = 5,
	)
	result = /obj/item/food/cake/bscc
	category = CAT_CAKE

/datum/crafting_recipe/food/bscvcake
	name = "blackberry and strawberry vanilla cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/berries = 5,
	)
	result = /obj/item/food/cake/bsvc
	category = CAT_CAKE

/datum/crafting_recipe/food/fruitcake
	name = "english fruitcake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/no_raisin = 1,
		/obj/item/food/grown/cherries = 1,
		"rum" = 5,
	)
	result = /obj/item/food/cake/fruit
	category = CAT_CAKE

/datum/crafting_recipe/food/plumcake
	name = "Plum cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/plum = 2,
	)
	result = /obj/item/food/cake/plum
	category = CAT_CAKE

/datum/crafting_recipe/food/weddingcake
	name = "Wedding cake"
	reqs = list(
		/obj/item/food/cake/plain = 4,
		"sugar" = 120,
	)
	result = /obj/item/food/cake/wedding
	category = CAT_CAKE

/datum/crafting_recipe/food/pineapple_cream_cake
	name = "Pineapple cream cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/grown/pineapple = 1,
		"cream" = 20,
	)
	result = /obj/item/food/cake/pineapple_cream_cake
	category = CAT_CAKE

/datum/crafting_recipe/food/yellow_cake
	name = "yellow cake"
	reqs = list (
		"sugar" = 5,
		"uranium" = 20,
		/obj/item/food/cake/plain = 1,
	)
	result = /obj/item/food/cake/yellow_cake
	category = CAT_CAKE
