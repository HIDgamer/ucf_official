/obj/item/food/icecreamsandwich
	name = "ice cream sandwich"
	desc = "Portable ice cream in its own packaging."
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "icecreamsandwich"
	w_class = SIZE_TINY
	food_reagents = list(
		"nutriment" = 3,
		"ice" = 4,
	)
	tastes = list("ice cream" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR
	food_flags = FOOD_FINGER_FOOD

/obj/item/food/strawberryicecreamsandwich
	name = "strawberry ice cream sandwich"
	desc = "Portable ice cream in its own packaging of the strawberry variety."
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "strawberryicecreamsandwich"
	w_class = SIZE_TINY
	food_reagents = list(
		"nutriment" = 4,
		"ice" = 4,
	)
	tastes = list("ice cream" = 2, "berry" = 2)
	foodtypes = FRUIT | DAIRY | SUGAR
	food_flags = FOOD_FINGER_FOOD


/obj/item/food/spacefreezy
	name = "space freezy"
	desc = "The best ice cream in space."
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "spacefreezy"
	w_class = SIZE_TINY
	food_reagents = list(
		"nutriment" = 13,
		"bluecherryjelly" = 5,
	)
	tastes = list("blue cherries" = 2, "ice cream" = 2)
	foodtypes = FRUIT | DAIRY | SUGAR

/obj/item/food/sundae
	name = "sundae"
	desc = "A classic dessert."
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "sundae"
	w_class = SIZE_SMALL
	food_reagents = list(
		"nutriment" = 8,
		"banana" = 5,
	)
	tastes = list("ice cream" = 1, "banana" = 1)
	foodtypes = FRUIT | DAIRY | SUGAR

/obj/item/food/honkdae
	name = "honkdae"
	desc = "The clown's favorite dessert."
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "honkdae"
	w_class = SIZE_SMALL
	food_reagents = list(
		"nutriment" = 10,
		"banana" = 10,
	)
	tastes = list("ice cream" = 1, "banana" = 1, "a bad joke" = 1)
	foodtypes = FRUIT | DAIRY | SUGAR

/////////////
//SNOWCONES//
/////////////

/obj/item/food/snowcones //We use this as a base for all other snowcones
	name = "flavorless snowcone"
	desc = "It's just shaved ice. Still fun to chew on."
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "flavorless_sc"
	w_class = SIZE_SMALL
	food_reagents = list(
		"water" = 11,
	) // We dont get food for water/juices
	tastes = list("ice" = 1, "water" = 1)
	foodtypes = SUGAR //We use SUGAR as a base line to act in as junkfood, other wise we use fruit
	food_flags = FOOD_FINGER_FOOD

/obj/item/food/snowcones/lime
	name = "lime snowcone"
	desc = "Lime syrup drizzled over a snowball in a paper cup."
	icon_state = "lime_sc"
	food_reagents = list(
		"nutriment" = 1,
		"limejuice" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "limes" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/lemon
	name = "lemon snowcone"
	desc = "Lemon syrup drizzled over a snowball in a paper cup."
	icon_state = "lemon_sc"
	food_reagents = list(
		"nutriment" = 1,
		"lemonjuice" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "lemons" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/apple
	name = "apple snowcone"
	desc = "Apple syrup drizzled over a snowball in a paper cup."
	icon_state = "amber_sc"
	food_reagents = list(
		"nutriment" = 1,
		"applejuice" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "apples" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/grape
	name = "grape snowcone"
	desc = "Grape syrup drizzled over a snowball in a paper cup."
	icon_state = "grape_sc"
	food_reagents = list(
		"nutriment" = 1,
		"grapejuice" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "grape" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/orange
	name = "orange snowcone"
	desc = "Orange syrup drizzled over a snowball in a paper cup."
	icon_state = "orange_sc"
	food_reagents = list(
		"nutriment" = 1,
		"orangejuice" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "orange" = 5)
	foodtypes = FRUIT | ORANGES

/obj/item/food/snowcones/blue
	name = "bluecherry snowcone"
	desc = "Bluecherry syrup drizzled over a snowball in a paper cup, how rare!"
	icon_state = "blue_sc"
	food_reagents = list(
		"nutriment" = 1,
		"bluecherryjelly" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "blue" = 5, "cherries" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/red
	name = "cherry snowcone"
	desc = "Cherry syrup drizzled over a snowball in a paper cup."
	icon_state = "red_sc"
	food_reagents = list(
		"nutriment" = 1,
		"cherryjelly" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "red" = 5, "cherries" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/berry
	name = "berry snowcone"
	desc = "Berry syrup drizzled over a snowball in a paper cup."
	icon_state = "berry_sc"
	food_reagents = list(
		"nutriment" = 1,
		"berryjuice" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "berries" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/fruitsalad
	name = "fruit salad snowcone"
	desc = "A delightful mix of citrus syrups drizzled over a snowball in a paper cup."
	icon_state = "fruitsalad_sc"
	food_reagents = list(
		"nutriment" = 1,
		"lemonjuice" = 5,
		"limejuice" = 5,
		"orangejuice" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "oranges" = 5, "limes" = 5, "lemons" = 5, "citrus" = 5, "salad" = 5)
	foodtypes = FRUIT | ORANGES

/obj/item/food/snowcones/pineapple
	name = "pineapple snowcone"
	desc = "Pineapple syrup drizzled over a snowball in a paper cup."
	icon_state = "pineapple_sc"
	food_reagents = list(
		"nutriment" = 1,
		"pineapplejuice" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "pineapples" = 5)
	foodtypes = FRUIT | PINEAPPLE

/obj/item/food/snowcones/mime
	name = "mime snowcone"
	desc = "..."
	icon_state = "mime_sc"
	food_reagents = list(
		"nutriment" = 1,
		"nothing" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "nothing" = 5)
	foodtypes = SUGAR

/obj/item/food/snowcones/clown
	name = "clown snowcone"
	desc = "Laughter drizzled over a snowball in a paper cup."
	icon_state = "clown_sc"
	food_reagents = list(
		"nutriment" = 1,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "jokes" = 5, "brainfreeze" = 5, "joy" = 5)
	foodtypes = SUGAR | FRUIT

/obj/item/food/snowcones/soda
	name = "space cola snowcone"
	desc = "Space Cola drizzled over a snowball in a paper cup."
	icon_state = "soda_sc"
	food_reagents = list(
		"nutriment" = 1,
		"cola" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "cola" = 5)
	foodtypes = SUGAR

/obj/item/food/snowcones/spacemountainwind
	name = "Space Mountain Wind snowcone"
	desc = "Space Mountain Wind drizzled over a snowball in a paper cup."
	icon_state = "mountainwind_sc"
	food_reagents = list(
		"nutriment" = 1,
		"spacemountainwind" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "mountain wind" = 5)
	foodtypes = SUGAR


/obj/item/food/snowcones/pwrgame
	name = "pwrgame snowcone"
	desc = "Pwrgame soda drizzled over a snowball in a paper cup."
	icon_state = "pwrgame_sc"
	food_reagents = list(
		"nutriment" = 1,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "valid" = 5, "salt" = 5, "wats" = 5)
	foodtypes = SUGAR

/obj/item/food/snowcones/honey
	name = "honey snowcone"
	desc = "Honey drizzled over a snowball in a paper cup."
	icon_state = "amber_sc"
	food_reagents = list(
		"nutriment" = 1,
		"honey" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "flowers" = 5, "sweetness" = 5, "wax" = 1)
	foodtypes = SUGAR

/obj/item/food/snowcones/rainbow
	name = "rainbow snowcone"
	desc = "A very colorful snowball in a paper cup."
	icon_state = "rainbow_sc"
	food_reagents = list(
		"nutriment" = 5,
		"water" = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "sunlight" = 5, "light" = 5, "slime" = 5, "paint" = 3, "clouds" = 3)
	foodtypes = SUGAR

/obj/item/food/popsicle
	name = "bug popsicle"
	desc = "Mmmm, this should not exist."
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "popsicle_stick_s"
	food_reagents = list(
		"nutriment" = 4,
		"cream" = 2,
		"vanilla" = 2,
		"sugar" = 4,
	)
	tastes = list("beetle juice")
	trash_type = /obj/item/popsicle_stick
	w_class = SIZE_SMALL
	foodtypes = DAIRY | SUGAR
	food_flags = FOOD_FINGER_FOOD

	var/overlay_state = "creamsicle_o" //This is the edible part of the popsicle.
	var/bite_states = 4 //This value value is used for correctly setting the bite_consumption to ensure every bite changes the sprite. Do not set to zero.

/obj/item/popsicle_stick
	name = "popsicle stick"
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "popsicle_stick"
	desc = "This humble little stick usually carries a frozen treat, at the moment it seems freed from this Atlassian burden."
	w_class = SIZE_TINY
	force = 0

/obj/item/popsicle_stick/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_TRASH_ITEM, INNATE_TRAIT)

/obj/item/food/popsicle/creamsicle_orange
	name = "orange creamsicle"
	desc = "A classic orange creamsicle. A sunny frozen treat."
	food_reagents = list(
		"orangejuice" = 4,
		"cream" = 2,
		"vanilla" = 2,
		"sugar" = 4,
	)
	foodtypes = FRUIT | DAIRY | SUGAR | ORANGES

/obj/item/food/popsicle/creamsicle_berry
	name = "berry creamsicle"
	desc = "A vibrant berry creamsicle. A berry good frozen treat."
	food_reagents = list(
		"berryjuice" = 4,
		"cream" = 2,
		"vanilla" = 2,
		"sugar" = 4,
	)
	overlay_state = "creamsicle_m"
	foodtypes = FRUIT | DAIRY | SUGAR

/obj/item/food/popsicle/jumbo
	name = "jumbo ice cream"
	desc = "A luxurious ice cream covered in rich chocolate. It seems smaller than you remember it being."
	food_reagents = list(
		"hot_coco" = 4,
		"cream" = 2,
		"vanilla" = 3,
		"sugar" = 2,
	)
	overlay_state = "jumbo"

/obj/item/food/popsicle/licorice_creamsicle
	name = "Void Bar™"
	desc = "A salty licorice ice cream. A salty frozen treat."
	food_reagents = list(
		"nutriment" = 4,
		"sodiumchloride" = 1,
		"cream" = 2,
		"vanilla" = 1,
		"sugar" = 4,
	)
	tastes = list("salty liquorice")
	overlay_state = "licorice_creamsicle"

/obj/item/food/cornuto
	name = "cornuto"
	w_class = SIZE_SMALL
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "cornuto"
	desc = "A neapolitan vanilla and chocolate ice cream cone. It menaces with a sprinkling of caramelized nuts."
	food_reagents = list(
		"nutriment" = 6,
		"hot_coco" = 4,
		"cream" = 2,
		"vanilla" = 4,
		"sugar" = 2,
	)
	tastes = list("chopped hazelnuts", "waffle")
	foodtypes = DAIRY | SUGAR
	venue_value = FOOD_PRICE_NORMAL

/obj/item/food/popsicle/meatsicle
	name = "Meatsicle"
	desc = "A horrific abomination of raw meat, glazed with sugar on a stick, then frozen."
	food_reagents = list(
		"nutriment" = 8,
		"sugar" = 4,
	)
	overlay_state = "meatsicle"
	foodtypes = RAW | MEAT | SUGAR
