
// see code/module/crafting/table.dm

////////////////////////////////////////////////PIES////////////////////////////////////////////////

/datum/crafting_recipe/food/bananacreampie
	name = "Banana cream pie"
	reqs = list(
		"milk" = 5,
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/banana = 1,
	)
	result = /obj/item/food/pie/cream
	category = CAT_PIE

/datum/crafting_recipe/food/meatpie
	name = "Meat pie"
	reqs = list(
		"blackpepper" = 5,
		"sodiumchloride" = 5,
		/obj/item/food/pie/plain = 1,
		/obj/item/food/meat/steak/plain = 1,
	)
	result = /obj/item/food/pie/meatpie
	category = CAT_PIE

/datum/crafting_recipe/food/tofupie
	name = "Tofu pie"
	reqs = list(
		/obj/item/food/pie/plain = 1,
		/obj/item/food/tofu = 1,
	)
	result = /obj/item/food/pie/tofupie
	category = CAT_PIE

/datum/crafting_recipe/food/xenopie
	name = "Xeno pie"
	reqs = list(
		/obj/item/food/pie/plain = 1,
		/obj/item/food/meat/cutlet/xeno = 1,
	)
	result = /obj/item/food/pie/xemeatpie
	category = CAT_PIE

/datum/crafting_recipe/food/cherrypie
	name = "Cherry pie"
	reqs = list(
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/cherries = 1,
	)
	result = /obj/item/food/pie/cherrypie
	category = CAT_PIE

/datum/crafting_recipe/food/berryclafoutis
	name = "Berry clafoutis"
	reqs = list(
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/berries = 1,
	)
	result = /obj/item/food/pie/berryclafoutis
	category = CAT_PIE

/datum/crafting_recipe/food/bearypie
	name = "Beary Pie"
	reqs = list(
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/berries = 1,
		/obj/item/food/meat/steak/bear = 1,
	)
	result = /obj/item/food/pie/bearypie
	category = CAT_PIE

/datum/crafting_recipe/food/plumppie
	name = "Plump pie"
	reqs = list(
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/mushroom/plumphelmet = 1,
	)
	result = /obj/item/food/pie/plump_pie
	category = CAT_PIE

/datum/crafting_recipe/food/applepie
	name = "Apple pie"
	reqs = list(
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/apple = 1,
	)
	result = /obj/item/food/pie/applepie
	category = CAT_PIE

/datum/crafting_recipe/food/pumpkinpie
	name = "Pumpkin pie"
	reqs = list(
		"milk" = 5,
		"sugar" = 5,
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/pumpkin = 1,
	)
	result = /obj/item/food/pie/pumpkinpie
	category = CAT_PIE

/datum/crafting_recipe/food/goldenappletart
	name = "Golden apple tart"
	reqs = list(
		"milk" = 5,
		"sugar" = 5,
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/apple/gold = 1,
	)
	result = /obj/item/food/pie/appletart
	category = CAT_PIE

/datum/crafting_recipe/food/grapetart
	name = "Grape tart"
	reqs = list(
		"milk" = 5,
		"sugar" = 5,
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/grapes = 3,
	)
	result = /obj/item/food/pie/grapetart
	category = CAT_PIE

/datum/crafting_recipe/food/dulcedebatata
	name = "Dulce de batata"
	reqs = list(
		"vanilla" = 5,
		"water" = 5,
		/obj/item/food/grown/potato/sweet = 2,
	)
	result = /obj/item/food/pie/dulcedebatata
	category = CAT_PIE

/datum/crafting_recipe/food/frostypie
	name = "Frosty pie"
	reqs = list(
		/obj/item/food/pie/plain = 1,
		/obj/item/food/grown/bluecherries = 1,
	)
	result = /obj/item/food/pie/frostypie
	category = CAT_PIE

/datum/crafting_recipe/food/frenchsilkpie
	name = "French silk pie"
	reqs = list(
		"sugar" = 5,
		/obj/item/food/pie/plain = 1,
		/obj/item/food/chocolatebar = 2,
	)
	result = /obj/item/food/pie/frenchsilkpie
	category = CAT_PIE

/datum/crafting_recipe/food/shepherds_pie
	name = "Shepherds pie"
	reqs = list(
		/obj/item/food/mashed_potatoes = 1,
		/obj/item/food/meat/cutlet = 3,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/peas = 1,
		/obj/item/food/grown/corn = 1,
		/obj/item/food/grown/garlic = 1,
	)
	result = /obj/item/food/pie/shepherds_pie
	category = CAT_PIE

/datum/crafting_recipe/food/asdfpie
	name = "Pie-flavored pie"
	reqs = list(
		/obj/item/food/pie/plain = 2,
	)
	result = /obj/item/food/pie/asdfpie
	category = CAT_PIE
