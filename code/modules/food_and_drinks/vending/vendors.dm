/obj/structure/machinery/vending/bastion/boozeomat
	name = "\improper Booze-O-Mat"
	desc = "A technological marvel, supposedly able to mix just the mixture you'd like to drink the moment you ask for one."
	icon_state = "boozeomat"
	product_slogans = "I hope nobody asks me for a bloody cup o' tea...;Alcohol is humanity's friend. Would you abandon a friend?;Quite delighted to serve you!;Is nobody thirsty on this station?"
	product_ads = "Drink up!;Booze is good for you!;Alcohol is humanity's best friend.;Quite delighted to serve you!;Care for a nice, cold beer?;Nothing cures you like booze!;Have a sip!;Have a drink!;Have a beer!;Beer is good for you!;Only the finest alcohol!;Best quality booze since 2053!;Award-winning wine!;Maximum alcohol!;Man loves beer.;A toast for progress!"
	products = list(
		/obj/item/reagent_container/food/drinks/bastion/bottle/curacao = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/applejack = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/wine_voltaic = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/tequila = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/rum = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/cognac = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/wine = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/absinthe = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/vermouth = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/gin = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/grenadine = 4,
		/obj/item/reagent_container/food/drinks/bastion/bottle/hcider = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/amaretto = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/ale = 6,
		/obj/item/reagent_container/food/drinks/bastion/bottle/grappa = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/navy_rum = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/maltliquor = 6,
		/obj/item/reagent_container/food/drinks/bastion/bottle/kahlua = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/sake = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/beer = 6,
		/obj/item/reagent_container/food/drinks/bastion/bottle/vodka = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/whiskey = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/coconut_rum = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/yuyake = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/shochu = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/aperitivo = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/maraschino = 5,
		/obj/item/reagent_container/food/drinks/bastion/can/beer = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/beer/rice = 10,
		/obj/item/reagent_container/food/drinks/bastion/ice = 10,
		/obj/item/reagent_container/food/drinks/bastion/bottle/juice/limejuice = 4,
		/obj/item/reagent_container/food/drinks/bastion/bottle/juice/menthol = 4,
		/obj/item/reagent_container/food/drinks/bastion/bottle/juice/cream = 4,
		/obj/item/reagent_container/food/drinks/bastion/bottle/juice/orangejuice = 4,
		/obj/item/reagent_container/food/drinks/bastion/bottle/juice/tomatojuice = 4,
		/obj/item/reagent_container/food/drinks/bastion/can/sodawater = 15,
		/obj/item/reagent_container/food/drinks/bastion/can/sol_dry = 8,
		/obj/item/reagent_container/food/drinks/bastion/can/cola = 8,
		/obj/item/reagent_container/food/drinks/bastion/can/tonic = 8,
		/obj/item/reagent_container/food/drinks/bastion/bottle/hakka_mate = 5,
		/obj/item/reagent_container/food/drinks/bastion/can/melon_soda = 5,
		/obj/item/reagent_container/food/drinks/bastion/glass = 30,
		/obj/item/reagent_container/food/drinks/bastion/shotglass = 12,
		/obj/item/reagent_container/food/drinks/bastion/flask = 3,
		/obj/item/reagent_container/food/drinks/bastion/bottle = 15,
		/obj/item/reagent_container/food/drinks/bastion/bottle/small = 15,
		/obj/item/bastion_garnish/olives = 10,
		/obj/item/bastion_garnish/umbrellared = 10,
		/obj/item/bastion_garnish/umbrellablue = 10,
		/obj/item/bastion_garnish/umbrellagreen = 10,
	)
	contraband = list(
		/obj/item/reagent_container/food/drinks/bastion/mug/tea = 12,
		/obj/item/reagent_container/food/drinks/bastion/bottle/fernet = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/herbal_liqueur = 2,
	)
	premium = list(
		/obj/item/reagent_container/food/drinks/bastion/bottle/herbal_liqueur = 2,
		/obj/item/reagent_container/food/drinks/bastion/bottle/champagne = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/trappist = 5,
		/obj/item/reagent_container/food/drinks/bastion/bottle/bitters = 5,
	)

/obj/structure/machinery/vending/bastion/boozeomat/all_access
	desc = "A technological marvel, supposedly able to mix just the mixture you'd like to drink the moment you ask for one. This model appears to have no access restrictions."

/obj/structure/machinery/vending/bastion/boozeomat/syndicate_access
	icon_state = "refill_booze"

/obj/structure/machinery/vending/bastion/cola
	name = "\improper Robust Softdrinks"
	desc = "A softdrink vendor provided by Robust Industries, LLC."
	icon_state = "Cola_Machine"
	product_slogans = "Robust Softdrinks: More robust than a toolbox to the head!"
	product_ads = "Refreshing!;Hope you're thirsty!;Over 1 million drinks sold!;Thirsty? Why not cola?;Please, have a drink!;Drink up!;The best drinks in space."
	products = list(
		/obj/item/reagent_container/food/drinks/bastion/can/cola = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/space_mountain_wind = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/dr_gibb = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/starkist = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/space_up = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/pwr_game = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/lemon_lime = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/sol_dry = 10,
		/obj/item/reagent_container/food/drinks/bastion/waterbottle = 10,
		/obj/item/reagent_container/food/drinks/bastion/bottle/mushi_kombucha = 3,
		/obj/item/reagent_container/food/drinks/bastion/can/volt_energy = 3,
	)
	contraband = list(
		/obj/item/reagent_container/food/drinks/bastion/can/thirteenloko = 6,
		/obj/item/reagent_container/food/drinks/bastion/can/shamblers = 6,
		/obj/item/reagent_container/food/drinks/bastion/can/wellcheers = 6,
	)
	premium = list(
		/obj/item/reagent_container/food/drinks/bastion/glass/filled/nuka_cola = 1,
		/obj/item/reagent_container/food/drinks/bastion/glass/filled/sunset_sarsaparilla = 1,
		/obj/item/reagent_container/food/drinks/bastion/can/air = 1,
		/obj/item/reagent_container/food/drinks/bastion/can/monkey_energy = 1,
		/obj/item/reagent_container/food/drinks/bastion/can/grey_bull = 1,
		/obj/item/reagent_container/food/drinks/bastion/bottle/rootbeer = 1,
	)

/obj/structure/machinery/vending/bastion/cola/blue
	icon_state = "Cola_Machine"

/obj/structure/machinery/vending/bastion/cola/black
	icon_state = "cola_black"

/obj/structure/machinery/vending/bastion/cola/red
	name = "\improper Space Cola Vendor"
	desc = "It vends cola, in space."
	icon_state = "red_cola"
	product_slogans = "Cola in space!"

/obj/structure/machinery/vending/bastion/cola/space_up
	name = "\improper Space-up! Vendor"
	desc = "Indulge in an explosion of flavor."
	icon_state = "space_up"
	product_slogans = "Space-up! Like a hull breach in your mouth."

/obj/structure/machinery/vending/bastion/cola/starkist
	name = "\improper Star-kist Vendor"
	desc = "The taste of a star in liquid form."
	icon_state = "starkist"
	product_slogans = "Drink the stars! Star-kist!"

/obj/structure/machinery/vending/bastion/cola/sodie
	icon_state = "soda"

/obj/structure/machinery/vending/bastion/cola/pwr_game
	name = "\improper Pwr Game Vendor"
	desc = "You want it, we got it. Brought to you in partnership with Vlad's Salads."
	icon_state = "pwr_game"
	product_slogans = "The POWER that gamers crave! PWR GAME!"

/obj/structure/machinery/vending/bastion/cola/shamblers
	name = "\improper Shambler's Vendor"
	desc = "~Shake me up some of that Shambler's Juice!~"
	icon_state = "shamblers_juice"
	product_slogans = "~Shake me up some of that Shambler's Juice!~"
	product_ads = "Refreshing!;Thirsty for DNA? Satiate your craving!;Over 1 trillion souls drank!;Made with real DNA!;The hivemind demands your thirst!;Drink up!;Absorb your thirst."
	products = list(
		/obj/item/reagent_container/food/drinks/bastion/can/cola = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/space_mountain_wind = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/dr_gibb = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/starkist = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/space_up = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/pwr_game = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/lemon_lime = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/sol_dry = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/shamblers = 10,
		/obj/item/reagent_container/food/drinks/bastion/can/wellcheers = 5,
	)

/obj/structure/machinery/vending/bastion/snack
	name = "\improper Getmore Chocolate Corp"
	desc = "A snack machine courtesy of the Getmore Chocolate Corporation, based out of Mars."
	icon_state = "snack"
	product_slogans = "Try our new nougat bar!;Twice the calories for half the price!"
	product_ads = "The healthiest!;Award-winning chocolate bars!;Mmm! So good!;Oh my god it's so juicy!;Have a snack.;Snacks are good for you!;Have some more Getmore!;Best quality snacks straight from mars.;We love chocolate!;Try our new jerky!"
	products = list(
		/obj/item/food/spacetwinkie = 6,
		/obj/item/food/cheesiehonkers = 6,
		/obj/item/food/candy = 6,
		/obj/item/food/chips = 6,
		/obj/item/food/chips/shrimp = 6,
		/obj/item/food/sosjerky = 12,
		/obj/item/food/cornchips/random = 6,
		/obj/item/food/no_raisin = 6,
		/obj/item/food/peanuts = 6,
		/obj/item/food/peanuts/random = 3,
		/obj/item/food/cnds = 6,
		/obj/item/food/cnds/random = 3,
		/obj/item/food/semki = 6,
		/obj/item/reagent_container/food/drinks/bastion/dry_ramen = 3,
		/obj/item/food/energybar = 6,
		/obj/item/food/hot_shots = 6,
		/obj/item/food/sticko = 6,
		/obj/item/food/sticko/random = 3,
		/obj/item/food/shok_roks = 6,
		/obj/item/food/shok_roks/random = 3,
	)
	contraband = list(
		/obj/item/food/syndicake = 6,
		/obj/item/food/mint = 12,
		/obj/item/food/peanuts/ban_appeal = 3,
		/obj/item/food/candy/bronx = 1,
	)
	premium = list(
		/obj/item/food/pistachios = 3,
		/obj/item/food/swirl_lollipop = 3,
	)

/obj/structure/machinery/vending/bastion/snack/blue
	icon_state = "snackblue"

/obj/structure/machinery/vending/bastion/snack/orange
	icon_state = "snackorange"

/obj/structure/machinery/vending/bastion/snack/green
	icon_state = "snackgreen"

/obj/structure/machinery/vending/bastion/snack/teal
	icon_state = "snackteal"

/obj/structure/machinery/vending/bastion/coffee
	name = "\improper Solar's Best Hot Drinks"
	desc = "A vending machine which dispenses hot drinks."
	icon_state = "coffee"
	product_ads = "Have a drink!;Drink up!;It's good for you!;Would you like a hot joe?;I'd kill for some coffee!;The best beans in the galaxy.;Only the finest brew for you.;Mmmm. Nothing like a coffee.;I like coffee, don't you?;Coffee helps you work!;Try some tea.;We hope you like the best!;Try our new chocolate!;Admin conspiracies"
	products = list(
		/obj/item/reagent_container/food/drinks/bastion/coffee = 6,
		/obj/item/reagent_container/food/drinks/bastion/mug/tea = 6,
		/obj/item/reagent_container/food/drinks/bastion/mug/coco = 3,
		/obj/item/reagent_container/food/drinks/bastion/mug/britcup/bogril = 3,
	)
	contraband = list(
		/obj/item/reagent_container/food/drinks/bastion/ice = 12,
	)

/obj/structure/machinery/vending/bastion/dinnerware
	name = "\improper Plasteel Chef's Dinnerware Vendor"
	desc = "A kitchen and restaurant equipment vendor."
	icon_state = "dinnerware"
	product_ads = "Mm, food stuffs!;Food and food accessories.;Get your plates!;You like forks?;I like forks.;Woo, utensils.;You don't really need these..."
	products = list(
		/obj/item/reagent_container/glass/soup_pot = 3,
		/obj/item/bastion_kitchen/spoon/soup_ladle = 3,
		/obj/item/bastion_kitchen/rollingpin = 2,
		/obj/item/bastion_kitchen/knife = 2,
		/obj/item/bastion_kitchen/fork = 6,
		/obj/item/bastion_kitchen/spoon = 10,
		/obj/item/tool/kitchen/tray = 8,
		/obj/item/clothing/suit/bastion/apron/chef = 2,
		/obj/item/reagent_container/food/drinks/bowl = 30,
		/obj/item/reagent_container/food/drinks/sillycup = 20,
		/obj/item/reagent_container/food/drinks/bastion/glass = 8,
		/obj/item/reagent_container/food/condiment/bastion/pack/ketchup = 5,
		/obj/item/reagent_container/food/condiment/bastion/pack/hotsauce = 5,
		/obj/item/reagent_container/food/condiment/bastion/pack/astrotame = 5,
		/obj/item/reagent_container/food/condiment/bastion/saltshaker = 5,
		/obj/item/reagent_container/food/condiment/bastion/peppermill = 5,
	)
	contraband = list(
		/obj/item/bastion_kitchen/rollingpin/illegal = 2,
		/obj/item/bastion_kitchen/knife/butcher = 2,
	)

/obj/structure/machinery/vending/bastion/hotdog
	name = "\improper Hotdoggo-Vend"
	desc = "An outdated hotdog vending machine, its prices stuck to those of 20 or so years ago."
	icon_state = "hotdog-vendor"
	product_slogans = "Meatier than ever!;Now with 20% more MSG!;HOTDOGS!;Now Tirizan-friendly!"
	product_ads = "Your best and only automatic hotdog dispenser!;Serving you the finest buns since 2469!;Comes in 12 different flavors!"
	vend_reply = "Have a scrumptious meal!"
	products = list(
		/obj/item/food/hotdog = 8,
		/obj/item/food/pigblanket = 4,
		/obj/item/food/danish_hotdog = 4,
		/obj/item/food/butterdog = 4,
		/obj/item/food/sausage = 8,
		/obj/item/reagent_container/food/condiment/bastion/pack/ketchup = 4,
		/obj/item/reagent_container/food/condiment/bastion/pack/hotsauce = 4,
		/obj/item/reagent_container/food/condiment/bastion/pack/bbqsauce = 4,
	)

/obj/structure/machinery/vending/bastion/sustenance
	name = "\improper Sustenance Vendor"
	desc = "A vending machine which vends food, as required by section 47-C of the NT's Prisoner Ethical Treatment Agreement."
	icon_state = "sustenance"
	product_slogans = "Enjoy your meal.;Enough calories to support strenuous labor."
	product_ads = "Sufficiently healthy.;Efficiently produced tofu!;Mmm! So good!;Have a meal.;You need food to live!;Even prisoners deserve their daily bread!;Have some more candy corn!;Try our new ice cups!"
	products = list(
		/obj/item/food/tofu/prison = 24,
		/obj/item/food/breadslice/moldy = 15,
		/obj/item/reagent_container/food/drinks/bastion/ice/prison = 12,
		/obj/item/food/candy_corn/prison = 6,
		/obj/item/bastion_kitchen/spoon/plastic = 6,
	)
	contraband = list(
		/obj/item/bastion_kitchen/knife = 6,
		/obj/item/bastion_kitchen/spoon = 6,
		/obj/item/reagent_container/food/drinks/bastion/coffee = 12,
		/obj/item/clothing/mask/breath = 6,
	)

/obj/structure/machinery/vending/bastion/sovietsoda
	name = "\improper BODA"
	desc = "Old sweet water vending machine."
	icon_state = "sovietsoda"
	product_ads = "For Tsar and Country.;Have you fulfilled your nutrition quota today?;Very nice!;We are simple people, for this is all we eat.;If there is a person, there is a problem. If there is no person, then there is no problem."
	products = list(
		/obj/item/reagent_container/food/drinks/bastion/glass/filled/soda = 30,
	)
	contraband = list(
		/obj/item/reagent_container/food/drinks/bastion/glass/filled/cola = 20,
		/obj/item/reagent_container/food/drinks/bastion/glass/filled/space_bola = 20,
	)

/obj/structure/machinery/vending/bastion/donksnack
	name = "\improper Donk Co Vendor"
	desc = "A snack machine courtesy of Donk Co."
	icon_state = "snackdonk"
	product_slogans = "Just microwave and eat!;The original home of the Donk Pocket!"
	product_ads = "The original!;You wanna put a bangin' Donk on it!;The best!;The seasoned traitor's food of choice!;Now with 12% more omnizine!;Eat DONK or DIE!;The galaxy's most popular microwavable snack food!*;Try our NEW Ready-Donk Meals!"
	products = list(
		/obj/item/food/donkpocket = 6,
		/obj/item/food/donkpocket/berry = 6,
		/obj/item/food/donkpocket/honk = 6,
		/obj/item/food/donkpocket/pizza = 6,
		/obj/item/food/donkpocket/spicy = 6,
		/obj/item/food/donkpocket/teriyaki = 6,
		/obj/item/food/tatortot = 12,
	)
	contraband = list(
		/obj/item/food/waffles = 2,
		/obj/item/food/dankpocket = 2,
		/obj/item/food/donkpocket/gondola = 1,
	)
	premium = list(
		/obj/item/storage/box/bastion_donk = 3,
		/obj/item/storage/box/bastion_donk/berry = 3,
		/obj/item/storage/box/bastion_donk/honk = 3,
		/obj/item/storage/box/bastion_donk/pizza = 3,
		/obj/item/storage/box/bastion_donk/spicy = 3,
		/obj/item/storage/box/bastion_donk/teriyaki = 3,
	)

