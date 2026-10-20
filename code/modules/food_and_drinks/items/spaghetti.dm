///spaghetti prototype used by all subtypes
/obj/item/food/spaghetti
	icon = 'icons/obj/food/spaghetti.dmi'
	food_reagents = list(
		"nutriment" = 2,
	)
	foodtypes = GRAIN
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/spaghetti/raw
	name = "spaghetti"
	desc = "Now that's a nic'e pasta!"
	icon_state = "spaghetti"
	tastes = list("pasta" = 1)

/obj/item/food/spaghetti/boiledspaghetti
	name = "boiled spaghetti"
	desc = "A plain dish of noodles, this needs more ingredients."
	icon_state = "spaghettiboiled"
	food_reagents = list(
		"nutriment" = 3,
	)

/obj/item/food/spaghetti/boiledspaghetti/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_SCATTER, max_ingredients = 6)

/obj/item/food/spaghetti/security
	name = "Robust pasta"
	desc = "Only the truly robust can eat this safely."
	icon_state = "spesslaw"
	bite_consumption = 5
	food_reagents = list(
		"nutriment" = 25,
	)
	tastes = list("justice" = 1, "robustness" = 1)
	foodtypes = GRAIN | MEAT

/obj/item/food/spaghetti/pastatomato
	name = "spaghetti"
	desc = "Spaghetti and crushed tomatoes. Just like your abusive father used to make!"
	icon_state = "pastatomato"
	bite_consumption = 4
	food_reagents = list(
		"nutriment" = 10,
		"tomatojuice" = 10,
	)
	tastes = list("pasta" = 1, "tomato" = 1)
	foodtypes = GRAIN | VEGETABLES

/obj/item/food/spaghetti/pastatomato/soulful
	name = "soul food"
	desc = "Just how mom used to make it."
	food_reagents = list(
		// same as normal pasghetti
		"nutriment" = 6,
		"tomatojuice" = 10,
		"nutriment" = 4,
		// where the soul comes from
		"tramadol" = 5,
	)
	tastes = list("nostalgia" = 1, "happiness" = 1)

/obj/item/food/spaghetti/copypasta
	name = "copypasta"
	desc = "You probably shouldn't try this, you always hear people talking about how bad it is..."
	icon_state = "copypasta"
	bite_consumption = 4
	food_reagents = list(
		"nutriment" = 20,
		"tomatojuice" = 20,
	)
	tastes = list("pasta" = 1, "tomato" = 1)
	foodtypes = GRAIN | VEGETABLES

/obj/item/food/spaghetti/meatballspaghetti
	name = "spaghetti and meatballs"
	desc = "Now that's a nic'e meatball!"
	icon_state = "meatballspaghetti"
	food_reagents = list(
		"nutriment" = 16,
	)
	tastes = list("pasta" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT

/obj/item/food/spaghetti/spesslaw
	name = "spesslaw"
	desc = "A lawyers favourite."
	icon_state = "spesslaw"
	food_reagents = list(
		"nutriment" = 27,
	)
	tastes = list("pasta" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT

/obj/item/food/spaghetti/chowmein
	name = "chow mein"
	desc = "A nice mix of noodles and fried vegetables."
	icon_state = "chowmein"
	food_reagents = list(
		"nutriment" = 14,
	)
	tastes = list("noodle" = 1, "meat" = 1, "fried vegetables" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES

/obj/item/food/spaghetti/beefnoodle
	name = "beef noodle"
	desc = "Nutritious, beefy and noodly."
	icon_state = "beefnoodle"
	trash_type = /obj/item/trash/snack_bowl
	food_reagents = list(
		"nutriment" = 12,
	)
	tastes = list("noodles" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES

/obj/item/food/spaghetti/butternoodles
	name = "butter noodles"
	desc = "Noodles covered in savory butter. Simple and slippery, but delicious."
	icon_state = "butternoodles"
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("noodles" = 1, "butter" = 1)
	foodtypes = GRAIN | DAIRY

/obj/item/food/spaghetti/mac_n_cheese
	name = "mac n' cheese"
	desc = "Made the proper way with only the finest cheese and breadcrumbs. And yet, it can't scratch the same itch as Ready-Donk."
	icon_state = "mac_n_cheese"
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("cheese" = 1, "breadcrumbs" = 1, "pasta" = 1)
	foodtypes = GRAIN | DAIRY

/obj/item/food/spaghetti/shoyu_tonkotsu_ramen
	name = "shoyu tonkotsu ramen"
	desc = "A simple ramen made of meat, egg, onion, and a sheet of seaweed."
	icon_state = "shoyu_tonkotsu_ramen"
	trash_type = /obj/item/trash/snack_bowl
	food_reagents = list(
		"nutriment" = 24,
	)
	tastes = list("noodles" = 5, "meat" = 3, "egg" = 4, "dried seaweed" = 2)
	foodtypes = GRAIN | MEAT | VEGETABLES

/obj/item/food/spaghetti/kitakata_ramen
	name = "kitakata ramen"
	desc = "A hearty ramen composed of meat, mushrooms, onion, and garlic. Often given to the sick to comfort them"
	icon_state = "kitakata_ramen"
	trash_type = /obj/item/trash/snack_bowl
	food_reagents = list(
		"nutriment" = 29,
	)
	tastes = list("noodles" = 5, "meat" = 4, "mushrooms" = 3, "onion" = 2)
	foodtypes = GRAIN | MEAT | VEGETABLES

/obj/item/food/spaghetti/kitsune_udon
	name = "kitsune udon"
	desc = "A vegetarian udon made of fried tofu and onions, made sweet and savory with sugar and soy sauce. The name comes from an old folktale about a fox enjoying fried tofu."
	icon_state = "kitsune_udon"
	trash_type = /obj/item/trash/snack_bowl
	food_reagents = list(
		"nutriment" = 26,
	)
	tastes = list("noodles" = 5, "tofu" = 4, "sugar" = 3, "soy sauce" = 2)
	foodtypes = GRAIN | VEGETABLES

/obj/item/food/spaghetti/nikujaga
	name = "nikujaga"
	desc = "A delightful Japanese stew of noodles, onions, potatoes, and meat with mixed vegetables."
	icon_state = "nikujaga"
	trash_type = /obj/item/trash/snack_bowl
	food_reagents = list(
		"nutriment" = 36,
	)
	tastes = list("noodles" = 5, "meat" = 4, "potato" = 3, "onion" = 2, "mixed veggies" = 2)
	foodtypes = GRAIN | VEGETABLES | MEAT

/obj/item/food/spaghetti/pho
	name = "pho"
	desc = "A Vietnamese dish made of noodles, vegetables, herbs, and meat. Makes for a very popular street food."
	icon_state = "pho"
	trash_type = /obj/item/trash/snack_bowl
	food_reagents = list(
		"nutriment" = 28,
	)
	tastes = list("noodles" = 5, "meat" = 4, "cabbage" = 3, "onion" = 2, "herbs" = 2)
	foodtypes = GRAIN | VEGETABLES | MEAT

/obj/item/food/spaghetti/pad_thai
	name = "pad thai"
	desc = "A stir-fried noodle dish popular in Thailand made of peanuts, tofu, lime, and onions."
	icon_state = "pad_thai"
	trash_type = /obj/item/trash/snack_bowl
	food_reagents = list(
		"nutriment" = 29,
	)
	tastes = list("noodles" = 5, "fried tofu" = 4, "lime" = 2, "peanut" = 3, "onion" = 2)
	foodtypes = GRAIN | VEGETABLES | NUTS | FRUIT
