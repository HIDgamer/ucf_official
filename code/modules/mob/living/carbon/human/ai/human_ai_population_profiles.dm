/// Sorokyne Strata: a mining outpost with a police detachment, a UPP patrol, workers, medical staff and reactor techs
/datum/npc_population_profile/sorokyne
	map_name = "Sorokyne Strata"
	group_types = list(
		/datum/npc_population_group/sorokyne/police,
		/datum/npc_population_group/sorokyne/patrol,
		/datum/npc_population_group/sorokyne/workers,
		/datum/npc_population_group/sorokyne/medical,
		/datum/npc_population_group/sorokyne/reactor,
	)

/datum/npc_population_group/sorokyne/police
	id = "soro_police"
	name = "People's Armed Police"
	presets = list(/datum/equipment_preset/survivor/peoples_armed_police = 1)
	personalities = list("professional" = 3, "cautious" = 1)
	roles = list("security" = 1)
	size_min = 3
	size_max = 5
	size_per_player = 0.05
	squad_size = 4
	zones = list(/area/strata/interior/outpost/security = 1)
	behavior = HAI_POP_GUARD
	marine_attitude = "wary"

/datum/npc_population_group/sorokyne/patrol
	id = "soro_patrol"
	name = "UPP army fire team"
	presets = list(/datum/equipment_preset/survivor/upp/army = 1)
	personalities = list("veteran" = 2, "professional" = 2, "paranoid" = 1)
	roles = list("rifleman" = 4, "medic" = 1, "machinegunner" = 1)
	size_min = 4
	size_max = 6
	size_per_player = 0.05
	squad_size = 5
	zones = list(/area/strata/exterior/north_outpost = 1, /area/strata/exterior/south_outpost = 1)
	behavior = HAI_POP_PATROL
	marine_attitude = "wary"

/datum/npc_population_group/sorokyne/workers
	id = "soro_workers"
	name = "Miners and colonists"
	presets = list(/datum/equipment_preset/survivor/upp_miner = 3, /datum/equipment_preset/survivor/upp_colonist = 3, /datum/equipment_preset/survivor/upp_fire_fighter = 1)
	personalities = list("friendly" = 3, "skittish" = 3, "cautious" = 1)
	roles = list("civilian" = 1)
	size_min = 4
	size_max = 9
	size_per_player = 0.1
	zones = list(/area/strata/interior/outpost/canteen = 2, /area/strata/interior/outpost/canteen/bar = 1, /area/strata/interior/outpost/engi = 1, /area/strata/interior/outpost/foyer = 1)
	behavior = HAI_POP_LOITER
	marine_attitude = "friendly"
	reaction = "cower"

/datum/npc_population_group/sorokyne/medical
	id = "soro_medical"
	name = "Medical and research staff"
	presets = list(/datum/equipment_preset/survivor/scientist/soro = 1, /datum/equipment_preset/survivor/doctor/soro = 1)
	personalities = list("skittish" = 2, "cautious" = 2)
	roles = list("civilian" = 2, "medic" = 1)
	size_min = 2
	size_max = 5
	size_per_player = 0.05
	zones = list(/area/strata/interior/outpost/med = 2, /area/strata/interior/research = 1)
	behavior = HAI_POP_LOITER
	marine_attitude = "friendly"
	reaction = "cower"

/datum/npc_population_group/sorokyne/reactor
	id = "soro_reactor"
	name = "Reactor technicians"
	presets = list(/datum/equipment_preset/survivor/engineer/soro_reactor_tech = 2, /datum/equipment_preset/survivor/engineer/soro_industry_contractor = 1)
	personalities = list("cautious" = 1)
	roles = list("engineer" = 1)
	size_min = 2
	size_max = 3
	zones = list(/area/strata/interior/outpost/engi = 2, /area/strata/interior/generator_substation = 1)
	behavior = HAI_POP_LOITER
	marine_attitude = "wary"

/// LV-624: the Lazarus Landing colony with its staff, security, goons and a crashed CLF cell
/datum/npc_population_profile/lv624
	map_name = "LV-624"
	group_types = list(
		/datum/npc_population_group/lv624/colonists,
		/datum/npc_population_group/lv624/staff,
		/datum/npc_population_group/lv624/security,
		/datum/npc_population_group/lv624/goons,
		/datum/npc_population_group/lv624/clf,
	)

/datum/npc_population_group/lv624/colonists
	id = "lv_colonists"
	name = "Colonists and workers"
	presets = list(/datum/equipment_preset/survivor/civilian = 4, /datum/equipment_preset/survivor/trucker/lv = 1, /datum/equipment_preset/survivor/engineer/lv = 1)
	personalities = list("skittish" = 3, "friendly" = 3)
	roles = list("civilian" = 1)
	size_min = 5
	size_max = 10
	size_per_player = 0.1
	zones = list(/area/lv624/lazarus/main_hall = 2, /area/lv624/lazarus/canteen = 2, /area/lv624/lazarus/kitchen = 1, /area/lv624/lazarus/hydroponics = 1, /area/lv624/lazarus/fitness = 1, /area/lv624/lazarus/sleep_male = 1, /area/lv624/lazarus/sleep_female = 1)
	behavior = HAI_POP_LOITER
	marine_attitude = "friendly"
	reaction = "cower"

/datum/npc_population_group/lv624/staff
	id = "lv_staff"
	name = "Scientists, doctors and clergy"
	presets = list(/datum/equipment_preset/survivor/scientist/lv = 2, /datum/equipment_preset/survivor/doctor/lv = 2, /datum/equipment_preset/survivor/chaplain/lv = 1, /datum/equipment_preset/survivor/corporate/lv = 1)
	personalities = list("skittish" = 2, "cautious" = 2)
	roles = list("civilian" = 2, "medic" = 1)
	size_min = 3
	size_max = 6
	size_per_player = 0.05
	zones = list(/area/lv624/lazarus/research = 2, /area/lv624/lazarus/medbay = 2, /area/lv624/lazarus/chapel = 1, /area/lv624/lazarus/robotics = 1)
	behavior = HAI_POP_LOITER
	marine_attitude = "friendly"
	reaction = "cower"

/datum/npc_population_group/lv624/security
	id = "lv_security"
	name = "Colony security and marshals"
	presets = list(/datum/equipment_preset/survivor/security/lv = 3, /datum/equipment_preset/survivor/colonial_marshal/lv = 1)
	personalities = list("professional" = 3, "cautious" = 1)
	roles = list("security" = 1)
	size_min = 3
	size_max = 5
	size_per_player = 0.05
	squad_size = 3
	zones = list(/area/lv624/lazarus/security = 2, /area/lv624/lazarus/armory = 1)
	behavior = HAI_POP_GUARD
	marine_attitude = "friendly"

/datum/npc_population_group/lv624/goons
	id = "lv_goons"
	name = "Corporate goons"
	presets = list(/datum/equipment_preset/survivor/goon = 1)
	personalities = list("reckless" = 2, "ruthless" = 1, "veteran" = 1)
	roles = list("rifleman" = 1)
	size_min = 2
	size_max = 4
	size_per_player = 0.05
	squad_size = 4
	zones = list(/area/lv624/lazarus/comms = 1, /area/lv624/lazarus/secure_storage = 1)
	behavior = HAI_POP_GUARD
	marine_attitude = "hostile"

/datum/npc_population_group/lv624/clf
	id = "lv_clf"
	name = "Crashed CLF cell"
	presets = list(/datum/equipment_preset/survivor/clf = 1)
	personalities = list("zealot" = 2, "reckless" = 2)
	roles = list("rifleman" = 3, "medic" = 1)
	size_min = 2
	size_max = 4
	size_per_player = 0.05
	squad_size = 4
	zones = list(/area/lv624/lazarus/crashed_ship = 2, /area/lv624/lazarus/crashed_ship_containers = 1)
	behavior = HAI_POP_GUARD
	marine_attitude = "hostile"
	wound_min = 3
	wound_max = 10
