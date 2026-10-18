/// Containers of ingredients the older condiments do not cover
/obj/item/reagent_container/food/condiment/bastion/cocoa
	name = "cocoa powder"
	desc = "A tin of cocoa powder."
	icon_state = "condi_chocolate"
	fill_reagent = "coco"

/obj/item/reagent_container/food/condiment/bastion/chili_powder
	name = "chili powder"
	desc = "Ground hot peppers, use sparingly."
	icon_state = "generic_condiment"
	fill_reagent = "capsaicin"
	fill_amount = 30

/obj/item/reagent_container/food/condiment/bastion/berry_juice
	name = "berry juice"
	desc = "A carton of berry juice."
	icon_state = "generic_condiment"
	fill_reagent = "berryjuice"

/obj/item/reagent_container/food/condiment/bastion/apple_juice
	name = "apple juice"
	desc = "A carton of apple juice."
	icon_state = "generic_condiment"
	fill_reagent = "applejuice"

/obj/item/reagent_container/food/condiment/bastion/lemon_juice
	name = "lemon juice"
	desc = "A bottle of lemon juice."
	icon_state = "generic_condiment"
	fill_reagent = "lemonjuice"

/obj/item/reagent_container/food/condiment/bastion/pineapple_juice
	name = "pineapple juice"
	desc = "A carton of pineapple juice."
	icon_state = "generic_condiment"
	fill_reagent = "pineapplejuice"

/obj/item/reagent_container/food/condiment/bastion/grape_juice
	name = "grape juice"
	desc = "A carton of grape juice."
	icon_state = "generic_condiment"
	fill_reagent = "grapejuice"

/obj/item/reagent_container/food/condiment/bastion/blue_cherry_jelly
	name = "blue cherry jelly"
	desc = "Blue and tasty, though not quite natural."
	icon_state = "cherryjelly"
	fill_reagent = "bluecherryjelly"

/// A fridge for kitchen stock that starts full
/obj/structure/machinery/smartfridge/kitchen
	name = "kitchen fridge"
	desc = "A refrigerated storage unit for kitchen ingredients."
	icon_state = "dinnerware"
	icon_on = "dinnerware"
	icon_off = "dinnerware-off"
	/// Typepath to how many of it the fridge starts with
	var/list/stock

/obj/structure/machinery/smartfridge/kitchen/Initialize()
	. = ..()
	for(var/path in stock)
		for(var/i in 1 to stock[path])
			add_local_item(new path(src))

/obj/structure/machinery/smartfridge/kitchen/accept_check(obj/item/O as obj)
	if(istype(O, /obj/item/reagent_container/food) || istype(O, /obj/item/storage/fancy/egg_box))
		return TRUE
	return FALSE

/obj/structure/machinery/smartfridge/kitchen/produce
	name = "produce fridge"
	desc = "A refrigerated storage unit full of fresh fruit, vegetables and herbs."
	stock = list(
		/obj/item/food/grown/tomato = 15,
		/obj/item/food/grown/cabbage = 15,
		/obj/item/food/grown/onion = 15,
		/obj/item/food/grown/potato = 15,
		/obj/item/food/grown/carrot = 10,
		/obj/item/food/grown/garlic = 10,
		/obj/item/food/grown/chili = 10,
		/obj/item/food/grown/cucumber = 10,
		/obj/item/food/grown/eggplant = 10,
		/obj/item/food/grown/corn = 10,
		/obj/item/food/grown/peas = 10,
		/obj/item/food/grown/herbs = 10,
		/obj/item/food/grown/soybeans = 10,
		/obj/item/food/grown/peanut = 10,
		/obj/item/food/grown/berries = 10,
		/obj/item/food/grown/banana = 10,
		/obj/item/food/grown/apple = 10,
		/obj/item/food/grown/grapes = 10,
		/obj/item/food/grown/citrus/orange = 10,
		/obj/item/food/grown/citrus/lemon = 10,
		/obj/item/food/grown/citrus/lime = 10,
		/obj/item/food/grown/mushroom = 10,
		/obj/item/food/grown/mushroom/chanterelle = 5,
		/obj/item/food/grown/mushroom/plumphelmet = 5,
		/obj/item/food/grown/cherries = 5,
		/obj/item/food/grown/bluecherries = 5,
		/obj/item/food/grown/potato/sweet = 5,
		/obj/item/food/grown/pumpkin = 5,
		/obj/item/food/grown/plum = 5,
		/obj/item/food/grown/bell_pepper = 5,
		/obj/item/food/grown/olive = 5,
		/obj/item/food/grown/pineapple = 5,
		/obj/item/food/grown/wheat = 5,
		/obj/item/food/grown/oat = 5,
		/obj/item/food/grown/ghost_chili = 3,
		/obj/item/food/grown/apple/gold = 2,
		/obj/item/food/grown/icepepper = 3,
		/obj/item/food/grown/whitebeet = 3,
		/obj/item/food/grown/redbeet = 3,
		/obj/item/food/grown/parsnip = 3,
		/obj/item/food/onion_slice/red = 5,
	)

/obj/structure/machinery/smartfridge/kitchen/butcher
	name = "meat and dairy fridge"
	desc = "A refrigerated storage unit full of fresh meat, fish, eggs and dairy."
	stock = list(
		/obj/item/food/meat/slab = 15,
		/obj/item/food/meat/slab/chicken = 5,
		/obj/item/food/fishmeat = 10,
		/obj/item/food/fishmeat/carp = 5,
		/obj/item/food/meat/bacon = 8,
		/obj/item/food/sausage = 5,
		/obj/item/food/raw_meatball = 5,
		/obj/item/food/patty/plain = 5,
		/obj/item/food/egg = 24,
		/obj/item/food/cheese/wheel = 3,
		/obj/item/food/cheese/wedge = 6,
		/obj/item/food/butter = 5,
		/obj/item/food/tofu = 10,
	)
