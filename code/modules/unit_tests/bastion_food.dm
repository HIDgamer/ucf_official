/// Every Bastion food item has its sprite and starts with its reagents
/datum/unit_test/bastion_food_items/Run()
	var/list/problems = list()
	var/count = 0
	for(var/path in subtypesof(/obj/item/food))
		var/obj/item/food/food = allocate(path)
		count++
		if(!food.icon_state)
			continue
		if(!icon_exists(food.icon, food.icon_state))
			problems += "[path] icon [food.icon_state] missing in [food.icon]"
		var/slot_icon = food.item_icons[WEAR_L_HAND]
		if(food.item_state && !icon_exists(slot_icon, food.item_state))
			problems += "[path] inhand [food.item_state] missing"
		if(length(food.food_reagents) && !food.reagents.total_volume)
			problems += "[path] spawned empty"
	TEST_ASSERT(count > 500, "Only [count] food types")
	TEST_ASSERT(!length(problems), "[length(problems)] food problems:\n[problems.Join("\n")]")

/// Eating uses up food and cutting food has recipes
/datum/unit_test/bastion_food_eating/Run()
	var/mob/living/carbon/human/eater = allocate(/mob/living/carbon/human)
	eater.create_hud()
	var/obj/item/food/burger/plain/burger = allocate(/obj/item/food/burger/plain)
	var/before = burger.reagents.total_volume
	TEST_ASSERT(before > 0, "The burger is empty")
	eater.put_in_active_hand(burger)
	burger.attack(eater, eater)
	TEST_ASSERT(burger.reagents.total_volume < before, "Eating did not use up the burger")
	var/obj/item/food/cake/plain/cake = allocate(/obj/item/food/cake/plain)
	TEST_ASSERT(length(cake.processing_recipes), "The cake has no cutting recipe")
	var/obj/item/food/dough/dough = allocate(/obj/item/food/dough)
	TEST_ASSERT(length(dough.processing_recipes), "The dough has no rolling recipe")

/// Every food recipe makes something with a sprite and asks only for real things
/datum/unit_test/bastion_crafting_recipes/Run()
	var/list/problems = list()
	var/list/recipes = get_crafting_recipes()
	TEST_ASSERT(length(recipes) > 100, "Only [length(recipes)] recipes")
	for(var/datum/crafting_recipe/recipe as anything in recipes)
		var/atom/result = recipe.result
		if(!ispath(result, /atom))
			problems += "[recipe.type] result [recipe.result] is not an atom"
			continue
		if(initial(result.icon_state) && !icon_exists(initial(result.icon), initial(result.icon_state)))
			problems += "[recipe.type] result sprite missing"
		for(var/requirement in recipe.reqs)
			if(istext(requirement) && !GLOB.chemical_reagents_list[requirement])
				problems += "[recipe.type] needs unknown reagent [requirement]"
	TEST_ASSERT(!length(problems), "[length(problems)] recipe problems:\n[problems.Join("\n")]")

/// A burger is made from a patty and a bun lying nearby
/datum/unit_test/bastion_crafting_burger/Run()
	var/mob/living/carbon/human/chef = allocate(/mob/living/carbon/human)
	var/turf/here = get_turf(chef)
	var/obj/item/food/patty/plain/patty = allocate(/obj/item/food/patty/plain, here)
	var/obj/item/food/bun/bun = allocate(/obj/item/food/bun, here)
	var/datum/personal_crafting/crafting = new
	var/datum/crafting_recipe/burger_recipe
	for(var/datum/crafting_recipe/recipe as anything in get_crafting_recipes())
		if(recipe.result == /obj/item/food/burger/plain)
			burger_recipe = recipe
	TEST_ASSERT_NOTNULL(burger_recipe, "There is no plain burger recipe")
	TEST_ASSERT(crafting.check_contents(burger_recipe, crafting.get_surroundings(chef)), "The ingredients were not found")
	var/result = crafting.construct_item(chef, burger_recipe)
	TEST_ASSERT(istype(result, /obj/item/food/burger/plain), "No burger was made: [result]")
	TEST_ASSERT(QDELETED(patty) && QDELETED(bun), "The ingredients were not used up")
	qdel(result)

/// Condiment bags count as reagent sources and older kitchen items stand in for Bastion ingredients
/datum/unit_test/bastion_crafting_ingredients/Run()
	var/mob/living/carbon/human/chef = allocate(/mob/living/carbon/human)
	var/turf/here = get_turf(chef)
	allocate(/obj/item/reagent_container/food/condiment/bastion/flour, here)
	allocate(/obj/item/reagent_container/food/snacks/grown/tomato, here)
	var/datum/personal_crafting/crafting = new
	var/list/surroundings = crafting.get_surroundings(chef)
	var/list/reagent_totals = surroundings["reagents"]
	TEST_ASSERT(reagent_totals["flour"] >= 50, "The flour bag was not counted")
	TEST_ASSERT(crafting_type_matches(/obj/item/reagent_container/food/snacks/grown/tomato, /obj/item/food/grown/tomato), "The old tomato does not stand in for the new one")
	var/list/counts = surroundings["counts"]
	TEST_ASSERT(counts[/obj/item/reagent_container/food/snacks/grown/tomato] == 1, "The old tomato was not counted")

/// Every kitchen supply crate holds real items
/datum/unit_test/bastion_food_supply_packs/Run()
	var/list/problems = list()
	for(var/path in list(/datum/supply_packs/kitchen_pantry, /datum/supply_packs/kitchen_tableware, /datum/supply_packs/fresh_produce, /datum/supply_packs/butcher_crate, /datum/supply_packs/kitchen_appliances, /datum/supply_packs/restaurant_equipment, /datum/supply_packs/vegetable_crate, /datum/supply_packs/fruit_crate, /datum/supply_packs/mushroom_crate, /datum/supply_packs/meat_and_fish_crate, /datum/supply_packs/dairy_and_egg_crate, /datum/supply_packs/bakery_crate, /datum/supply_packs/sauces_and_spices_crate, /datum/supply_packs/juice_and_mixer_crate, /datum/supply_packs/kitchen_fridges_crate, /datum/supply_packs/kitchen_machines, /datum/supply_packs/bar_dispensers))
		var/datum/supply_packs/pack = new path
		if(!length(pack.contains))
			problems += "[path] is empty"
		for(var/item in pack.contains)
			if(!ispath(item, /obj))
				problems += "[path] holds [item]"
		qdel(pack)
	TEST_ASSERT(!length(problems), "Supply pack problems:\n[problems.Join("\n")]")

/// The griddle, oven and fryer cook what is put in them
/datum/unit_test/bastion_cooking_machines/Run()
	var/mob/living/carbon/human/chef = allocate(/mob/living/carbon/human)
	var/turf/here = run_loc_floor_bottom_left

	var/obj/structure/machinery/cooker/surface/griddle = allocate(/obj/structure/machinery/cooker/surface, here)
	var/obj/item/food/meat/rawcutlet/plain/cutlet = allocate(/obj/item/food/meat/rawcutlet/plain)
	TEST_ASSERT(griddle.add_item(cutlet, null), "The griddle did not take the cutlet")
	griddle.set_on(TRUE)
	griddle.last_cook_time -= 5 MINUTES
	griddle.process()
	TEST_ASSERT(QDELETED(cutlet), "The raw cutlet was not cooked")
	TEST_ASSERT(length(griddle.cooking) == 1 && istype(griddle.cooking[1], /obj/item/food/meat/cutlet/plain), "The griddle holds [english_list(griddle.cooking)] instead of a cutlet")

	var/obj/structure/machinery/cooker/oven/oven = allocate(/obj/structure/machinery/cooker/oven, here)
	var/obj/item/food/dough/dough = allocate(/obj/item/food/dough)
	oven.open = TRUE
	TEST_ASSERT(oven.add_item(dough, null), "The oven did not take the dough")
	TEST_ASSERT(oven.handle_menu_choice("door", chef), "The oven door did not close")
	TEST_ASSERT(oven.on, "The oven did not heat up with the door shut")
	oven.last_cook_time -= 5 MINUTES
	oven.process()
	TEST_ASSERT(QDELETED(dough), "The dough was not baked")
	TEST_ASSERT(length(oven.cooking) == 1 && istype(oven.cooking[1], /obj/item/food/bread/plain), "The oven holds [english_list(oven.cooking)] instead of bread")

	var/obj/structure/machinery/cooker/fryer/fryer = allocate(/obj/structure/machinery/cooker/fryer, here)
	var/obj/item/food/fries/fries = allocate(/obj/item/food/fries)
	TEST_ASSERT(!fryer.add_item(fries, null), "The fryer took food without oil")
	var/obj/item/reagent_container/food/condiment/bastion/cooking_oil/oil_bottle = allocate(/obj/item/reagent_container/food/condiment/bastion/cooking_oil)
	TEST_ASSERT(!fryer.attackby(oil_bottle, chef), "The fryer treated the oil bottle as food")
	oil_bottle.afterattack(fryer, chef)
	TEST_ASSERT(fryer.reagents.get_reagent_amount("cornoil") > 0, "Pouring the oil bottle did not fill the fryer")
	fryer.reagents.add_reagent("cornoil", 50)
	TEST_ASSERT(fryer.add_item(fries, null), "The fryer did not take the food with oil")
	fryer.set_on(TRUE)
	fryer.last_cook_time -= 20 SECONDS
	fryer.process()
	TEST_ASSERT(fries.foodtypes & FRIED, "The food was not fried")
	fryer.last_cook_time -= 30 SECONDS
	fryer.process()
	TEST_ASSERT(!QDELETED(fries), "Food burned in the fryer too early")
	fryer.last_cook_time -= FOOD_FRYER_BURN_TIME
	fryer.process()
	TEST_ASSERT(QDELETED(fries) && istype(fryer.cooking[1], /obj/item/food/badrecipe), "Food left in the fryer did not burn")

/// Flour and water react into dough
/datum/unit_test/bastion_food_reactions/Run()
	var/turf/here = run_loc_floor_bottom_left
	var/obj/item/reagent_container/glass/beaker/beaker = allocate(/obj/item/reagent_container/glass/beaker, here)
	beaker.reagents.add_reagent("flour", 15)
	beaker.reagents.add_reagent("water", 10)
	beaker.reagents.handle_reactions()
	TEST_ASSERT_NOTNULL(locate(/obj/item/food/dough) in here, "The flour and water did not make dough")

/// Cooking works through the real click path and the machinery subsystem
/datum/unit_test/bastion_cooking_loop/Run()
	var/mob/living/carbon/human/chef = allocate(/mob/living/carbon/human)
	chef.create_hud()
	var/turf/here = run_loc_floor_bottom_left
	var/obj/structure/machinery/cooker/surface/griddle = allocate(/obj/structure/machinery/cooker/surface, here)
	var/obj/item/food/meat/rawcutlet/plain/cutlet = allocate(/obj/item/food/meat/rawcutlet/plain)
	chef.put_in_active_hand(cutlet)
	TEST_ASSERT(cutlet.loc == chef, "The cutlet is not in the hand")
	TEST_ASSERT(griddle.attackby(cutlet, chef), "The griddle ignored the cutlet")
	TEST_ASSERT((cutlet in griddle.cooking) && cutlet.loc == griddle, "The cutlet was not loaded: loc [cutlet.loc]")
	TEST_ASSERT(griddle.handle_menu_choice("toggle", chef), "The toggle did not work")
	TEST_ASSERT(griddle.on, "The griddle did not turn on")
	TEST_ASSERT(griddle in GLOB.processing_machines, "The griddle is not in the processing list")
	TEST_ASSERT_NOTNULL(griddle.cook_loop, "The griddle has no cooking sound")
	TEST_ASSERT(griddle.particle_type == /particles/smoke/steam/mild, "The griddle shows no steam while cooking")
	var/obj/item/reagent_container/food/snacks/legacy = allocate(/obj/item/reagent_container/food/snacks/tofu)
	chef.put_in_active_hand(legacy)
	TEST_ASSERT(griddle.attackby(legacy, chef) && !(legacy in griddle.cooking), "The griddle took food that cannot cook")
	var/datum/component/grillable/grill_comp = cutlet.GetComponent(/datum/component/grillable)
	TEST_ASSERT_NOTNULL(grill_comp, "The cutlet has no grillable component")
	griddle.last_cook_time -= 10 MINUTES
	SSmachinery.currentrunmachines = list()
	SSmachinery.fire(FALSE)
	TEST_ASSERT(QDELETED(cutlet), "The real machinery loop did not cook the cutlet (progress [grill_comp?.current_cook_time] of [grill_comp?.required_cook_time])")

/// Soup cooks in a pot on a stove and is served into a bowl
/datum/unit_test/bastion_soup/Run()
	var/mob/living/carbon/human/chef = allocate(/mob/living/carbon/human)
	chef.create_hud()
	var/turf/here = run_loc_floor_bottom_left
	var/obj/structure/machinery/cooker/stove/stove = allocate(/obj/structure/machinery/cooker/stove, here)
	var/obj/item/reagent_container/glass/soup_pot/pot = allocate(/obj/item/reagent_container/glass/soup_pot)
	pot.reagents.add_reagent("water", 50)
	for(var/ingredient_type in list(/obj/item/food/meatball, /obj/item/food/grown/carrot, /obj/item/food/grown/potato))
		var/obj/item/ingredient = allocate(ingredient_type)
		chef.put_in_active_hand(ingredient)
		TEST_ASSERT(pot.attackby(ingredient, chef), "The pot refused [ingredient]")
	TEST_ASSERT_EQUAL(length(pot.added_ingredients), 3, "The pot did not keep its ingredients")
	var/datum/soup_recipe/recipe = pot.find_recipe()
	TEST_ASSERT_NOTNULL(recipe, "The pot found no soup")
	TEST_ASSERT_EQUAL(recipe.name, "Meatball Soup", "The pot found [recipe.name]")
	chef.put_in_active_hand(pot)
	TEST_ASSERT(stove.attackby(pot, chef) && (pot in stove.cooking), "The stove did not take the pot")
	TEST_ASSERT(stove.handle_menu_choice("toggle", chef) && stove.on, "The stove did not turn on")
	stove.last_cook_time -= 5 MINUTES
	stove.process()
	TEST_ASSERT(pot.reagents.get_reagent_amount("soup_meatball_soup") >= 30, "No soup was made")
	TEST_ASSERT_EQUAL(length(pot.added_ingredients), 0, "The ingredients were not used up")
	var/obj/item/reagent_container/food/drinks/bowl/bowl = allocate(/obj/item/reagent_container/food/drinks/bowl, here)
	pot.amount_per_transfer_from_this = 25
	pot.afterattack(bowl, chef, TRUE)
	TEST_ASSERT(bowl.reagents.get_reagent_amount("soup_meatball_soup") > 0, "The soup did not reach the bowl")
	TEST_ASSERT_EQUAL(bowl.icon_state, "meatballsoup", "The bowl does not look like soup")
	TEST_ASSERT(icon_exists(bowl.icon, bowl.icon_state), "The soup bowl sprite is missing")

/// Every soup has its bowl sprite
/datum/unit_test/bastion_soup_sprites/Run()
	var/list/problems = list()
	for(var/path in subtypesof(/datum/reagent/nutriment/soup))
		var/datum/reagent/nutriment/soup/soup = new path
		if(!icon_exists('icons/obj/food/soupsalad.dmi', soup.bowl_state))
			problems += "[path] bowl [soup.bowl_state]"
		qdel(soup)
	TEST_ASSERT(!length(problems), "Soups with missing bowls:\n[problems.Join("\n")]")

/// The ice cream vat scoops ice cream onto a cone
/datum/unit_test/bastion_icecream/Run()
	var/mob/living/carbon/human/chef = allocate(/mob/living/carbon/human)
	var/turf/here = run_loc_floor_bottom_left
	var/obj/structure/machinery/icecream_vat/vat = allocate(/obj/structure/machinery/icecream_vat, here)
	var/obj/item/food/icecream/cone = allocate(/obj/item/food/icecream)
	TEST_ASSERT(vat.attackby(cone, chef), "The vat ignored the cone")
	TEST_ASSERT_EQUAL(length(cone.scoops), 1, "The cone got no scoop")
	TEST_ASSERT(findtext(cone.name, "vanilla"), "The cone is called [cone.name]")
	TEST_ASSERT_EQUAL(vat.product_stock["vanilla"], 4, "The vat stock did not go down")
	vat.selected_flavour = "chocolate"
	vat.attackby(cone, chef)
	vat.attackby(cone, chef)
	TEST_ASSERT_EQUAL(length(cone.scoops), 3, "The cone did not take three scoops")
	TEST_ASSERT(vat.attackby(cone, chef) && length(cone.scoops) == 3, "The cone took a fourth scoop")
	var/list/held = list()
	for(var/datum/reagent/reagent as anything in vat.reagents.reagent_list)
		held += "[reagent.id]=[reagent.volume]"
	TEST_ASSERT(vat.make(chef, "vanilla", list("milk", "ice", "vanilla")), "The vat could not make vanilla, it holds [english_list(held)]")

/// The food cart unpacks into a stand and packs up again
/datum/unit_test/bastion_food_cart/Run()
	var/turf/origin = run_loc_floor_bottom_left
	var/turf/cart_turf = locate(origin.x + 1, origin.y + 2, origin.z)
	var/obj/structure/machinery/food_cart/cart = allocate(/obj/structure/machinery/food_cart, cart_turf)
	TEST_ASSERT_EQUAL(length(cart.packed_things), 4, "The cart has no stand parts")
	cart.unpack(null)
	TEST_ASSERT(cart.unpacked, "The cart did not unpack")
	TEST_ASSERT(cart.cart_griddle.loc != cart && isturf(cart.cart_griddle.loc), "The griddle is not out")
	TEST_ASSERT(isturf(cart.cart_table.loc), "The table is not out")
	cart.pack_up()
	TEST_ASSERT(!cart.unpacked && cart.cart_griddle.loc == cart, "The cart did not pack up")

/// The coffeemaker brews coffee into its pot
/datum/unit_test/bastion_coffeemaker/Run()
	var/mob/living/carbon/human/barista = allocate(/mob/living/carbon/human)
	var/turf/here = run_loc_floor_bottom_left
	var/obj/structure/machinery/coffeemaker/maker = allocate(/obj/structure/machinery/coffeemaker, here)
	TEST_ASSERT_NOTNULL(maker.coffeepot, "The coffeemaker has no pot")
	TEST_ASSERT_NOTNULL(maker.cartridge, "The coffeemaker has no cartridge")
	maker.brew(barista)
	TEST_ASSERT(maker.brewing, "The coffeemaker did not start brewing")
	maker.finish_brewing()
	TEST_ASSERT(maker.coffeepot.reagents.get_reagent_amount("coffee") >= 120, "No coffee in the pot")
	TEST_ASSERT_EQUAL(maker.cartridge.charges, 3, "The cartridge was not used")
	var/obj/item/reagent_container/food/drinks/coffeecup/cup = allocate(/obj/item/reagent_container/food/drinks/coffeecup)
	barista.put_in_active_hand(cup)
	TEST_ASSERT(maker.attackby(cup, barista), "The cup was not handled")

/// The fresh food fridges start full and hold every fresh ingredient the menu needs
/datum/unit_test/bastion_kitchen_fridges/Run()
	var/turf/here = run_loc_floor_bottom_left
	var/obj/structure/machinery/smartfridge/kitchen/produce/produce_fridge = allocate(/obj/structure/machinery/smartfridge/kitchen/produce, here)
	var/obj/structure/machinery/smartfridge/kitchen/butcher/butcher_fridge = allocate(/obj/structure/machinery/smartfridge/kitchen/butcher, here)
	var/list/problems = list()
	for(var/obj/structure/machinery/smartfridge/kitchen/fridge as anything in list(produce_fridge, butcher_fridge))
		var/total = 0
		for(var/stock_path in fridge.stock)
			total += fridge.stock[stock_path]
		if(length(fridge.contents) != total)
			problems += "[fridge.name] holds [length(fridge.contents)] of [total]"
	var/list/stocked_types = list()
	for(var/obj/item/stocked as anything in produce_fridge.contents + butcher_fridge.contents)
		stocked_types |= stocked.type
	for(var/datum/crafting_recipe/recipe as anything in get_crafting_recipes())
		for(var/requirement in recipe.reqs)
			if(!ispath(requirement, /obj/item/food/grown))
				continue
			var/found = FALSE
			for(var/stocked_type in stocked_types)
				if(crafting_type_matches(stocked_type, requirement))
					found = TRUE
					break
			if(!found)
				problems += "[recipe.name] needs [requirement] which no fridge holds"
	for(var/datum/soup_recipe/soup as anything in get_soup_recipes())
		for(var/requirement in soup.required_ingredients)
			if(!ispath(requirement, /obj/item/food/grown))
				continue
			var/found = FALSE
			for(var/stocked_type in stocked_types)
				if(crafting_type_matches(stocked_type, requirement))
					found = TRUE
					break
			if(!found)
				problems += "[soup.name] needs [requirement] which no fridge holds"
	for(var/obj/structure/machinery/smartfridge/kitchen/fridge as anything in list(produce_fridge, butcher_fridge))
		for(var/state in list(fridge.icon_state, fridge.icon_on, fridge.icon_off))
			if(!icon_exists(fridge.icon, state))
				problems += "[fridge.name] has no sprite [state]"
		if(fridge.icon_state != "dinnerware")
			problems += "[fridge.name] does not use the dinnerware sprite"
	var/obj/item/food/test_item = allocate(/obj/item/food/burger/plain)
	TEST_ASSERT(produce_fridge.accept_check(test_item), "The fridge refuses food")
	TEST_ASSERT(!produce_fridge.accept_check(allocate(/obj/item/tool/kitchen/knife)), "The fridge accepts a knife")
	TEST_ASSERT(!length(problems), "[length(problems)] fridge problems:\n[problems.Join("\n")]")

/// The kitchen and bar vending machines stock real items and have their sprites
/datum/unit_test/bastion_kitchen_vendors/Run()
	var/list/problems = list()
	var/count = 0
	for(var/path in subtypesof(/obj/structure/machinery/vending/bastion))
		var/obj/structure/machinery/vending/bastion/vendor_path = path
		if(!findtext("[path]", "/vending/bastion/") || !initial(vendor_path.icon_state))
			continue
		var/list/all_products = initial(vendor_path.products) + initial(vendor_path.contraband) + initial(vendor_path.premium)
		if(!length(all_products))
			continue
		var/obj/structure/machinery/vending/bastion/vendor = allocate(path)
		count++
		if(!icon_exists(vendor.icon, vendor.icon_state))
			problems += "[path] icon [vendor.icon_state]"
		for(var/product in all_products)
			if(!ispath(product, /obj/item))
				problems += "[path] stocks [product]"
	TEST_ASSERT(count >= 20, "Only [count] vendors")
	TEST_ASSERT(!length(problems), "Vendor problems:\n[problems.Join("\n")]")

/// Every Bastion drink item has its sprite and starts with its drink
/datum/unit_test/bastion_drink_items/Run()
	var/list/problems = list()
	var/count = 0
	for(var/path in subtypesof(/obj/item/reagent_container/food/drinks/bastion))
		var/obj/item/reagent_container/food/drinks/bastion/drink = allocate(path)
		count++
		if(!icon_exists(drink.icon, drink.icon_state))
			problems += "[path] sprite [drink.icon_state] missing in [drink.icon]"
		if(length(drink.fill_reagents) && !drink.reagents.total_volume)
			problems += "[path] spawned empty"
	TEST_ASSERT(count >= 60, "Only [count] drinks")
	TEST_ASSERT(!length(problems), "[length(problems)] drink problems:\n[problems.Join("\n")]")

/// The processor, grinder, microwave and bar dispensers work
/datum/unit_test/bastion_kitchen_appliances/Run()
	var/mob/living/carbon/human/chef = allocate(/mob/living/carbon/human)
	chef.create_hud()
	var/turf/here = run_loc_floor_bottom_left

	var/obj/structure/machinery/bastion_processor/processor = allocate(/obj/structure/machinery/bastion_processor, here)
	var/obj/item/food/meat/slab/slab = allocate(/obj/item/food/meat/slab)
	chef.put_in_active_hand(slab)
	TEST_ASSERT(processor.attackby(slab, chef) && (slab in processor.processor_contents), "The processor refused the meat")
	processor.finish_processing()
	TEST_ASSERT(QDELETED(slab), "The meat was not processed")
	var/meatballs = 0
	for(var/obj/item/food/raw_meatball/ball in here)
		meatballs++
		qdel(ball)
	TEST_ASSERT_EQUAL(meatballs, 3, "The processor made [meatballs] meatballs instead of 3")

	var/obj/structure/machinery/bastion_grinder/grinder = allocate(/obj/structure/machinery/bastion_grinder, here)
	var/obj/item/food/grown/tomato/tomato = allocate(/obj/item/food/grown/tomato)
	chef.put_in_active_hand(tomato)
	TEST_ASSERT(grinder.attackby(tomato, chef) && (tomato in grinder.holding_items), "The grinder refused the tomato")
	grinder.juice()
	TEST_ASSERT(grinder.beaker.reagents.get_reagent_amount("tomatojuice") > 0, "No tomato juice was made")

	var/obj/structure/machinery/bastion_microwave/microwave = allocate(/obj/structure/machinery/bastion_microwave, here)
	microwave.open = TRUE
	var/obj/item/food/donkpocket/pocket = allocate(/obj/item/food/donkpocket)
	chef.put_in_active_hand(pocket)
	TEST_ASSERT(microwave.attackby(pocket, chef) && (pocket in microwave.microwave_contents), "The microwave refused the donk pocket")
	microwave.open = FALSE
	microwave.finish_cooking()
	TEST_ASSERT(QDELETED(pocket) && length(microwave.microwave_contents) == 1, "The microwave did not cook the donk pocket")
	TEST_ASSERT(!istype(microwave.microwave_contents[1], /obj/item/food/badrecipe), "The donk pocket burned")

	var/list/problems = list()
	for(var/dispenser_path in list(/obj/structure/machinery/chem_dispenser/soda/bastion, /obj/structure/machinery/chem_dispenser/soda/bastion/beer))
		var/obj/structure/machinery/chem_dispenser/dispenser = allocate(dispenser_path, here)
		if(!icon_exists(dispenser.icon, dispenser.icon_state))
			problems += "[dispenser_path] sprite [dispenser.icon_state]"
		for(var/reagent_id in dispenser.dispensable_reagents + dispenser.hacked_reagents)
			if(!GLOB.chemical_reagents_list[reagent_id])
				problems += "[dispenser_path] dispenses unknown [reagent_id]"
	TEST_ASSERT(!length(problems), "Dispenser problems:\n[problems.Join("\n")]")

/// The chef book lists the modern recipes
/datum/unit_test/bastion_cookbook/Run()
	var/obj/item/book/manual/chef_recipes/book = allocate(/obj/item/book/manual/chef_recipes)
	var/mob/living/carbon/human/reader = allocate(/mob/living/carbon/human)
	reader.create_hud()
	book.attack_self(reader)
	TEST_ASSERT(length(book.dat) > 10000, "The cookbook is only [length(book.dat)] characters")
	TEST_ASSERT(!findtext(book.dat, "Food for Dummies"), "The cookbook still has the old text")
	var/list/missing = list()
	for(var/datum/crafting_recipe/recipe as anything in get_crafting_recipes())
		if(!recipe.non_craftable && !findtext(book.dat, "<b>[html_encode(recipe.name)]</b>"))
			missing += recipe.name
	for(var/datum/soup_recipe/soup as anything in get_soup_recipes())
		if(!findtext(book.dat, "<b>[html_encode(soup.name)]</b>"))
			missing += soup.name
	TEST_ASSERT(!length(missing), "The cookbook is missing [length(missing)] recipes:\n[missing.Join("\n")]")
	for(var/section in list("Basics", "Soups", "Food Processor", "Kitchen Machines", "Meatball Soup"))
		TEST_ASSERT(findtext(book.dat, section), "The cookbook has no [section]")
	TEST_ASSERT(findtext(book.dat, ">Soups</h2>"), "Soups is not a cookbook category")
	var/datum/asset/spritesheet/cooking/sheet = get_asset_datum(/datum/asset/spritesheet/cooking)
	var/list/unpictured = list()
	var/index = 0
	for(var/datum/crafting_recipe/recipe as anything in get_crafting_recipes())
		index++
		if(!sheet.sprites["r[index]"])
			unpictured += recipe.name
	index = 0
	for(var/datum/soup_recipe/soup as anything in get_soup_recipes())
		index++
		if(!sheet.sprites["s[index]"])
			unpictured += soup.name
	for(var/list/basic in GLOB.cookbook_basics)
		if(basic[1] && !sheet.sprites[cooking_sprite_name(basic[1])])
			unpictured += basic[2]
	TEST_ASSERT(!length(unpictured), "[length(unpictured)] cookbook entries have no picture:\n[unpictured.Join("\n")]")
	TEST_ASSERT(findtext(book.dat, "<span class=\"cooking32x32"), "The cookbook has no pictures")
	var/datum/personal_crafting/menu = new
	var/list/menu_data = menu.ui_static_data(reader)
	TEST_ASSERT(CAT_SOUP in menu_data["categories"], "The Crafting Menu has no Soups category")
	var/soups = 0
	for(var/list/entry in menu_data["recipes"])
		if(findtext(entry["ref"], "soup") == 1)
			soups++
	TEST_ASSERT_EQUAL(soups, length(get_soup_recipes()), "The Crafting Menu lists [soups] soups")

/// Raw spaghetti and soaked rice boil into food in a soup pot
/datum/unit_test/bastion_soup_boiling/Run()
	var/mob/living/carbon/human/chef = allocate(/mob/living/carbon/human)
	chef.create_hud()
	var/turf/here = run_loc_floor_bottom_left
	var/obj/item/reagent_container/glass/soup_pot/pot = allocate(/obj/item/reagent_container/glass/soup_pot, here)
	pot.reagents.add_reagent("water", 100)
	var/list/ingredients = list(/obj/item/food/spaghetti/raw, /obj/item/food/spaghetti/raw, /obj/item/food/uncooked_rice)
	for(var/ingredient_type in ingredients)
		var/obj/item/ingredient = allocate(ingredient_type)
		chef.put_in_active_hand(ingredient)
		TEST_ASSERT(pot.attackby(ingredient, chef), "The pot refused [ingredient]")
	for(var/i in 1 to 3)
		TEST_ASSERT(pot.cook(1 MINUTES), "The pot did not finish boiling round [i]")
	var/spaghetti = 0
	var/rice = 0
	for(var/obj/item/food/boiled in here)
		if(istype(boiled, /obj/item/food/spaghetti/boiledspaghetti))
			spaghetti++
		else if(istype(boiled, /obj/item/food/boiledrice))
			rice++
		qdel(boiled)
	TEST_ASSERT_EQUAL(spaghetti, 2, "The pot boiled [spaghetti] spaghetti instead of 2")
	TEST_ASSERT_EQUAL(rice, 1, "The pot boiled [rice] rice instead of 1")
	TEST_ASSERT_EQUAL(pot.reagents.get_reagent_amount("water"), 25, "The boiling used the wrong amount of water")
	TEST_ASSERT_EQUAL(length(pot.added_ingredients), 0, "The raw food was not used up")
