/datum/bastion_processor_recipe/meat
	input = /obj/item/food/meat/slab
	output = /obj/item/food/raw_meatball
	blacklist = list(/obj/item/food/meat/slab/human,
		/obj/item/food/meat/slab/corgi,
		/obj/item/food/meat/slab/xeno,
		/obj/item/food/meat/slab/bear,
		/obj/item/food/meat/slab/chicken)
	food_multiplier = 3

/datum/bastion_processor_recipe/cutlet
	input = /obj/item/food/meat/cutlet/plain
	blacklist = list(/obj/item/food/meat/cutlet/plain/human,
		/obj/item/food/meat/cutlet/xeno,
		/obj/item/food/meat/cutlet/bear,
		/obj/item/food/meat/cutlet/chicken)
	output = /obj/item/food/raw_meatball

/datum/bastion_processor_recipe/meat/human
	input = /obj/item/food/meat/slab/human
	output = /obj/item/food/raw_meatball/human
	blacklist = null

/datum/bastion_processor_recipe/cutlet/human
	input = /obj/item/food/meat/cutlet/plain/human
	output = /obj/item/food/raw_meatball/human
	blacklist = null

/datum/bastion_processor_recipe/meat/corgi
	input = /obj/item/food/meat/slab/corgi
	output = /obj/item/food/raw_meatball/corgi
	blacklist = null

/datum/bastion_processor_recipe/meat/xeno
	input = /obj/item/food/meat/slab/xeno
	output = /obj/item/food/raw_meatball/xeno
	blacklist = null

/datum/bastion_processor_recipe/cutlet/xeno
	input = /obj/item/food/meat/cutlet/xeno
	output = /obj/item/food/raw_meatball/xeno
	blacklist = null

/datum/bastion_processor_recipe/meat/bear
	input = /obj/item/food/meat/slab/bear
	output = /obj/item/food/raw_meatball/bear
	blacklist = null

/datum/bastion_processor_recipe/cutlet/bear
	input = /obj/item/food/meat/cutlet/bear
	output = /obj/item/food/raw_meatball/bear
	blacklist = null

/datum/bastion_processor_recipe/meat/chicken
	input = /obj/item/food/meat/slab/chicken
	output = /obj/item/food/raw_meatball/chicken
	food_multiplier = 3
	blacklist = null

/datum/bastion_processor_recipe/cutlet/chicken
	input = /obj/item/food/meat/cutlet/chicken
	output = /obj/item/food/raw_meatball/chicken

/datum/bastion_processor_recipe/fishmeat
	input = /obj/item/food/fishmeat/carp
	output = /obj/item/food/fishmeat
	blacklist = null

/datum/bastion_processor_recipe/bacon
	input = /obj/item/food/meat/rawcutlet
	output = /obj/item/food/meat/rawbacon

/datum/bastion_processor_recipe/tempeh
	input = /obj/item/food/tempehstarter
	output = /obj/item/food/tempeh
	food_multiplier = 2

/datum/bastion_processor_recipe/spidereggs
	input = /obj/item/food/spidereggs
	blacklist = list(/obj/item/food/spidereggs/processed)
	output = /obj/item/food/spidereggs/processed

/datum/bastion_processor_recipe/carrot
	input = /obj/item/food/grown/carrot
	output = /obj/item/food/carrotfries

/datum/bastion_processor_recipe/soybeans
	input = /obj/item/food/grown/soybeans
	output = /obj/item/food/soydope

/datum/bastion_processor_recipe/spaghetti
	input = /obj/item/food/doughslice
	output = /obj/item/food/spaghetti/raw

/datum/bastion_processor_recipe/corn
	input = /obj/item/food/grown/corn
	output = /obj/item/food/tortilla

/datum/bastion_processor_recipe/tortilla
	input = /obj/item/food/tortilla
	output = /obj/item/food/cornchips

/datum/bastion_processor_recipe/parsnip
	input = /obj/item/food/grown/parsnip
	output = /obj/item/food/roastparsnip

/datum/bastion_processor_recipe/towercap
	input = /obj/item/grown/log
	output = /obj/item/popsicle_stick
	food_multiplier = 3
