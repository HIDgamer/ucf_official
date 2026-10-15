/obj/vehicle/multitile/apc/lav
	name = "\improper LAV-35 Light Armored Vehicle"
	desc = "A LAV-35 Light Armored Vehicle. An armored transport with eight big wheels and a 35mm autocannon. Entrances on the sides and back."

	icon = 'icons/obj/vehicles/lav.dmi'
	icon_state = "lav_base"
	pixel_x = -64
	pixel_y = -64

	bound_width = 64
	bound_height = 128

	bound_x = -32
	bound_y = -64

	health = 1100

	interior_map = /datum/map_template/interior/lav

	entrances = list(
		"left" = list(1, 0),
		"right" = list(-2, 0),
		"rear left" = list(0, 2),
		"rear right" = list(-1, 2),
		"rear center" = list(0, 2)
	)

	hardpoints_allowed = list(
		/obj/item/hardpoint/primary/lav_cannon,
		/obj/item/hardpoint/locomotion/lav_wheels,
	)

	seats = list(
		VEHICLE_DRIVER = null,
		VEHICLE_GUNNER = null,
	)

	active_hp = list(
		VEHICLE_DRIVER = null,
		VEHICLE_GUNNER = null,
	)

/obj/vehicle/multitile/apc/lav/add_seated_verbs(mob/living/M, seat)
	if(!M.client)
		return
	add_verb(M.client, list(
		/obj/vehicle/multitile/proc/get_status_info,
		/obj/vehicle/multitile/proc/open_controls_guide,
		/obj/vehicle/multitile/proc/name_vehicle
	))
	if(seat == VEHICLE_DRIVER)
		add_verb(M.client, list(
			/obj/vehicle/multitile/proc/toggle_door_lock,
			/obj/vehicle/multitile/proc/activate_horn
		))

/obj/vehicle/multitile/apc/lav/remove_seated_verbs(mob/living/M, seat)
	if(!M.client)
		return
	remove_verb(M.client, list(
		/obj/vehicle/multitile/proc/get_status_info,
		/obj/vehicle/multitile/proc/open_controls_guide,
		/obj/vehicle/multitile/proc/name_vehicle
	))
	SStgui.close_user_uis(M, src)
	if(seat == VEHICLE_DRIVER)
		remove_verb(M.client, list(
			/obj/vehicle/multitile/proc/toggle_door_lock,
			/obj/vehicle/multitile/proc/activate_horn
		))

/// Why the crewman cannot work the turret, or null if they can.
/obj/vehicle/multitile/apc/lav/proc/get_turret_block_reason(mob/crew)
	var/seat = get_mob_seat(crew)
	if(!seat)
		return "You are not at the controls."
	if(seat != VEHICLE_DRIVER)
		return null
	if(seats[VEHICLE_GUNNER])
		return "The gunner has control of the turret."
	if(!skillcheck(crew, SKILL_VEHICLE, SKILL_VEHICLE_CREWMAN))
		return "You have no idea how to operate the turret!"
	if(ishuman(crew))
		var/mob/living/carbon/human/human_crew = crew
		if(!human_crew.allow_gun_usage)
			return "You are unable to use heavy weaponry."
	return null

/obj/vehicle/multitile/apc/lav/get_mob_hp(mob/crew)
	if(get_turret_block_reason(crew))
		return null
	return locate(/obj/item/hardpoint/primary/lav_cannon) in hardpoints

/obj/vehicle/multitile/apc/lav/notify_no_hardpoint(mob/user)
	var/reason = get_turret_block_reason(user)
	if(!reason)
		reason = "The turret is not installed."
	to_chat(user, SPAN_WARNING(reason))

/obj/vehicle/multitile/apc/lav/set_seated_mob(seat, mob/living/M)
	. = ..()
	if(seat != VEHICLE_GUNNER || !M)
		return
	var/obj/item/hardpoint/turret = locate(/obj/item/hardpoint/primary/lav_cannon) in hardpoints
	if(turret)
		SEND_SIGNAL(turret, COMSIG_GUN_INTERRUPT_FIRE)

/obj/vehicle/multitile/apc/lav/initialize_cameras(change_tag = FALSE)
	if(!camera)
		camera = new /obj/structure/machinery/camera/vehicle(src)
	if(change_tag)
		camera.c_tag = "#[rand(1,100)] LAV-35 \"[nickname]\""
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior"
	else
		camera.c_tag = "#[rand(1,100)] LAV-35"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior"

/*
** PRESETS SPAWNERS
*/
/obj/effect/vehicle_spawner/lav
	name = "LAV Spawner"
	icon = 'icons/obj/vehicles/lav.dmi'
	icon_state = "lav_base"
	pixel_x = -64
	pixel_y = -64

/obj/effect/vehicle_spawner/lav/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/lav/spawn_vehicle()
	var/obj/vehicle/multitile/apc/lav/LAV = new (loc)

	load_misc(LAV)
	load_hardpoints(LAV)
	handle_direction(LAV)
	LAV.update_icon()

	return LAV

//PRESET: wheels installed
/obj/effect/vehicle_spawner/lav/plain/load_hardpoints(obj/vehicle/multitile/apc/lav/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/lav_wheels)

//PRESET: default hardpoints
/obj/effect/vehicle_spawner/lav/fixed/load_hardpoints(obj/vehicle/multitile/apc/lav/V)
	V.add_hardpoint(new /obj/item/hardpoint/primary/lav_cannon)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/lav_wheels)

//PRESET: default hardpoints, destroyed
/obj/effect/vehicle_spawner/lav/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/apc/lav/LAV = new (loc)

	load_misc(LAV)
	load_hardpoints(LAV)
	handle_direction(LAV)
	load_damage(LAV)
	LAV.update_icon()

	return LAV

/obj/effect/vehicle_spawner/lav/decrepit/load_hardpoints(obj/vehicle/multitile/apc/lav/V)
	V.add_hardpoint(new /obj/item/hardpoint/primary/lav_cannon)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/lav_wheels)
