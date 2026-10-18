/datum/soup_recipe/meatballsoup
	name = "Meatball Soup"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/meatball = 1,
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/potato = 1,
	)
	results = list(
		"soup_meatball_soup" = 30,
		"water" = 9,
	)

/datum/soup_recipe/vegetable_soup
	name = "Vegetable Soup"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/corn = 1,
		/obj/item/food/grown/eggplant = 1,
		/obj/item/food/grown/potato = 1,
	)
	results = list(
		"soup_vegetable_soup" = 30,
		"water" = 9,
	)

/datum/soup_recipe/wingfangchu
	name = "Wing Fang Chu"
	required_reagents = list(
		"water" = 50,
		"soysauce" = 5,
	)
	required_ingredients = list(
		/obj/item/food/meat/cutlet/xeno = 2,
	)
	results = list(
		"soup_wingfangchu" = 30,
		"soysauce" = 10,
	)

/datum/soup_recipe/hotchili
	name = "Hot Chili"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/meat/cutlet = 2,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/grown/tomato = 1,
	)
	results = list(
		"soup_hotchili" = 30,
		"tomatojuice" = 10,
		"nutriment" = 14,
	)

/datum/soup_recipe/coldchili
	name = "Cold Chili"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/meat/cutlet = 2,
		/obj/item/food/grown/icepepper = 1,
		/obj/item/food/grown/tomato = 1,
	)
	results = list(
		"soup_coldchili" = 30,
		"tomatojuice" = 10,
	)

/datum/soup_recipe/clownchili
	name = "Chili Con Carnival"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/meat/cutlet = 2,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/clothing/shoes/clown_shoes = 1,
	)
	results = list(
		"soup_clownchili" = 30,
		"tomatojuice" = 8,
		"banana" = 4,
	)

/datum/soup_recipe/chili_sin_carne
	name = "Chili Sin Carne"
	required_reagents = list(
		"water" = 40,
	)
	required_ingredients = list(
		/obj/item/food/grown/chili = 1,
		/obj/item/food/grown/tomato = 1,
	)
	results = list(
		"soup_chili_sin_carne" = 30,
		"tomatojuice" = 10,
	)

/datum/soup_recipe/tomatosoup
	name = "Tomato Soup"
	required_reagents = list(
		"water" = 50,
		"cream" = 5,
	)
	required_ingredients = list(
		/obj/item/food/grown/tomato = 2,
	)
	results = list(
		"soup_tomato" = 30,
		"tomatojuice" = 30,
		"nutriment" = 9,
	)

/datum/soup_recipe/misosoup
	name = "Miso Soup"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/soydope = 2,
		/obj/item/food/tofu = 2,
	)
	results = list(
		"soup_miso" = 30,
		"water" = 10,
	)

/datum/soup_recipe/mysterysoup
	name = "Mystery Soup"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/badrecipe = 1,
		/obj/item/food/tofu = 1,
		/obj/item/food/boiledegg = 1,
		/obj/item/food/cheese/wedge = 1,
	)
	results = list(
		"soup_mystery" = 30,
	)

/datum/soup_recipe/mushroomsoup
	name = "Chantrelle Soup"
	required_reagents = list(
		"water" = 40,
		"milk" = 10,
	)
	required_ingredients = list(
		/obj/item/food/grown/mushroom/chanterelle = 1,
	)
	results = list(
		"soup_mushroom" = 30,
		"nutriment" = 17,
		"milk" = 2,
	)

/datum/soup_recipe/beetsoup
	name = "Beet Soup"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/grown/whitebeet = 1,
		/obj/item/food/grown/cabbage = 1,
	)
	results = list(
		"soup_white_beet" = 30,
		"water" = 10,
	)

/datum/soup_recipe/stew
	name = "Stew"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/meat/cutlet = 3,
		/obj/item/food/grown/potato = 1,
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/eggplant = 1,
		/obj/item/food/grown/mushroom = 1,
	)
	results = list(
		"soup_stew" = 30,
		"tomatojuice" = 10,
	)

/datum/soup_recipe/sweetpotatosoup
	name = "Sweet Potato Soup"
	required_reagents = list(
		"water" = 40,
		"milk" = 10,
	)
	required_ingredients = list(
		/obj/item/food/grown/potato/sweet = 2,
	)
	results = list(
		"soup_sweetpotato" = 30,
		"water" = 10,
	)

/datum/soup_recipe/redbeetsoup
	name = "Red Beet Soup"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/grown/redbeet = 1,
		/obj/item/food/grown/cabbage = 1,
	)
	results = list(
		"soup_red_beet" = 30,
		"water" = 10,
	)

/datum/soup_recipe/onionsoup
	name = "French Onion Soup"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/grown/onion = 1,
		/obj/item/food/cheese/wedge = 1,
	)
	results = list(
		"soup_french_onion" = 30,
		"nutriment" = 8,
		"tomatojuice" = 8,
	)

/datum/soup_recipe/bisque
	name = "Bisque"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/meat/crab = 1,
		/obj/item/food/boiledrice = 1,
	)
	results = list(
		"soup_bisque" = 30,
		"nutriment" = 10,
		"water" = 5,
	)

/datum/soup_recipe/peasoup
	name = "Pea Soup"
	required_reagents = list(
		"water" = 50,
	)
	required_ingredients = list(
		/obj/item/food/grown/peas = 2,
		/obj/item/food/grown/parsnip = 1,
		/obj/item/food/grown/carrot = 1,
	)
	results = list(
		"soup_pea" = 30,
		"water" = 10,
	)

/datum/soup_recipe/indian_curry
	name = "Indian Chicken Curry"
	required_reagents = list(
		"water" = 50,
		"cream" = 5,
	)
	required_ingredients = list(
		/obj/item/food/meat/slab/chicken = 1,
		/obj/item/food/grown/onion = 2,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/grown/garlic = 1,
		/obj/item/food/butterslice = 1,
		/obj/item/food/boiledrice = 1,
	)
	results = list(
		"soup_indian_curry" = 30,
	)

/datum/soup_recipe/oatmeal
	name = "Oatmeal"
	required_reagents = list(
		"milk" = 20,
	)
	required_ingredients = list(
		/obj/item/food/grown/oat = 2,
	)
	results = list(
		"soup_oatmeal" = 20,
		"milk" = 12,
		"nutriment" = 8,
	)

/datum/soup_recipe/zurek
	name = "Zurek"
	required_reagents = list(
		"water" = 40,
		"flour" = 10,
	)
	required_ingredients = list(
		/obj/item/food/boiledegg = 1,
		/obj/item/food/meat/cutlet = 1,
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/onion = 1,
	)
	results = list(
		"soup_zurek" = 30,
	)

/datum/soup_recipe/cullen_skink
	name = "Cullen Skink"
	required_reagents = list(
		"water" = 40,
		"milk" = 10,
		"blackpepper" = 5,
	)
	required_ingredients = list(
		/obj/item/food/fishmeat = 1,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/potato = 1,
	)
	results = list(
		"soup_cullen_skink" = 30,
		"nutriment" = 14,
		"water" = 6,
	)

/datum/soup_recipe/chicken_noodle_soup
	name = "Chicken Noodle Soup"
	required_reagents = list(
		"water" = 30,
	)
	required_ingredients = list(
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/meat/slab/chicken = 1,
		/obj/item/food/spaghetti/boiledspaghetti = 1,
	)
	results = list(
		"soup_chicken_noodle_soup" = 30,
		"nutriment" = 10,
	)

/datum/soup_recipe/corn_chowder
	name = "Corn Chowder"
	required_reagents = list(
		"water" = 40,
		"cream" = 5,
	)
	required_ingredients = list(
		/obj/item/food/grown/corn = 1,
		/obj/item/food/grown/potato = 1,
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/meat/bacon = 1,
	)
	results = list(
		"soup_corn_chowder" = 30,
		"nutriment" = 6,
	)
