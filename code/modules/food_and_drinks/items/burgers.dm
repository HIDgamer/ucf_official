/obj/item/food/burger
	icon = 'icons/obj/food/burgerbread.dmi'
	icon_state = "hburger"
	inhand_icon_state = "burger"
	bite_consumption = 3
	food_reagents = list(
		"nutriment" = 8,
	)
	tastes = list("bun" = 2, "beef patty" = 4)
	foodtypes = GRAIN | MEAT //lettuce doesn't make burger a vegetable.
	eat_time = 15 //Quick snack
	w_class = SIZE_SMALL
	food_buffs = STATUS_EFFECT_FOOD_HEALTH_TINY

/obj/item/food/burger/plain
	name = "plain burger"
	desc = "The cornerstone of every nutritious breakfast."
	food_reagents = list(
		"nutriment" = 9,
	)
	foodtypes = GRAIN | MEAT
	custom_price = PAYCHECK_CREW * 0.8
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/burger/human
	name = "human burger"
	desc = "A bloody burger."
	food_reagents = list(
		"nutriment" = 13,
	)
	tastes = list("bun" = 2, "long pig" = 4)
	foodtypes = MEAT | GRAIN | GORE
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/burger/corgi
	name = "corgi burger"
	desc = "You monster."
	food_reagents = list(
		"nutriment" = 14,
	)
	tastes = list("bun" = 4, "corgi meat" = 2)
	foodtypes = GRAIN | MEAT | GORE
	venue_value = FOOD_PRICE_EXOTIC

/obj/item/food/burger/appendix
	name = "appendix burger"
	desc = "Tastes like appendicitis."
	icon_state = "appendixburger"
	food_reagents = list(
		"nutriment" = 14,
	)
	tastes = list("bun" = 4, "grass" = 2)
	foodtypes = GRAIN | MEAT | GORE
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_FOOD_RESISTANCE

/obj/item/food/burger/fish
	name = "fillet -o- carp sandwich"
	desc = "Almost like a carp is yelling somewhere... Give me back that fillet -o- carp, give me that carp."
	icon_state = "fishburger"
	food_reagents = list(
		"nutriment" = 13,
	)
	tastes = list("bun" = 4, "fish" = 4)
	foodtypes = GRAIN | SEAFOOD
	venue_value = FOOD_PRICE_EXOTIC
	food_buffs = STATUS_EFFECT_FOOD_RESISTANCE

/obj/item/food/burger/tofu
	name = "tofu burger"
	desc = "What.. is that meat?"
	icon_state = "tofuburger"
	food_reagents = list(
		"nutriment" = 12,
	)
	tastes = list("bun" = 4, "tofu" = 4)
	foodtypes = GRAIN | VEGETABLES
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/burger/roburger
	name = "roburger"
	desc = "The lettuce is the only organic component. Beep."
	icon_state = "roburger"
	food_reagents = list(
		"nutriment" = 14,
	)
	tastes = list("bun" = 4, "lettuce" = 2, "sludge" = 1)
	foodtypes = GRAIN | TOXIC
	venue_value = FOOD_PRICE_EXOTIC

/obj/item/food/burger/roburger/big
	desc = "This massive patty looks like poison. Beep."
	max_volume = 120
	food_reagents = list(
		"nutriment" = 26,
	)

/obj/item/food/burger/xeno
	name = "xenoburger"
	desc = "Smells caustic. Tastes like heresy."
	icon_state = "xburger"
	food_reagents = list(
		"nutriment" = 14,
	)
	tastes = list("bun" = 4, "acid" = 4)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_EXOTIC

/obj/item/food/burger/bearger
	name = "bearger"
	desc = "Best served rawr."
	icon_state = "bearger"
	food_reagents = list(
		"nutriment" = 14,
	)
	tastes = list("bun" = 2, "meat" = 2, "salmon" = 2)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_EXOTIC
	food_buffs = STATUS_EFFECT_FOOD_HEALTH_MEDIUM

/obj/item/food/burger/clown
	name = "clown burger"
	desc = "This tastes funny..."
	icon_state = "clownburger"
	food_reagents = list(
		"nutriment" = 16,
	)
	tastes = list("bun" = 2, "a bad joke" = 4)
	foodtypes = GRAIN | FRUIT
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_FOOD_SLIDE

/obj/item/food/burger/mime
	name = "mime burger"
	desc = "Its taste defies language."
	icon_state = "mimeburger"
	food_reagents = list(
		"nutriment" = 19,
		"nothing" = 6,
	)
	foodtypes = GRAIN
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_STAM_REGEN_MEDIUM

/obj/item/food/burger/brain
	name = "brainburger"
	desc = "A strange looking burger. It looks almost sentient."
	icon_state = "brainburger"
	food_reagents = list(
		"nutriment" = 17,
	)
	tastes = list("bun" = 4, "brains" = 2)
	foodtypes = GRAIN | MEAT | GORE
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/burger/ghost
	name = "ghost burger"
	desc = "Too Spooky!"
	icon_state = "ghostburger"
	food_reagents = list(
		"nutriment" = 21,
		"sodiumchloride" = 5,
	)
	tastes = list("bun" = 2, "ectoplasm" = 4)
	foodtypes = GRAIN
	alpha = 170
	venue_value = FOOD_PRICE_EXOTIC

/obj/item/food/burger/ghost/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/food/burger/ghost/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/food/burger/red
	name = "red burger"
	desc = "Perfect for hiding the fact that it's burnt to a crisp."
	icon_state = "cburger"
	color = COLOR_RED
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 2, "red" = 2)
	foodtypes = GRAIN | MEAT

/obj/item/food/burger/orange
	name = "orange burger"
	desc = "Contains 0% juice."
	icon_state = "cburger"
	color = COLOR_ORANGE
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 2, "orange" = 2)
	foodtypes = GRAIN | MEAT

/obj/item/food/burger/yellow
	name = "yellow burger"
	desc = "Bright to the last bite."
	icon_state = "cburger"
	color = COLOR_YELLOW
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 2, "yellow" = 2)
	foodtypes = GRAIN | MEAT

/obj/item/food/burger/green
	name = "green burger"
	desc = "It's not tainted meat, it's painted meat!"
	icon_state = "cburger"
	color = COLOR_GREEN
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 2, "green" = 2)
	foodtypes = GRAIN | MEAT

/obj/item/food/burger/blue
	name = "blue burger"
	desc = "Is this blue rare?"
	icon_state = "cburger"
	color = COLOR_BLUE
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 2, "blue" = 2)
	foodtypes = GRAIN | MEAT

/obj/item/food/burger/purple
	name = "purple burger"
	desc = "Regal and low class at the same time."
	icon_state = "cburger"
	color = COLOR_PURPLE
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 2, "purple" = 2)
	foodtypes = GRAIN | MEAT

/obj/item/food/burger/black
	name = "black burger"
	desc = "This is overcooked."
	icon_state = "cburger"
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 2, "black" = 2)
	foodtypes = GRAIN | MEAT

/obj/item/food/burger/white
	name = "white burger"
	desc = "Delicous titanium!"
	icon_state = "cburger"
	color = COLOR_WHITE
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 2, "white" = 2)
	foodtypes = GRAIN | MEAT

/obj/item/food/burger/spell
	name = "spell burger"
	desc = "This is absolutely Ei Nath."
	icon_state = "spellburger"
	food_reagents = list(
		"nutriment" = 21,
	)
	tastes = list("bun" = 4, "magic" = 2)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_NORMAL

/obj/item/food/burger/bigbite
	name = "big bite burger"
	desc = "Forget the Big Mac. THIS is the future!"
	icon_state = "bigbiteburger"
	food_reagents = list(
		"nutriment" = 19,
	)
	tastes = list("bun" = 2, "meat" = 10)
	w_class = SIZE_MEDIUM
	foodtypes = GRAIN | MEAT | DAIRY
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_FOOD_JOB_MINER

/obj/item/food/burger/jelly
	name = "jelly burger"
	desc = "Culinary delight..?"
	icon_state = "jellyburger"
	tastes = list("bun" = 4, "jelly" = 2)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_EXOTIC

/obj/item/food/burger/jelly/slime
	food_reagents = list(
		"nutriment" = 12,
	)
	foodtypes = GRAIN | TOXIC

/obj/item/food/burger/jelly/cherry
	food_reagents = list(
		"nutriment" = 12,
		"cherryjelly" = 6,
	)
	foodtypes = GRAIN | FRUIT

/obj/item/food/burger/superbite
	name = "super bite burger"
	desc = "This is a mountain of a burger. FOOD!"
	icon_state = "superbiteburger"
	food_reagents = list(
		"nutriment" = 79,
	)
	w_class = SIZE_MEDIUM
	bite_consumption = 7
	max_volume = 100
	tastes = list("bun" = 4, "type two diabetes" = 10)
	foodtypes = GRAIN | MEAT | DAIRY
	venue_value = FOOD_PRICE_EXOTIC

/obj/item/food/burger/fivealarm
	name = "five alarm burger"
	desc = "HOT! HOT!"
	icon_state = "fivealarmburger"
	food_reagents = list(
		"nutriment" = 16,
		"capsaicin" = 5,
		"condensedcapsaicin" = 5,
	)
	tastes = list("extreme heat" = 4, "bun" = 2)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_FOOD_FIREBURPS

/obj/item/food/burger/rat
	name = "rat burger"
	desc = "Pretty much what you'd expect..."
	icon_state = "ratburger"
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("dead rat" = 4, "bun" = 2)
	foodtypes = GRAIN | MEAT | GORE
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/burger/baseball
	name = "home run baseball burger"
	desc = "It's still warm. The steam coming off of it looks like baseball."
	icon_state = "baseball"
	food_reagents = list(
		"nutriment" = 10,
	)
	tastes = list("bun" = 2, "a home run" = 4)
	foodtypes = GRAIN | GROSS
	custom_price = PAYCHECK_CREW * 0.8
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_FOOD_RESISTANCE

/obj/item/food/burger/baconburger
	name = "bacon burger"
	desc = "The perfect combination of all things American."
	icon_state = "baconburger"
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bacon" = 4, "bun" = 2)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_STAM_REGEN_LARGE

/obj/item/food/burger/empoweredburger
	name = "empowered burger"
	desc = "It's shockingly good, if you live off of electricity that is."
	icon_state = "empoweredburger"
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 2, "pure electricity" = 4)
	foodtypes = GRAIN | TOXIC
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/burger/catburger
	name = "catburger"
	desc = "Finally those cats and catpeople are worth something!"
	icon_state = "catburger"
	food_reagents = list(
		"nutriment" = 11,
	)
	tastes = list("bun" = 4, "meat" = 2, "cat" = 2)
	foodtypes = GRAIN | MEAT | GORE

/obj/item/food/burger/crab
	name = "crab burger"
	desc = "A delicious patty of the crabby kind, slapped in between a bun."
	icon_state = "crabburger"
	food_reagents = list(
		"nutriment" = 13,
	)
	tastes = list("bun" = 2, "crab meat" = 4)
	foodtypes = GRAIN | SEAFOOD
	venue_value = FOOD_PRICE_NORMAL

/obj/item/food/burger/soylent
	name = "soylent burger"
	desc = "An eco-friendly burger made using upcycled low value biomass."
	icon_state = "soylentburger"
	food_reagents = list(
		"nutriment" = 14,
	)
	tastes = list("bun" = 2, "assistant" = 4)
	foodtypes = GRAIN | MEAT | DAIRY
	venue_value = FOOD_PRICE_EXOTIC

/obj/item/food/burger/rib
	name = "mcrib"
	desc = "An elusive rib shaped burger with limited availablity across the galaxy. Not as good as you remember it."
	icon_state = "mcrib"
	food_reagents = list(
		"nutriment" = 13,
		"bbqsauce" = 1,
		)
	tastes = list("bun" = 2, "pork patty" = 4)
	foodtypes = GRAIN | MEAT
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_STAM_REGEN_MEDIUM

/obj/item/food/burger/mcguffin
	name = "mcguffin"
	desc = "A cheap and greasy imitation of an eggs benedict."
	icon_state = "mcguffin"
	food_reagents = list(
		"nutriment" = 10,
		"egg" = 3,
	)
	tastes = list("muffin" = 2, "bacon" = 3)
	foodtypes = GRAIN | MEAT | BREAKFAST
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_STAM_REGEN_MEDIUM

/obj/item/food/burger/chicken
	name = "chicken sandwich" //Apparently the proud people of Americlapstan object to this thing being called a burger. Apparently McDonald's just calls it a burger in Europe as to not scare and confuse us.
	desc = "A delicious chicken sandwich, it is said the proceeds from this treat helps criminalize disarming people on the space frontier."
	icon_state = "chickenburger"
	food_reagents = list(
		"nutriment" = 11,
		"mayonnaise" = 3,
		"cornoil" = 2,
	)
	tastes = list("bun" = 2, "chicken" = 4, "God's covenant" = 1)
	foodtypes = GRAIN | MEAT | FRIED
	venue_value = FOOD_PRICE_NORMAL
	food_buffs = STATUS_EFFECT_STAM_REGEN_MEDIUM

/obj/item/food/burger/cheese
	name = "cheese burger"
	desc = "This noble burger stands proudly clad in golden cheese."
	icon_state = "cheeseburger"
	food_reagents = list(
		"nutriment" = 12,
	)
	tastes = list("bun" = 2, "beef patty" = 4, "cheese" = 3)
	foodtypes = GRAIN | MEAT | DAIRY
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/burger/cheese/Initialize(mapload)
	. = ..()
	if(prob(33))
		icon_state = "cheeseburgeralt"

/obj/item/food/burger/crazy
	name = "crazy hamburger"
	desc = "This looks like the sort of food that a demented clown in a trenchcoat would make."
	icon_state = "crazyburger"
	food_reagents = list(
		"nutriment" = 16,
		"capsaicin" = 3,
		"condensedcapsaicin" = 3,
	)
	tastes = list("bun" = 2, "beef patty" = 4, "cheese" = 2, "beef soaked in chili" = 3, "a smoking flare" = 2)
	foodtypes = GRAIN | MEAT | DAIRY
	food_buffs = STATUS_EFFECT_FOOD_HEALTH_LARGE

/obj/item/food/burger/crazy/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

// empty burger you can customize
/obj/item/food/burger/empty
	name = "burger"
	desc = "A crazy, custom burger made by a mad cook."
	icon_state = "custburg"
	tastes = list("bun")
	foodtypes = GRAIN

/obj/item/food/burger/sloppy_moe
	name = "sloppy moe"
	desc = "Ground meat mixed with onions and barbeque sauce, sloppily plopped onto a burger bun. Delicious, but guaranteed to get your hands dirty."
	icon_state = "sloppy_moe"
	food_reagents = list(
		"nutriment" = 24,
	)
	tastes = list("juicy meat" = 4, "BBQ sauce" = 3, "onions" = 2, "bun" = 2)
	foodtypes = GRAIN | MEAT | VEGETABLES
	venue_value = FOOD_PRICE_NORMAL
