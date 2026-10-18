/obj/item/food/grown
	icon = 'icons/obj/hydroponics/harvest.dmi'
	icon_state = "berrypile"
	name = "fresh produce"
	bite_consumption = 2
	foodtypes = VEGETABLES

/obj/item/food/grown/apple
	name = "apple"
	desc = "It's a little piece of Eden."
	icon_state = "apple"
	foodtypes = FRUIT
	tastes = list("apple" = 1)
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/apple/gold
	name = "golden apple"
	desc = "Emblazoned upon the apple is the word 'Kallisti'."
	icon_state = "goldapple"
	food_reagents = list(
		"gold" = 10,
		"nutriment" = 7,
	)

/obj/item/food/grown/banana
	name = "banana"
	desc = "It's an excellent prop for a clown."
	icon_state = "banana"
	foodtypes = FRUIT
	food_reagents = list(
		"banana" = 5,
		"potassium" = 5,
		"nutriment" = 3,
	)

/obj/item/food/grown/bell_pepper
	name = "bell pepper"
	desc = "A big mild pepper that's good for many things."
	icon_state = "bell_pepper"
	foodtypes = FRUIT
	food_reagents = list(
		"nutriment" = 6,
	)

/obj/item/food/grown/bell_pepper/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/roasted_bell_pepper, rand(15 SECONDS, 25 SECONDS), TRUE, TRUE)

/obj/item/food/grown/berries
	name = "bunch of berries"
	desc = "Nutritious!"
	icon_state = "berrypile"
	foodtypes = FRUIT
	tastes = list("berry" = 1)
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/bluecherries
	name = "blue cherries"
	desc = "They're cherries that are blue."
	icon_state = "bluecherry"
	foodtypes = FRUIT
	tastes = list("blue cherry" = 1)
	food_reagents = list(
		"nutriment" = 4,
		"sugar" = 4,
		"oxygen" = 4,
	)

/obj/item/food/grown/cabbage
	name = "cabbage"
	desc = "Ewwwwwwwwww. Cabbage."
	icon_state = "cabbage"
	foodtypes = VEGETABLES
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/carrot
	name = "carrot"
	desc = "It's good for the eyes!"
	icon_state = "carrot"
	foodtypes = VEGETABLES
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/cherries
	name = "cherries"
	desc = "Great for toppings!"
	icon_state = "cherry"
	foodtypes = FRUIT
	tastes = list("cherry" = 1)
	food_reagents = list(
		"nutriment" = 4,
		"sugar" = 4,
	)

/obj/item/food/grown/chili
	name = "chili"
	desc = "It's spicy! Wait... IT'S BURNING ME!!"
	icon_state = "chilipepper"
	foodtypes = FRUIT
	food_reagents = list(
		"capsaicin" = 13,
		"nutriment" = 4,
	)

/obj/item/food/grown/citrus
	name = "citrus"
	desc = "It's so sour, your face will twist."
	icon_state = "lime"
	foodtypes = FRUIT
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/citrus/lemon
	name = "lemon"
	desc = "When life gives you lemons, make lemonade."
	icon_state = "lemon"
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/citrus/lime
	name = "lime"
	desc = "It's so sour, your face will twist."
	icon_state = "lime"
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/citrus/orange
	name = "orange"
	desc = "It's a tangy fruit."
	icon_state = "orange"
	foodtypes = ORANGES
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/corn
	name = "ear of corn"
	desc = "Needs some butter!"
	icon_state = "corn"
	foodtypes = VEGETABLES
	tastes = list("corn" = 1)
	food_reagents = list(
		"cornoil" = 10,
		"nutriment" = 7,
	)

/obj/item/food/grown/corn/make_bakeable()

/obj/item/food/grown/corn/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/popcorn)

/obj/item/food/grown/cucumber
	name = "cucumber"
	desc = "Oblong and green, with pimples, the standard of salads."
	icon_state = "cucumber"
	foodtypes = VEGETABLES
	tastes = list("cucumber" = 1)
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/eggplant
	name = "eggplant"
	desc = "Maybe there's a chicken inside?"
	icon_state = "eggplant"
	foodtypes = FRUIT
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/garlic
	name = "garlic"
	desc = "Delicious, but with a potentially overwhelming odor."
	icon_state = "garlic"
	tastes = list("garlic" = 1)
	food_reagents = list(
		"garlic" = 8,
		"nutriment" = 5,
	)

/obj/item/food/grown/ghost_chili
	name = "ghost chili"
	desc = "It seems to be vibrating gently."
	icon_state = "ghostchilipepper"
	foodtypes = FRUIT
	food_reagents = list(
		"condensedcapsaicin" = 15,
		"capsaicin" = 28,
		"nutriment" = 2,
	)

/obj/item/food/grown/grapes
	name = "bunch of grapes"
	desc = "Nutritious!"
	icon_state = "grapes"
	foodtypes = FRUIT
	tastes = list("grape" = 1)
	food_reagents = list(
		"nutriment" = 7,
		"sugar" = 5,
	)

/obj/item/food/grown/herbs
	name = "bundle of herbs"
	desc = "A bundle of various herbs. Somehow, you're always able to pick what you need out."
	icon_state = "herbs"
	foodtypes = VEGETABLES
	tastes = list("nondescript herbs" = 1)
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/icepepper
	name = "chilly pepper"
	desc = "It's a mutant strain of chili."
	icon_state = "icepepper"
	foodtypes = FRUIT
	food_reagents = list(
		"frostoil" = 13,
		"nutriment" = 2,
	)

/obj/item/food/grown/mushroom
	name = "mushroom"
	foodtypes = VEGETABLES
	icon_state = "plumphelmet"
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/mushroom/chanterelle
	name = "chanterelle cluster"
	desc = "<I>Cantharellus Cibarius</I>: These jolly yellow little shrooms sure look tasty!"
	icon_state = "chanterelle"
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/mushroom/plumphelmet
	name = "plump-helmet"
	desc = "<I>Plumus Hellmus</I>: Plump, soft and s-so inviting~"
	icon_state = "plumphelmet"
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/oat
	name = "oat"
	desc = "Eat oats, do squats."
	icon_state = "oat"
	foodtypes = GRAIN
	tastes = list("oat" = 1)
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/olive
	name = "olive"
	desc = "A small cylindrical salty fruit closely related to mangoes. Can be ground into a paste and mixed with water to make quality oil."
	icon_state = "olive"
	foodtypes = FRUIT
	tastes = list("olive" = 1)
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/onion
	name = "onion"
	desc = "Nothing to cry over."
	icon_state = "onion"
	tastes = list("onions" = 1)
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/onion/make_processable()

/obj/item/food/grown/onion/red
	name = "red onion"
	desc = "Purple despite the name."
	icon_state = "onion_red"
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/onion/red/make_processable()

/obj/item/food/grown/parsnip
	name = "parsnip"
	desc = "Closely related to carrots."
	icon_state = "parsnip"
	foodtypes = VEGETABLES
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/peanut
	name = "peanut"
	desc = "A tasty pair of groundnuts concealed in a tough shell."
	icon_state = "peanut"
	foodtypes = NUTS
	tastes = list("peanuts" = 1)
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/peas
	name = "peapod"
	desc = "Finally... peas."
	icon_state = "peas"
	foodtypes = VEGETABLES
	tastes = list ("peas" = 1, "chalky saltiness" = 1)
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/pineapple
	name = "pineapples"
	desc = "Blorble."
	icon_state = "pineapple"
	w_class = SIZE_MEDIUM
	foodtypes = FRUIT | PINEAPPLE
	tastes = list("pineapple" = 1)
	food_reagents = list(
		"nutriment" = 11,
		"water" = 2,
	)

/obj/item/food/grown/pineapple/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/pineappleslice, 3, 15, screentip_verb = "Cut")

/obj/item/food/grown/plum
	name = "plum"
	desc = "A poet's favorite fruit. Noice."
	icon_state = "plum"
	foodtypes = FRUIT
	tastes = list("plum" = 1)
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/potato
	name = "potato"
	desc = "Boil 'em! Mash 'em! Stick 'em in a stew!"
	icon_state = "potato"
	foodtypes = VEGETABLES
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/potato/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/baked_potato, rand(15 SECONDS, 25 SECONDS), TRUE, TRUE)

/obj/item/food/grown/potato/sweet
	name = "sweet potato"
	desc = "It's sweet."
	icon_state = "sweetpotato"
	food_reagents = list(
		"nutriment" = 10,
		"sugar" = 5,
	)

/obj/item/food/grown/potato/sweet/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/yakiimo, rand(15 SECONDS, 35 SECONDS), TRUE, TRUE)

/obj/item/food/grown/pumpkin
	name = "pumpkin"
	desc = "It's large and scary."
	icon_state = "pumpkin"
	foodtypes = FRUIT
	food_reagents = list(
		"nutriment" = 12,
	)

/obj/item/food/grown/redbeet
	name = "red beet"
	desc = "You can't beat red beet."
	icon_state = "redbeet"
	foodtypes = VEGETABLES
	food_reagents = list(
		"nutriment" = 5,
	)

/obj/item/food/grown/soybeans
	name = "soybeans"
	desc = "It's pretty bland, but oh the possibilities..."
	icon_state = "soybeans"
	foodtypes = VEGETABLES
	tastes = list("soy" = 1)
	food_reagents = list(
		"nutriment" = 5,
		"cornoil" = 2,
	)

/obj/item/food/grown/sugarcane
	name = "sugarcane"
	desc = "Sickly sweet."
	icon_state = "sugarcane"
	foodtypes = VEGETABLES | SUGAR
	food_reagents = list(
		"nutriment" = 2,
		"sugar" = 13,
	)

/obj/item/food/grown/tomato
	name = "tomato"
	desc = "I say to-mah-to, you say tom-mae-to."
	icon_state = "tomato"
	foodtypes = FRUIT
	food_reagents = list(
		"nutriment" = 7,
	)

/obj/item/food/grown/watermelon
	name = "watermelon"
	desc = "It's full of watery goodness."
	icon_state = "watermelon"
	w_class = SIZE_MEDIUM
	foodtypes = FRUIT
	food_reagents = list(
		"water" = 10,
		"nutriment" = 12,
	)

/obj/item/food/grown/watermelon/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/watermelonslice, 5, 20, screentip_verb = "Slice")

/obj/item/food/grown/wheat
	name = "wheat"
	desc = "Sigh... wheat... a-grain?"
	icon_state = "wheat"
	foodtypes = GRAIN
	tastes = list("wheat" = 1)
	food_reagents = list(
		"nutriment" = 2,
	)

/obj/item/food/grown/whitebeet
	name = "white-beet"
	desc = "You can't beat white-beet."
	icon_state = "whitebeet"
	foodtypes = VEGETABLES
	food_reagents = list(
		"nutriment" = 5,
		"sugar" = 10,
	)


/obj/item/food/onion_slice
	name = "onion slice"
	desc = "Ring, not for wearing."
	icon_state = "onionslice"
	food_reagents = list(
		"nutriment" = 7,
	)
	w_class = SIZE_TINY

/obj/item/food/onion_slice/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/onionrings, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/onion_slice/red
	name = "red onion slice"
	desc = "It shines like an exceptionally low quality amethyst."
	icon_state = "onionslice_red"
