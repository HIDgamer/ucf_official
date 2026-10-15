//icarus AREAS--------------------------------------//

/area/icarus
	name = "Icarus Research Station"
	icon_state = "cliff_blocked"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY

//parent types

/area/icarus/indoors
	name = "Icarus - Indoors"
	icon_state = "cliff_blocked"
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV759_INDOORS
	ambience_exterior = AMBIENCE_HYBRISA_INTERIOR

/area/icarus/outdoors
	name = "Icarus - Outdoors"
	icon_state = "cliff_blocked"
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV759_OUTDOORS
	ambience_exterior = AMBIENCE_CITY
	soundscape_interval = 25

// Level 1

/area/icarus/outdoors/level_1/landing_zone
	name = "Landing Zone"
	icon_state = "landing_pad"
	is_resin_allowed = FALSE
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ
	linked_lz = DROPSHIP_LZ1

/area/icarus/outdoors/level_1/emergency_landing_pad
	name = "Emergency Landing Pad"
	icon_state = "landing_pad_ext"
	is_resin_allowed = FALSE
	is_landing_zone = TRUE
	minimap_color = MINIMAP_AREA_LZ
	linked_lz = DROPSHIP_LZ2

/area/icarus/indoors/level_1/west_wing
	name = "West Wing (Landing Zone)"
	icon_state = "hallC1"
	is_landing_zone = TRUE
	linked_lz = DROPSHIP_LZ1

/area/icarus/indoors/level_1/central_engineering_block
	name = "Central Engineering Block and Lab Entrance"
	icon_state = "engine"
	minimap_color = MINIMAP_AREA_ENGI

/area/icarus/indoors/level_1/east_wing
	name = "East Wing (Habitation Block)"
	icon_state = "crew_quarters"

/area/icarus/indoors/level_1/mess_hall
	name = "Mess Hall"
	icon_state = "cafeteria"

/area/icarus/indoors/level_1/cargo_bays
	name = "Cargo Bays"
	icon_state = "storage"
	minimap_color = MINIMAP_AREA_COLONY_SPACE_PORT

// Level 2

/area/icarus/indoors/level_2/general_corridors
	name = "Icarus Research Lab - General Corridors"
	icon_state = "hallC2"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/icarus/indoors/level_2/engineering_wing
	name = "Icarus Research Lab - Engineering Wing"
	icon_state = "engine_hallway"
	minimap_color = MINIMAP_AREA_ENGI

/area/icarus/indoors/level_2/hospital_wing
	name = "Hospital Wing"
	icon_state = "medbay"
	minimap_color = MINIMAP_AREA_MEDBAY

/area/icarus/indoors/level_2/lab_offices_lounge
	name = "Lab Offices and Employee Lounge"
	icon_state = "conference"

/area/icarus/indoors/level_2/chemistry_wing
	name = "Icarus Research Lab - Chemistry Wing"
	icon_state = "chem"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/icarus/indoors/level_2/xx121_research_wing
	name = "Icarus Research Lab - XX-121 Research Wing"
	icon_state = "xeno_lab"
	minimap_color = MINIMAP_AREA_RESEARCH

/area/icarus/indoors/level_2/specimen_containment_cells
	name = "Specimen Containment Cells"
	icon_state = "cells_med_n"
	minimap_color = MINIMAP_AREA_CELL_MED

/area/icarus/indoors/level_2/prime_containment_wing
	name = "Preliminary and Prime Specimen Containment Wing"
	icon_state = "cells_max_n"
	minimap_color = MINIMAP_AREA_CELL_MAX
