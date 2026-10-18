/datum/soup_recipe/boiledspaghetti
	name = "Boiled Spaghetti"
	category = CAT_SPAGHETTI
	required_reagents = list(
		"water" = 25,
	)
	required_ingredients = list(
		/obj/item/food/spaghetti/raw = 1,
	)
	result_foods = list(
		/obj/item/food/spaghetti/boiledspaghetti = 1,
	)
	cook_time = 20 SECONDS
	ingredient_reagent_share = 0

/datum/soup_recipe/boiledrice
	name = "Boiled Rice"
	category = CAT_SALAD
	required_reagents = list(
		"water" = 25,
	)
	required_ingredients = list(
		/obj/item/food/uncooked_rice = 1,
	)
	result_foods = list(
		/obj/item/food/boiledrice = 1,
	)
	cook_time = 20 SECONDS
	ingredient_reagent_share = 0
