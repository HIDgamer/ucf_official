/// Bastion cans, bottles, mugs and glasses, filled from a list of reagent ids
/obj/item/reagent_container/food/drinks/bastion
	name = "drink container"
	desc = "A container for drinks."
	icon = 'icons/obj/drinks/drinks.dmi'
	icon_state = "glass_empty"
	volume = 50
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(5, 10, 25)
	var/list/fill_reagents

/obj/item/reagent_container/food/drinks/bastion/Initialize()
	. = ..()
	for(var/reagent_id in fill_reagents)
		reagents.add_reagent(reagent_id, fill_reagents[reagent_id])

/obj/item/reagent_container/food/drinks/bastion/can
	name = "soda can"
	desc = "A can of soda."
	icon = 'icons/obj/drinks/soda.dmi'
	icon_state = "cola"
	volume = 30
	w_class = SIZE_SMALL

/obj/item/reagent_container/food/drinks/bastion/bottle
	name = "glass bottle"
	desc = "This blank bottle is unyieldingly anonymous, offering no clues to its contents."
	icon = 'icons/obj/drinks/bottles.dmi'
	icon_state = "glassbottle"
	volume = 100
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10, 25, 50)
	w_class = SIZE_MEDIUM

/obj/item/reagent_container/food/drinks/bastion/mug
	name = "mug"
	desc = "A mug."
	icon = 'icons/obj/drinks/coffee.dmi'
	icon_state = "tea_empty"
	volume = 30
	w_class = SIZE_SMALL
