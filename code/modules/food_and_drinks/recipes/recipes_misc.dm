
// see code/module/crafting/table.dm

// MISC

/datum/crafting_recipe/food/candiedapple
	name = "Candied apple"
	reqs = list(
		"sugar" = 5,
		/obj/item/food/grown/apple = 1
	)
	result = /obj/item/food/candiedapple
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/spiderlollipop
	name = "Spider Lollipop"
	reqs = list(/obj/item/stack/rods = 1,
		"sugar" = 5,
		"water" = 5,
		/obj/item/food/spiderling = 1
	)
	result = /obj/item/food/spiderlollipop
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/chococoin
	name = "Choco coin"
	reqs = list(
		/obj/item/coin = 1,
		/obj/item/food/chocolatebar = 1,
	)
	result = /obj/item/food/chococoin
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/chocoorange
	name = "Choco orange"
	reqs = list(
		/obj/item/food/grown/citrus/orange = 1,
		/obj/item/food/chocolatebar = 1,
	)
	result = /obj/item/food/chocoorange
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/cheesyfries
	name = "Cheesy fries"
	reqs = list(
		/obj/item/food/fries = 1,
		/obj/item/food/cheese/wedge = 1
	)
	result = /obj/item/food/cheesyfries
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/beans
	name = "Beans"
	time = 40
	reqs = list("ketchup" = 5,
		/obj/item/food/grown/soybeans = 2
	)
	result = /obj/item/food/canned/beans
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/eggplantparm
	name ="Eggplant parmigiana"
	reqs = list(
		/obj/item/food/cheese/wedge = 2,
		/obj/item/food/grown/eggplant = 1
	)
	result = /obj/item/food/eggplantparm
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/honeybar
	name = "Honey nut bar"
	reqs = list(
		/obj/item/food/grown/oat = 1,
		"honey" = 5,
	)
	result = /obj/item/food/honeybar
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/branrequests
	name = "Bran Requests Cereal"
	reqs = list(
		/obj/item/food/grown/wheat = 1,
		/obj/item/food/no_raisin = 1,
	)
	result = /obj/item/food/branrequests
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/ricepudding
	name = "Rice pudding"
	reqs = list(
		/obj/item/trash/snack_bowl = 1,
		"milk" = 5,
		"sugar" = 5,
		/obj/item/food/boiledrice = 1
	)
	result = /obj/item/food/salad/ricepudding
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/risotto
	name = "Risotto"
	reqs = list(
		/obj/item/trash/snack_bowl = 1,
		/obj/item/food/cheese/wedge = 1,
		"wine" = 5,
		/obj/item/food/boiledrice = 1,
		/obj/item/food/grown/mushroom/chanterelle = 1
	)
	result = /obj/item/food/salad/risotto
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/crab_rangoon
	name = "Crab Rangoon"
	reqs = list(
		/obj/item/food/doughslice = 1,
		"cream" = 5,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/meat/slab/rawcrab = 1
	)
	result = /obj/item/food/crab_rangoon
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/pesto
	name = "Pesto"
	reqs = list(
		/obj/item/food/cheese/firm_cheese_slice = 1,
		"sodiumchloride" = 5,
		/obj/item/food/grown/herbs = 2,
		/obj/item/food/grown/garlic = 1,
		"cornoil" = 5,
		/obj/item/food/canned/pine_nuts = 1
	)
	result = /obj/item/food/pesto
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/tomato_sauce
	name = "Tomato sauce"
	reqs = list(
		/obj/item/food/grown/tomato = 1,
		"sodiumchloride" = 5,
		/obj/item/food/grown/herbs = 1,
		"cornoil" = 5,
	)
	result = /obj/item/food/tomato_sauce
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/bechamel_sauce
	name = "Bechamel sauce"
	reqs = list(
		"milk" = 10,
		"flour" = 5,
		/obj/item/food/butterslice = 1
	)
	result = /obj/item/food/bechamel_sauce
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/pierogi
	name = "Pierogi"
	reqs = list(
		/obj/item/food/doughslice = 1,
		/obj/item/food/grown/potato = 1,
		/obj/item/food/grown/onion = 1,
	)
	result = /obj/item/food/pierogi
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/stuffed_cabbage
	name = "Stuffed cabbage"
	reqs = list(
		/obj/item/food/meat/cutlet = 2,
		/obj/item/food/boiledrice = 1,
		/obj/item/food/grown/cabbage = 1,
		/obj/item/food/grown/tomato = 1,
	)
	result = /obj/item/food/stuffed_cabbage
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/granola_bar
	name = "Granola bar"
	reqs = list(
		/obj/item/food/grown/oat = 1,
		/obj/item/food/grown/peanut = 1,
		/obj/item/food/chocolatebar = 1,
		/obj/item/food/no_raisin = 1,
	)
	result = /obj/item/food/granola_bar
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/onigiri
	name = "Onigiri"
	reqs = list(
		/obj/item/food/boiledrice = 1,
		/obj/item/food/seaweedsheet = 1,
	)
	result = /obj/item/food/onigiri
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/mashed_potatoes
	name = "Mashed potatoes"
	reqs = list(
		/obj/item/food/grown/potato = 2,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/butterslice = 1,
	)
	result = /obj/item/food/mashed_potatoes
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/pacoca
	name = "Paçoca"
	reqs = list(
		/obj/item/food/grown/peanut = 2,
		"sugar" = 5,
		"sodiumchloride" = 5,
	)
	result = /obj/item/food/pacoca
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/springroll
	name = "Spring roll"
	reqs = list(
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/cucumber = 1,
		/obj/item/food/grown/chili = 1,
		"rice" = 10,
		"water" = 10,
	)
	result = /obj/item/food/springroll
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/caramel_popcorn
	name = "Caramel popcorn"
	reqs = list(
		/obj/item/food/popcorn = 1,
		"sugar" = 5,
	)
	result = /obj/item/food/popcorn/caramel
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/salty_popcorn
	name = "Salty popcorn"
	reqs = list(
		/obj/item/food/popcorn = 1,
		"sodiumchloride" = 5,
	)
	result = /obj/item/food/popcorn/salty
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/buttered_baked_potato
	name = "Buttered baked potato"
	reqs = list(
		/obj/item/food/baked_potato = 1,
		/obj/item/food/butterslice = 1,
	)
	result = /obj/item/food/buttered_baked_potato
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/loaded_baked_potato
	name = "Loaded baked potato"
	reqs = list(
		/obj/item/food/baked_potato = 1,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/meat/bacon = 1,
		/obj/item/food/grown/cabbage = 1,
	)
	result = /obj/item/food/loaded_baked_potato
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/cheese_pierogi
	name = "Cheese pierogi"
	reqs = list(
		/obj/item/food/doughslice = 1,
		/obj/item/food/grown/potato = 1,
		/obj/item/food/cheese/wedge = 1,
	)
	result = /obj/item/food/cheese_pierogi
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/meat_pierogi
	name = "Meat pierogi"
	reqs = list(
		/obj/item/food/doughslice = 1,
		/obj/item/food/grown/potato = 1,
		/obj/item/food/meat/cutlet = 1,
	)
	result = /obj/item/food/meat_pierogi
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/bonbon/caramel_truffle
	name = "Caramel truffle"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		"sugar" = 5,
	)
	result = /obj/item/food/bonbon/caramel_truffle
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/bonbon/chocolate_truffle
	name = "Chocolate truffle"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		"sugar" = 5,
	)
	result = /obj/item/food/bonbon/chocolate_truffle
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/bonbon/peanut_truffle
	name = "Peanut truffle"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		/obj/item/food/grown/peanut = 1,
	)
	result = /obj/item/food/bonbon/peanut_truffle
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/bonbon/peanut_butter_cup
	name = "Peanut butter cup"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		"peanut_butter" = 5,
	)
	result = /obj/item/food/bonbon/peanut_butter_cup
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/sauteed_eggplant
	name = "Sauteed eggplant"
	reqs = list(
		/obj/item/food/grown/eggplant = 1,
		/obj/item/food/grown/garlic = 1,
		"cornoil" = 5,
	)
	result = /obj/item/food/sauteed_eggplant
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/stuffed_eggplant
	name = "Stuffed eggplant"
	reqs = list(
		/obj/item/food/grown/eggplant = 1,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/grown/cabbage = 1,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/meat/cutlet = 1,
	)
	result = /obj/item/food/stuffed_eggplant
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/baba_ghanoush
	name = "Baba ghanoush"
	reqs = list(
		/obj/item/trash/snack_bowl = 1,
		/obj/item/food/pita_bread = 1,
		/obj/item/food/grown/eggplant = 1,
		/obj/item/food/grown/garlic = 1,
		"cornoil" = 5,
		"lemonjuice" = 5,
	)
	result = /obj/item/food/baba_ghanoush
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/moussaka
	name = "Moussaka"
	reqs = list(
		/obj/item/food/grown/eggplant = 2,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/meat/cutlet = 1,
		/obj/item/food/bechamel_sauce = 1,
	)
	result = /obj/item/food/moussaka
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/falafel
	name = "Falafel"
	reqs = list(
		/obj/item/food/grown/soybeans = 1,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/herbs = 1,
	)
	result = /obj/item/food/falafel
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/candied_pineapple
	name = "Candied pineapple"
	reqs = list(
		/obj/item/food/pineappleslice = 1,
		"sugar" = 5,
		"water" = 5,
	)
	result = /obj/item/food/candied_pineapple
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/tzatziki_sauce
	name = "Tzatziki sauce"
	reqs = list(
		/obj/item/food/grown/cucumber = 1,
		"cornoil" = 5,
		/obj/item/food/grown/garlic = 1,
		"sodiumchloride" = 5,
	)
	result = /obj/item/food/tzatziki_sauce
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/tzatziki_and_pita_bread
	name = "Tzatziki and pita bread"
	reqs = list(
		/obj/item/food/tzatziki_sauce = 1,
		/obj/item/food/pita_bread = 1,
	)
	result = /obj/item/food/tzatziki_and_pita_bread
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/grilled_beef_gyro
	name = "Grilled beef gyro"
	reqs = list(
		/obj/item/food/tzatziki_sauce = 1,
		/obj/item/food/pita_bread = 1,
		/obj/item/food/meat/cutlet = 2,
		/obj/item/food/grown/cabbage = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/onion = 1,
	)
	result = /obj/item/food/grilled_beef_gyro
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/vegetarian_gyro
	name = "Vegetarian gyro"
	reqs = list(
		/obj/item/food/tzatziki_sauce = 1,
		/obj/item/food/pita_bread = 1,
		/obj/item/food/grown/cucumber = 1,
		/obj/item/food/grown/cabbage = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/onion = 1,
	)
	result = /obj/item/food/vegetarian_gyro
	category = CAT_MISCFOOD

/datum/crafting_recipe/food/raw_pita_bread
	name = "Raw pita bread"
	reqs = list(
		"flour" = 10,
		"water" = 5,
		"cornoil" = 5,
		"sugar" = 5,
	)
	result = /obj/item/food/raw_pita_bread
	category = CAT_MISCFOOD
