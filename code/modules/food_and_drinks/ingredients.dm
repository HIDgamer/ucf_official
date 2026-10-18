/// Older kitchen items that count as a Bastion ingredient when crafting
GLOBAL_LIST_INIT(crafting_aliases, list(
	/obj/item/trash/snack_bowl = list(/obj/item/reagent_container/food/drinks/bowl),
	/obj/item/food/egg = list(/obj/item/reagent_container/food/snacks/egg),
	/obj/item/food/boiledegg = list(/obj/item/reagent_container/food/snacks/boiledegg),
	/obj/item/food/bun = list(/obj/item/reagent_container/food/snacks/bun),
	/obj/item/food/breadslice/plain = list(/obj/item/reagent_container/food/snacks/breadslice),
	/obj/item/food/cheese/wedge = list(/obj/item/reagent_container/food/snacks/cheesewedge),
	/obj/item/food/cheese/wheel = list(/obj/item/reagent_container/food/snacks/sliceable/cheesewheel),
	/obj/item/food/tofu = list(/obj/item/reagent_container/food/snacks/tofu),
	/obj/item/food/chocolatebar = list(/obj/item/reagent_container/food/snacks/chocolatebar),
	/obj/item/food/dough = list(/obj/item/reagent_container/food/snacks/dough),
	/obj/item/food/flatdough = list(/obj/item/reagent_container/food/snacks/sliceable/flatdough),
	/obj/item/food/meat/slab = list(/obj/item/reagent_container/food/snacks/meat),
	/obj/item/food/meat/cutlet/plain = list(/obj/item/reagent_container/food/snacks/cutlet),
	/obj/item/food/fishmeat = list(/obj/item/reagent_container/food/snacks/carpmeat),
	/obj/item/food/sausage = list(/obj/item/reagent_container/food/snacks/sausage),
	/obj/item/food/meatball = list(/obj/item/reagent_container/food/snacks/meatball),
	/obj/item/food/fries = list(/obj/item/reagent_container/food/snacks/fries),
	/obj/item/food/grown/apple = list(/obj/item/reagent_container/food/snacks/grown/apple),
	/obj/item/food/grown/banana = list(/obj/item/reagent_container/food/snacks/grown/banana),
	/obj/item/food/grown/tomato = list(/obj/item/reagent_container/food/snacks/grown/tomato),
	/obj/item/food/grown/cabbage = list(/obj/item/reagent_container/food/snacks/grown/cabbage),
	/obj/item/food/grown/chili = list(/obj/item/reagent_container/food/snacks/grown/chili),
	/obj/item/food/grown/carrot = list(/obj/item/reagent_container/food/snacks/grown/carrot),
	/obj/item/food/grown/potato = list(/obj/item/reagent_container/food/snacks/grown/potato),
	/obj/item/food/grown/corn = list(/obj/item/reagent_container/food/snacks/grown/corn),
	/obj/item/food/grown/peanut = list(/obj/item/reagent_container/food/snacks/grown/peanut),
	/obj/item/food/grown/cherries = list(/obj/item/reagent_container/food/snacks/grown/cherries),
	/obj/item/food/grown/eggplant = list(/obj/item/reagent_container/food/snacks/grown/eggplant),
	/obj/item/food/grown/citrus/orange = list(/obj/item/reagent_container/food/snacks/grown/orange),
	/obj/item/food/grown/citrus/lime = list(/obj/item/reagent_container/food/snacks/grown/lime),
	/obj/item/food/grown/citrus/lemon = list(/obj/item/reagent_container/food/snacks/grown/lemon),
	/obj/item/food/grown/soybeans = list(/obj/item/reagent_container/food/snacks/grown/soybeans),
	/obj/item/food/grown/whitebeet = list(/obj/item/reagent_container/food/snacks/grown/whitebeet),
	/obj/item/food/grown/wheat = list(/obj/item/reagent_container/food/snacks/grown/wheat),
	/obj/item/food/grown/berries = list(/obj/item/reagent_container/food/snacks/grown/berries),
	/obj/item/food/grown/grapes = list(/obj/item/reagent_container/food/snacks/grown/grapes),
	/obj/item/food/grown/watermelon = list(/obj/item/reagent_container/food/snacks/grown/watermelon),
	/obj/item/food/grown/pumpkin = list(/obj/item/reagent_container/food/snacks/grown/pumpkin),
))

/// Whether an item type satisfies a crafting requirement, counting the older kitchen items that stand in for it
/proc/crafting_type_matches(have_path, requirement)
	if(ispath(have_path, requirement))
		return TRUE
	for(var/alias in GLOB.crafting_aliases[requirement])
		if(ispath(have_path, alias))
			return TRUE
	return FALSE

/// Condiment containers that keep their own label
/obj/item/reagent_container/food/condiment/bastion
	icon = 'icons/obj/food/containers.dmi'
	var/fill_reagent
	var/fill_amount = 50

/obj/item/reagent_container/food/condiment/bastion/Initialize()
	. = ..()
	if(fill_reagent)
		reagents.add_reagent(fill_reagent, fill_amount)

/obj/item/reagent_container/food/condiment/bastion/on_reagent_change()
	return

/obj/item/reagent_container/food/condiment/bastion/flour
	name = "flour bag"
	desc = "A bag of flour, the start of most baking."
	icon_state = "flour"
	fill_reagent = "flour"

/obj/item/reagent_container/food/condiment/bastion/cornmeal
	name = "cornmeal"
	desc = "Coarsely ground dried corn."
	icon_state = "cornmeal"
	fill_reagent = "cornmeal"

/obj/item/reagent_container/food/condiment/bastion/honey
	name = "honey jar"
	desc = "Sweet, golden honey."
	icon_state = "honey"
	fill_reagent = "honey"

/obj/item/reagent_container/food/condiment/bastion/peanut_butter
	name = "peanut butter"
	desc = "A jar of creamy peanut butter."
	icon_state = "peanutbutter"
	fill_reagent = "peanut_butter"

/obj/item/reagent_container/food/condiment/bastion/mayonnaise
	name = "mayonnaise"
	desc = "A jar of mayonnaise."
	icon_state = "mayonnaise"
	fill_reagent = "mayonnaise"

/obj/item/reagent_container/food/condiment/bastion/vinegar
	name = "vinegar"
	desc = "A bottle of sharp vinegar."
	icon_state = "vinegar"
	fill_reagent = "vinegar"

/obj/item/reagent_container/food/condiment/bastion/bbq_sauce
	name = "BBQ sauce"
	desc = "Smoky barbecue sauce."
	icon_state = "bbqsauce"
	fill_reagent = "bbqsauce"

/obj/item/reagent_container/food/condiment/bastion/cherry_jelly
	name = "cherry jelly"
	desc = "A jar of cherry jelly."
	icon_state = "cherryjelly"
	fill_reagent = "cherryjelly"

/obj/item/reagent_container/food/condiment/bastion/vanilla
	name = "vanilla extract"
	desc = "A small bottle of vanilla extract."
	icon_state = "generic_condiment"
	fill_reagent = "vanilla"
	fill_amount = 30

/obj/item/reagent_container/food/condiment/bastion/rice
	name = "rice bag"
	desc = "A bag of uncooked rice."
	icon_state = "rice"
	fill_reagent = "rice"

/obj/item/reagent_container/food/condiment/bastion/cooking_oil
	name = "cooking oil"
	desc = "A bottle of oil for the pan and the fryer."
	icon_state = "cooking_oil"
	fill_reagent = "cornoil"

/obj/item/reagent_container/food/condiment/bastion/soy_sauce
	name = "soy sauce"
	desc = "A salty soy-based flavoring."
	icon_state = "soysauce"
	fill_reagent = "soysauce"

/obj/item/reagent_container/food/condiment/bastion/ketchup
	name = "ketchup"
	desc = "You feel more American already."
	icon_state = "ketchup"
	fill_reagent = "ketchup"
