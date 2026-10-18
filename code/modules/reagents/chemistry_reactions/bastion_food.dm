/datum/chemical_reaction/bastion_dough
	name = "Dough"
	id = "bastion_dough"
	result = null
	required_reagents = list("water" = 10, "flour" = 15)
	result_amount = 1

/datum/chemical_reaction/bastion_dough/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/food/dough(location)

/datum/chemical_reaction/bastion_cakebatter
	name = "Cake Batter"
	id = "bastion_cakebatter"
	result = null
	required_reagents = list("egg" = 18, "flour" = 15, "sugar" = 5)
	result_amount = 1

/datum/chemical_reaction/bastion_cakebatter/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/food/cakebatter(location)

/datum/chemical_reaction/bastion_cakebatter_vegan
	name = "Vegan Cake Batter"
	id = "bastion_cakebatter_vegan"
	result = null
	required_reagents = list("soymilk" = 15, "flour" = 15, "sugar" = 5)
	result_amount = 1

/datum/chemical_reaction/bastion_cakebatter_vegan/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/food/cakebatter(location)

/datum/chemical_reaction/bastion_rice
	name = "Soaked Rice"
	id = "bastion_rice"
	result = null
	required_reagents = list("rice" = 10, "water" = 10)
	result_amount = 1

/datum/chemical_reaction/bastion_rice/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/food/uncooked_rice(location)

/datum/chemical_reaction/bastion_mozzarella
	name = "Mozzarella"
	id = "bastion_mozzarella"
	result = null
	required_reagents = list("milk" = 10, "cream" = 10)
	required_catalysts = list("enzyme" = 1)
	result_amount = 1

/datum/chemical_reaction/bastion_mozzarella/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/food/cheese/mozzarella(location)

/datum/chemical_reaction/bastion_curd_cheese
	name = "Curd Cheese"
	id = "bastion_curd_cheese"
	result = null
	required_reagents = list("milk" = 15, "vinegar" = 5, "cream" = 5)
	result_amount = 1

/datum/chemical_reaction/bastion_curd_cheese/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/food/cheese/curd_cheese(location)

/datum/chemical_reaction/bastion_chocolate_bar
	name = "Chocolate Bar"
	id = "bastion_chocolate_bar"
	result = null
	required_reagents = list("milk" = 5, "coco" = 5, "sugar" = 5)
	result_amount = 1

/datum/chemical_reaction/bastion_chocolate_bar/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/food/chocolatebar(location)

/datum/chemical_reaction/bastion_vinegar
	name = "Vinegar"
	id = "bastion_vinegar"
	result = "vinegar"
	required_reagents = list("wine" = 5, "water" = 5, "sugar" = 5)
	result_amount = 25
