
// see code/module/crafting/table.dm

////////////////////////////////////////////////DONUTS////////////////////////////////////////////////

/datum/crafting_recipe/food/donut
	time = 15
	name = "Donut"
	reqs = list(
		"sugar" = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/donut/plain
	category = CAT_PASTRY


/datum/crafting_recipe/food/donut/chaos
	name = "Chaos donut"
	reqs = list(
		"frostoil" = 5,
		"capsaicin" = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/donut/chaos

/datum/crafting_recipe/food/donut/meat
	time = 15
	name = "Meat donut"
	reqs = list(
		/obj/item/food/meat/rawcutlet = 1,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/donut/meat

/datum/crafting_recipe/food/donut/jelly
	name = "Jelly donut"
	reqs = list(
		"berryjuice" = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/donut/jelly/plain

/datum/crafting_recipe/food/donut/berry
	name = "Berry Donut"
	reqs = list(
		"berryjuice" = 5,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/berry

/datum/crafting_recipe/food/donut/apple
	name = "Apple Donut"
	reqs = list(
		"applejuice" = 5,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/apple

/datum/crafting_recipe/food/donut/caramel
	name = "Caramel Donut"
	reqs = list(
		"sugar" = 5,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/caramel

/datum/crafting_recipe/food/donut/choco
	name = "Chocolate Donut"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		/obj/item/food/donut/plain = 1
	)
	result = /obj/item/food/donut/choco

/datum/crafting_recipe/food/donut/jelly/berry
	name = "Berry Jelly Donut"
	reqs = list(
		"berryjuice" = 5,
		/obj/item/food/donut/jelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/berry

/datum/crafting_recipe/food/donut/jelly/apple
	name = "Apple Jelly Donut"
	reqs = list(
		"applejuice" = 5,
		/obj/item/food/donut/jelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/apple

/datum/crafting_recipe/food/donut/jelly/caramel
	name = "Caramel Jelly Donut"
	reqs = list(
		"sugar" = 5,
		/obj/item/food/donut/jelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/caramel

/datum/crafting_recipe/food/donut/jelly/choco
	name = "Chocolate Jelly Donut"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		/obj/item/food/donut/jelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/choco

/datum/crafting_recipe/food/donut/slimejelly/berry
	name = "Berry Slime Donut"
	reqs = list(
		"berryjuice" = 5,
		/obj/item/food/donut/jelly/slimejelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/slimejelly/berry

/datum/crafting_recipe/food/donut/slimejelly/apple
	name = "Apple Slime Donut"
	reqs = list(
		"applejuice" = 5,
		/obj/item/food/donut/jelly/slimejelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/slimejelly/apple

/datum/crafting_recipe/food/donut/slimejelly/caramel
	name = "Caramel Slime Donut"
	reqs = list(
		"sugar" = 5,
		/obj/item/food/donut/jelly/slimejelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/slimejelly/caramel

/datum/crafting_recipe/food/donut/slimejelly/choco
	name = "Chocolate Slime Donut"
	reqs = list(
		/obj/item/food/chocolatebar = 1,
		/obj/item/food/donut/jelly/slimejelly/plain = 1
	)
	result = /obj/item/food/donut/jelly/slimejelly/choco

/datum/crafting_recipe/food/waffles
	time = 15
	name = "Waffles"
	reqs = list(
		/obj/item/food/pastrybase = 2
	)
	result = /obj/item/food/waffles
	category = CAT_PASTRY


/datum/crafting_recipe/food/soylenviridians
	name = "Soylent viridians"
	reqs = list(
		/obj/item/food/pastrybase = 2,
		/obj/item/food/grown/soybeans = 1
	)
	result = /obj/item/food/soylenviridians
	category = CAT_PASTRY

/datum/crafting_recipe/food/soylentgreen
	name = "Soylent green"
	reqs = list(
		/obj/item/food/pastrybase = 2,
		/obj/item/food/meat/slab/human = 2
	)
	result = /obj/item/food/soylentgreen
	category = CAT_PASTRY


/datum/crafting_recipe/food/donkpocket
	time = 15
	name = "Donk-pocket"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/meatball = 1
	)
	result = /obj/item/food/donkpocket
	category = CAT_PASTRY

/datum/crafting_recipe/food/donkpocket/spicy
	time = 15
	name = "Spicy-pocket"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/meatball = 1,
		/obj/item/food/grown/chili = 1
	)
	result = /obj/item/food/donkpocket/spicy
	category = CAT_PASTRY

/datum/crafting_recipe/food/donkpocket/teriyaki
	time = 15
	name = "Teriyaki-pocket"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/meatball = 1,
		"soysauce" = 5,
	)
	result = /obj/item/food/donkpocket/teriyaki
	category = CAT_PASTRY

/datum/crafting_recipe/food/donkpocket/pizza
	time = 15
	name = "Pizza-pocket"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/meatball = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/donkpocket/pizza
	category = CAT_PASTRY

/datum/crafting_recipe/food/donkpocket/honk
	time = 15
	name = "Honk-Pocket"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/banana = 1,
		"sugar" = 5,
	)
	result = /obj/item/food/donkpocket/honk
	category = CAT_PASTRY

/datum/crafting_recipe/food/donkpocket/berry
	time = 15
	name = "Berry-pocket"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/berries = 1
	)
	result = /obj/item/food/donkpocket/berry
	category = CAT_PASTRY

/datum/crafting_recipe/food/donkpocket/deluxe/vegan
	time = 15
	name = "Deluxe Donk-roll"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/boiledrice = 1,
		/obj/item/food/grown/bell_pepper = 1,
		/obj/item/food/tofu = 2
	)
	result = /obj/item/food/donkpocket/deluxe/vegan
	category = CAT_PASTRY

////////////////////////////////////////////////MUFFINS////////////////////////////////////////////////

/datum/crafting_recipe/food/muffin
	time = 15
	name = "Muffin"
	reqs = list(
		"milk" = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/muffin
	category = CAT_PASTRY

/datum/crafting_recipe/food/berrymuffin
	name = "Berry muffin"
	reqs = list(
		"milk" = 5,
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/berries = 1
	)
	result = /obj/item/food/muffin/berry
	category = CAT_PASTRY

////////////////////////////////////////////OTHER////////////////////////////////////////////


/datum/crafting_recipe/food/khachapuri
	name = "Khachapuri"
	reqs = list(
		"egg" = 6,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/bread/plain = 1
	)
	result = /obj/item/food/khachapuri
	category = CAT_PASTRY

/datum/crafting_recipe/food/sugarcookie
	time = 15
	name = "Sugar cookie"
	reqs = list(
		"sugar" = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/cookie/sugar
	category = CAT_PASTRY

/datum/crafting_recipe/food/fortunecookie
	time = 15
	name = "Fortune cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/paper = 1
	)
	parts = list(
		/obj/item/paper = 1
	)
	result = /obj/item/food/fortunecookie
	category = CAT_PASTRY

/datum/crafting_recipe/food/plumphelmetbiscuit
	time = 15
	name = "Plumphelmet biscuit"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/mushroom/plumphelmet = 1
	)
	result = /obj/item/food/plumphelmetbiscuit
	category = CAT_PASTRY

/datum/crafting_recipe/food/cracker
	time = 15
	name = "Cracker"
	reqs = list(
		"sodiumchloride" = 5,
		/obj/item/food/pastrybase = 1,
	)
	result = /obj/item/food/cracker
	category = CAT_PASTRY

/datum/crafting_recipe/food/chococornet
	name = "Choco cornet"
	reqs = list(
		"sodiumchloride" = 5,
		/obj/item/food/pastrybase = 1,
		/obj/item/food/chocolatebar = 1
	)
	result = /obj/item/food/chococornet
	category = CAT_PASTRY

/datum/crafting_recipe/food/oatmealcookie
	name = "Oatmeal cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/oat = 1
	)
	result = /obj/item/food/cookie/oatmeal
	category = CAT_PASTRY

/datum/crafting_recipe/food/raisincookie
	name = "Raisin cookie"
	reqs = list(
		/obj/item/food/no_raisin = 1,
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/oat = 1
	)
	result = /obj/item/food/cookie/raisin
	category = CAT_PASTRY

/datum/crafting_recipe/food/cherrycupcake
	name = "Cherry cupcake"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/cherries = 1
	)
	result = /obj/item/food/cherrycupcake
	category = CAT_PASTRY

/datum/crafting_recipe/food/bluecherrycupcake
	name = "Blue cherry cupcake"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/bluecherries = 1
	)
	result = /obj/item/food/cherrycupcake/blue
	category = CAT_PASTRY

/datum/crafting_recipe/food/honeybun
	name = "Honey bun"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		"honey" = 5,
	)
	result = /obj/item/food/honeybun
	category = CAT_PASTRY

/datum/crafting_recipe/food/cannoli
	name = "Cannoli"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		"milk" = 5,
		"sugar" = 5,
	)
	result = /obj/item/food/cannoli
	category = CAT_PASTRY

/datum/crafting_recipe/food/peanut_butter_cookie
	name = "Peanut butter cookie"
	reqs = list(
		"peanut_butter" = 5,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/cookie/peanut_butter
	category = CAT_PASTRY

/datum/crafting_recipe/food/raw_brownie_batter
	name = "Raw brownie batter"
	reqs = list(
		"flour" = 5,
		"sugar" = 5,
		/obj/item/food/egg = 2,
		"coco" = 5,
		/obj/item/food/butterslice = 1
	)
	result = /obj/item/food/raw_brownie_batter
	category = CAT_PASTRY

/datum/crafting_recipe/food/peanut_butter_brownie_batter
	name = "Raw peanut butter brownie batter"
	reqs = list(
		"flour" = 5,
		"sugar" = 5,
		/obj/item/food/egg = 2,
		"coco" = 5,
		"peanut_butter" = 5,
		/obj/item/food/butterslice = 1
	)
	result = /obj/item/food/peanut_butter_brownie_batter
	category = CAT_PASTRY

/datum/crafting_recipe/food/crunchy_peanut_butter_tart
	name = "Crunchy peanut butter tart"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		"peanut_butter" = 5,
		/obj/item/food/grown/peanut = 1,
		"cream" = 5,
	)
	result = /obj/item/food/crunchy_peanut_butter_tart
	category = CAT_PASTRY

/datum/crafting_recipe/food/chocolate_chip_cookie
	name = "Chocolate chip cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/chocolatebar = 1,
	)
	result = /obj/item/food/cookie/chocolate_chip_cookie
	category = CAT_PASTRY

/datum/crafting_recipe/food/snickerdoodle
	name = "Snickerdoodle"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		"vanilla" = 5,
	)
	result = /obj/item/food/cookie/snickerdoodle
	category = CAT_PASTRY

/datum/crafting_recipe/food/thumbprint_cookie
	name = "Thumbprint cookie"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		"cherryjelly" = 5,
	)
	result = /obj/item/food/cookie/thumbprint_cookie
	category = CAT_PASTRY

/datum/crafting_recipe/food/macaron
	name = "Macaron"
	reqs = list(
		"egg" = 5,
		"cream" = 5,
		"flour" = 5,
	)
	result = /obj/item/food/cookie/macaron
	category = CAT_PASTRY
