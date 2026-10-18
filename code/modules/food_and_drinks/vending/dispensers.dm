/// Bastion's bar dispensers, same machines with the Bastion sprites and drinks lists
/obj/structure/machinery/chem_dispenser/soda/bastion
	name = "soda dispenser"
	desc = "Contains a large reservoir of soft drinks."
	icon = 'icons/obj/medical/chemical.dmi'
	icon_state = "soda_dispenser"
	dispensable_reagents = list(
		"coffee",
		"cola",
		"cream",
		"dr_gibb",
		"grenadine",
		"ice",
		"icetea",
		"lemonjuice",
		"lemon_lime",
		"limejuice",
		"melon_soda",
		"mintextract",
		"orangejuice",
		"pineapplejuice",
		"pwr_game",
		"shamblers",
		"spacemountainwind",
		"sodawater",
		"sol_dry",
		"space_up",
		"sugar",
		"tea",
		"tomatojuice",
		"tonic",
		"water",
	)
	hacked_reagents = list(
		"thirteenloko",
		"whiskey_cola",
		"mindbreaker",
	)

/obj/structure/machinery/chem_dispenser/soda/bastion/beer
	name = "booze dispenser"
	desc = "Contains a large reservoir of the good stuff."
	icon_state = "booze_dispenser"
	ui_title = "Booze Portal 9001"
	dispensable_reagents = list(
		"absinthe",
		"ale",
		"applejack",
		"beer",
		"coconut_rum",
		"cognac",
		"creme_de_cacao",
		"creme_de_coconut",
		"creme_de_menthe",
		"curacao",
		"gin",
		"hcider",
		"kahlua",
		"maltliquor",
		"navy_rum",
		"rice_beer",
		"rum",
		"sake",
		"tequila",
		"triple_sec",
		"vermouth",
		"vodka",
		"whiskey",
		"wine",
		"yuyake",
	)
	hacked_reagents = list(
		"ethanol",
		"atomicbomb",
		"fernet",
	)
