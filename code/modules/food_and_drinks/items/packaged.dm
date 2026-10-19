// Pre-packaged meals, canned, wrapped, and vended

// Cans
/obj/item/food/canned
	name = "Canned Air"
	desc = "If you ever wondered where air came from..."
	food_reagents = list(
		"oxygen" = 6,
		"nitrogen" = 24,
	)
	icon = 'icons/obj/food/canned.dmi'
	icon_state = "peachcan"
	food_flags = FOOD_IN_CONTAINER
	w_class = SIZE_MEDIUM
	max_volume = 30
	w_class = SIZE_SMALL
	preserved_food = TRUE

/obj/item/food/canned/beans
	name = "tin of beans"
	desc = "Musical fruit in a slightly less musical container."
	icon_state = "beans"
	food_reagents = list(
		"nutriment" = 13,
		"ketchup" = 4,
	)
	tastes = list("beans" = 1)
	foodtypes = VEGETABLES

/obj/item/food/canned/peaches
	name = "canned peaches"
	desc = "Just a nice can of ripe peaches swimming in their own juices."
	icon_state = "peachcan"
	food_reagents = list(
		"peachjuice" = 20,
		"sugar" = 8,
		"nutriment" = 2,
	)
	tastes = list("peaches" = 7, "tin" = 1)
	foodtypes = FRUIT | SUGAR

/obj/item/food/canned/peaches/maint
	name = "Maintenance Peaches"
	desc = "I have a mouth and I must eat."
	icon_state = "peachcanmaint"
	tastes = list("peaches" = 1, "tin" = 7)
	venue_value = FOOD_PRICE_EXOTIC

/obj/item/food/canned/pine_nuts
	name = "canned pine nuts"
	desc = "A small can of pine nuts. Can be eaten on their own, if you're into that."
	icon_state = "pinenutscan"
	food_reagents = list("nutriment" = 3)
	tastes = list("pine nuts" = 1)
	foodtypes = NUTS
	w_class = SIZE_SMALL

/obj/item/food/canned/envirochow
	name = "dog eat dog envirochow"
	desc = "The first pet food product that is made fully sustainable by employing ancient British animal husbandry techniques."
	icon_state = "envirochow"
	food_reagents = list(
		"nutriment" = 13,
	)
	tastes = list("dog food" = 5, "狗肉" = 3)
	foodtypes = MEAT | GROSS

///This proc checks if the mob is able to recieve the buff.
///This makes the animal eat the food, and applies the buff status effect to them.
/obj/item/food/canned/squid_ink
	name = "canned squid ink"
	desc = "An odd ingredient in typical cooking, squid ink lends a taste of the sea to any dish- while also dyeing it jet black in the process."
	icon_state = "squidinkcan"
	food_reagents = list("nutriment" = 5, "sodiumchloride" = 5)
	tastes = list("seafood" = 7, "tin" = 1)
	foodtypes = SEAFOOD

/obj/item/food/canned/chap
	name = "can of CHAP"
	desc = "CHAP: Chopped Ham And Pork. The classic American canned meat product that won a world war, then sent millions of servicemen home with heart congestion."
	icon_state = "chapcan"
	food_reagents = list("nutriment" = 5, "sodiumchloride" = 5)
	tastes = list("meat" = 7, "tin" = 1)
	foodtypes = MEAT

/obj/item/food/canned/chap/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/chapslice, 5, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut")

/obj/item/food/chapslice
	name = "slice of chap"
	desc = "A thin slice of chap. Useful for frying, or making sandwiches."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "chapslice"
	food_reagents = list(
		"nutriment" = 3,
	)
	tastes = list("meat" = 1)
	foodtypes = MEAT
	w_class = SIZE_SMALL

/obj/item/food/chapslice/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/grilled_chapslice, rand(20 SECONDS, 40 SECONDS), TRUE, TRUE)

/obj/item/food/grilled_chapslice
	name = "grilled slice of chap"
	desc = "A greasy hot slice of chap. Forms a good part of a balanced meal."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "chapslice_grilled"
	food_reagents = list(
		"nutriment" = 3,
	)
	burns_on_grill = TRUE
	tastes = list("meat" = 1)
	foodtypes = MEAT
	w_class = SIZE_SMALL

// DONK DINNER: THE INNOVATIVE WAY TO GET YOUR DAILY RECOMMENDED ALLOWANCE OF SALT... AND THEN SOME!
/obj/item/food/ready_donk
	name = "\improper Ready-Donk: Bachelor Chow"
	desc = "A quick Donk-dinner: now with flavour!"
	icon_state = "ready_donk_bachelor"
	food_reagents = list("nutriment" = 5)
	tastes = list("food?" = 2, "laziness" = 1)
	foodtypes = MEAT | JUNKFOOD
	food_flags = FOOD_FINGER_FOOD
	w_class = SIZE_SMALL

	/// What type of ready-donk are we warmed into?
	var/warm_type = /obj/item/food/ready_donk/warm

	/// What reagents should be added when this item is warmed?
	var/static/list/added_reagents = list("tricordrazine" = 3)

/obj/item/food/ready_donk/make_bakeable()
	AddComponent(/datum/component/bakeable, warm_type, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE, added_reagents)

/obj/item/food/ready_donk/make_microwaveable()
	AddElement(/datum/element/microwavable, warm_type, added_reagents)

/obj/item/food/ready_donk/warm
	name = "warm Ready-Donk: Bachelor Chow"
	desc = "A quick Donk-dinner, now with flavour! And it's even hot!"
	icon_state = "ready_donk_bachelor_warm"
	food_reagents = list(
		"nutriment" = 5,
		"tricordrazine" = 3,
	)
	tastes = list("food?" = 2, "laziness" = 1)

	// Don't burn your warn ready donks.
	warm_type = /obj/item/food/badrecipe

/obj/item/food/ready_donk/mac_n_cheese
	name = "\improper Ready-Donk: Donk-a-Roni"
	desc = "Neon-orange mac n' cheese in seconds!"
	icon_state = "ready_donk_mac"
	tastes = list("cheesy pasta" = 2, "laziness" = 1)
	foodtypes = GRAIN | DAIRY | JUNKFOOD

	warm_type = /obj/item/food/ready_donk/warm/mac_n_cheese

/obj/item/food/ready_donk/warm/mac_n_cheese
	name = "warm Ready-Donk: Donk-a-Roni"
	desc = "Neon-orange mac n' cheese, ready to eat!"
	icon_state = "ready_donk_mac_warm"
	tastes = list("cheesy pasta" = 2, "laziness" = 1)
	foodtypes = GRAIN | DAIRY | JUNKFOOD

/obj/item/food/ready_donk/donkhiladas
	name = "\improper Ready-Donk: Donkhiladas"
	desc = "Donk Co's signature Donkhiladas with Donk sauce, for an 'authentic' taste of Mexico."
	icon_state = "ready_donk_mex"
	tastes = list("enchiladas" = 2, "laziness" = 1)
	foodtypes = GRAIN | DAIRY | MEAT | VEGETABLES | JUNKFOOD

	warm_type = /obj/item/food/ready_donk/warm/donkhiladas

/obj/item/food/ready_donk/warm/donkhiladas
	name = "warm Ready-Donk: Donkhiladas"
	desc = "Donk Co's signature Donkhiladas with Donk sauce, served as hot as the Mexican sun."
	icon_state = "ready_donk_mex_warm"
	tastes = list("enchiladas" = 2, "laziness" = 1)
	foodtypes = GRAIN | DAIRY | MEAT | VEGETABLES | JUNKFOOD

/obj/item/food/ready_donk/nachos_grandes //which translates to... big nachos
	name = "\improper Ready-Donk: Donk Sol Series Boritos Nachos Grandes"
	desc = "Get ready for game day with Donk's classic Nachos Grandes, sponsors of the Donk Sol Series! Boritos chips loaded with cheese, spicy meat and beans, alongside separate guac, pico and donk sauce. Batter up!"
	icon_state = "ready_donk_nachos"
	tastes = list("nachos" = 2, "laziness" = 1)
	foodtypes = GRAIN | DAIRY | MEAT | VEGETABLES | JUNKFOOD

	warm_type = /obj/item/food/ready_donk/warm/nachos_grandes

/obj/item/food/ready_donk/warm/nachos_grandes
	name = "warm Ready-Donk: Donk Sol Series Boritos Nachos Grandes"
	desc = "Get ready for game day with Donk's classic Nachos Grandes, sponsors of the Donk Sol Series! Boritos chips loaded with cheese, spicy meat and beans, alongside separate guac, pico and donk sauce. Served hotter than Sakamoto's fastball!"
	icon_state = "ready_donk_nachos_warm"
	tastes = list("nachos" = 2, "laziness" = 1)
	foodtypes = GRAIN | DAIRY | MEAT | VEGETABLES | JUNKFOOD

/obj/item/food/ready_donk/donkrange_chicken
	name = "\improper Ready-Donk: Donk-range Chicken"
	desc = "A Chinese classic, it's Donk's original spicy orange chicken with stir-fried peppers and onions, all over steamed rice."
	icon_state = "ready_donk_orange"
	tastes = list("orange chicken" = 2, "laziness" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES | JUNKFOOD

	warm_type = /obj/item/food/ready_donk/warm/donkrange_chicken

/obj/item/food/ready_donk/warm/donkrange_chicken
	name = "warm Ready-Donk: Donk-range Chicken"
	desc = "A Chinese classic, it's Donk's original spicy orange chicken with stir-fried peppers and onions, all over steamed rice and served hotter than a dragon's breath."
	icon_state = "ready_donk_orange_warm"
	tastes = list("orange chicken" = 2, "laziness" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES | JUNKFOOD

/obj/item/food/ready_donk/salisbury_steak
	name = "\improper Ready-Donk Donkriginals: Salisbury Steak"
	desc = "The original and best: it's a slab of moulded beef, drenched in brown gravy, with a side of mashed potatoes. Better find a TV to eat this in front of."
	icon_state = "ready_donk_salisbury"
	tastes = list("salisbury steak" = 2, "laziness" = 1)
	foodtypes = MEAT | VEGETABLES | JUNKFOOD

	warm_type = /obj/item/food/ready_donk/warm/salisbury_steak

/obj/item/food/ready_donk/warm/salisbury_steak
	name = "warm Ready-Donk Donkriginals: Salisbury Steak"
	desc = "The original and best: it's a slab of moulded beef, drenched in brown gravy, with a side of mashed potatoes. It's almost as hot as a season finale."
	icon_state = "ready_donk_salisbury_warm"
	tastes = list("salisbury steak" = 2, "laziness" = 1)
	foodtypes = MEAT | VEGETABLES | JUNKFOOD

/obj/item/food/ready_donk/country_chicken
	name = "\improper Ready-Donk Donkriginals: Country-Fried Chicken"
	desc = "A TV dinner classic: \"crispy\" fried chicken in country gravy, mashed potatoes, and green beans."
	icon_state = "ready_donk_chicken"
	tastes = list("country-fried chicken" = 2, "laziness" = 1)
	foodtypes = MEAT | DAIRY | VEGETABLES | JUNKFOOD

	warm_type = /obj/item/food/ready_donk/warm/country_chicken

/obj/item/food/ready_donk/warm/country_chicken
	name = "warm Ready-Donk Donkriginals: Country-Fried Chicken"
	desc = "A TV dinner classic: \"crispy\" fried chicken in country gravy, mashed potatoes, and green beans. Get it while it's hot!"
	icon_state = "ready_donk_chicken_warm"
	tastes = list("country-fried chicken" = 2, "laziness" = 1)
	foodtypes = MEAT | DAIRY | VEGETABLES | JUNKFOOD

// Rations
/obj/item/food/rationpack
	name = "ration pack"
	desc = "A square bar that sadly <i>looks</i> like chocolate, packaged in a nondescript grey wrapper. Has saved soldiers' lives before - usually by stopping bullets."
	icon_state = "rationpack"
	bite_consumption = 3
	junkiness = 15
	tastes = list("cardboard" = 3, "sadness" = 3)
	foodtypes = null //Don't ask what went into them. You're better off not knowing.
	food_reagents = list(
		"nutriment" = 12,
	) //Won't make you fat. Will make you question your sanity.

///Override for checkliked callback
