
////////////////////////////////////////////EGGS////////////////////////////////////////////

/obj/item/food/chocolateegg
	name = "chocolate egg"
	desc = "Such, sweet, fattening food."
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "chocolateegg"
	food_reagents = list("nutriment" = 5, "sugar" = 2, "coco" = 2, "nutriment" = 1)
	tastes = list("chocolate" = 4, "sweetness" = 1)
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = SIZE_TINY

/// Counter for number of chicks hatched by throwing eggs, minecraft style. Chicks will not emerge from thrown eggs if this value exceeds the MAX_CHICKENS define.
GLOBAL_VAR_INIT(chicks_from_eggs, 0)

/obj/item/food/egg
	name = "egg"
	desc = "An egg!"
	icon_state = "chicken"
	icon = 'icons/obj/ranching/eggs.dmi'
	inhand_icon_state = "egg"
	food_reagents = list("egg" = 2, "egg" = 4)
	foodtypes = MEAT | RAW
	w_class = SIZE_TINY
	ant_attracting = FALSE
	decomp_type = /obj/item/food/egg/rotten
	decomp_req_handle = TRUE //so laid eggs can actually become chickens
	var/chick_throw_prob = 13
	bite_consumption = 100 // whole ass egg all at once
	food_buffs = STATUS_EFFECT_STAM_REGEN_SMALL

/obj/item/food/egg/Initialize(mapload)
	. = ..()

/obj/item/food/egg/proc/consumed_egg(datum/source, mob/living/eater, mob/living/feeder)
	SIGNAL_HANDLER
	return

/obj/item/food/egg/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/boiledegg, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/egg/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/boiledegg)

/obj/item/food/egg/rotten
	food_reagents = list( "toxin" = 10)
	foodtypes = GROSS
	preserved_food = TRUE

/obj/item/food/egg/rotten/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/boiledegg/rotten, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/egg/rotten/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/boiledegg/rotten)

/obj/item/food/egg/gland
	desc = "An egg! It looks weird..."

/obj/item/food/egg/blue
	icon_state = "egg-blue"
	inhand_icon_state = "egg-blue"
/obj/item/food/egg/green
	icon_state = "egg-green"
	inhand_icon_state = "egg-green"
/obj/item/food/egg/mime
	icon_state = "egg-mime"
	inhand_icon_state = "egg-mime"
/obj/item/food/egg/orange
	icon_state = "egg-orange"
	inhand_icon_state = "egg-orange"

/obj/item/food/egg/purple
	icon_state = "egg-purple"
	inhand_icon_state = "egg-purple"

/obj/item/food/egg/rainbow
	icon_state = "chicken"

/obj/item/food/egg/red
	icon_state = "egg-red"
	inhand_icon_state = "egg-red"

/obj/item/food/egg/yellow
	icon_state = "egg-yellow"
	inhand_icon_state = "egg-yellow"

/obj/item/food/egg/fertile
	name = "fertile-looking egg"
	desc = "An egg! It looks fertilized.\nQuite how you can tell this just by looking at it is a mystery."
	chick_throw_prob = 100

/obj/item/food/friedegg
	name = "fried egg"
	desc = "A fried egg. Would go well with a touch of salt and pepper."
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "friedegg"
	food_reagents = list(
		"nutriment" = 4,
		"egg" = 1,
	)
	bite_consumption = 1
	tastes = list("egg" = 4)
	foodtypes = MEAT | FRIED | BREAKFAST
	w_class = SIZE_SMALL
	burns_on_grill = TRUE

/obj/item/food/rawegg
	name = "raw egg"
	desc = "Supposedly good for you, if you can stomach it. Better fried."
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "rawegg"
	food_reagents = list() //Recieves all reagents from its whole egg counterpart
	bite_consumption = 1
	tastes = list("raw egg" = 6, "sliminess" = 1)
	eatverbs = list("gulp down")
	foodtypes = MEAT | RAW
	w_class = SIZE_SMALL

/obj/item/food/rawegg/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/friedegg, rand(20 SECONDS, 35 SECONDS), TRUE, FALSE)

/obj/item/food/boiledegg
	name = "boiled egg"
	desc = "A hard boiled egg."
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "egg"
	inhand_icon_state = "egg"
	food_reagents = list(
		"nutriment" = 4,
	)
	tastes = list("egg" = 1)
	foodtypes = MEAT | BREAKFAST
	food_flags = FOOD_FINGER_FOOD
	w_class = SIZE_SMALL
	ant_attracting = FALSE
	decomp_type = /obj/item/food/boiledegg/rotten
	food_buffs = STATUS_EFFECT_STAM_REGEN_SMALL

/obj/item/food/eggsausage
	name = "egg with sausage"
	desc = "A good egg with a side of sausages."
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "eggsausage"
	food_reagents = list("nutriment" = 8, "nutriment" = 2, "nutriment" = 4)
	foodtypes = MEAT | FRIED | BREAKFAST
	tastes = list("egg" = 4, "meat" = 4)
	venue_value = FOOD_PRICE_NORMAL

/obj/item/food/boiledegg/rotten
	food_reagents = list()
	tastes = list("rotten egg" = 1)
	foodtypes = GROSS
	preserved_food = TRUE

/obj/item/food/omelette //FUCK THIS
	name = "omelette du fromage"
	desc = "That's all you can say!"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "omelette"
	food_reagents = list(
		"nutriment" = 13,
	)
	bite_consumption = 1
	w_class = SIZE_SMALL
	tastes = list("egg" = 1, "cheese" = 1)
	foodtypes = MEAT | BREAKFAST | DAIRY
	venue_value = FOOD_PRICE_CHEAP
	food_buffs = STATUS_EFFECT_STAM_REGEN_MEDIUM

/obj/item/food/benedict
	name = "eggs benedict"
	desc = "There is only one egg on this, how rude."
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "benedict"
	food_reagents = list(
		"nutriment" = 15,
	)
	w_class = SIZE_SMALL
	tastes = list("egg" = 1, "bacon" = 1, "bun" = 1)
	foodtypes = MEAT | BREAKFAST | GRAIN
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_STAM_REGEN_MEDIUM

/obj/item/food/eggwrap
	name = "egg wrap"
	desc = "The precursor to Pigs in a Blanket."
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "eggwrap"
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("egg" = 1)
	foodtypes = MEAT | VEGETABLES
	w_class = SIZE_TINY

/obj/item/food/chawanmushi
	name = "chawanmushi"
	desc = "A legendary egg custard that makes friends out of enemies. Probably too hot for a cat to eat."
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "chawanmushi"
	food_reagents = list(
		"nutriment" = 8,
	)
	tastes = list("custard" = 1)
	foodtypes = MEAT | VEGETABLES
