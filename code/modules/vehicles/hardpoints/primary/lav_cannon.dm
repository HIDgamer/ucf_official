/obj/item/hardpoint/primary/lav_cannon
	name = "\improper LAV-35 Autocannon"
	desc = "A primary 35mm autocannon turret for the LAV that turns to wherever its operator aims. Loaded with either IFF-compatible APHE rounds or HE airburst shells."
	icon = 'icons/obj/vehicles/hardpoints/lav.dmi'

	icon_state = "turret"
	disp_icon = "lav"
	disp_icon_state = "turret"
	activation_sounds = list('sound/weapons/vehicles/autocannon_fire.ogg')

	damage_multiplier = 0.2

	health = 500

	origins = list(0, 0)

	ammo = new /obj/item/ammo_magazine/hardpoint/lav_cannon
	max_clips = 2

	use_muzzle_flash = TRUE

	scatter = 1
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	fire_delay = 0.3 SECONDS

	/// Whether the turret keeps its last aim when the hull turns.
	var/aimed = FALSE

	/// Pixel shift of the turret overlay by hull dir, then turret dir, keeping it on the hull's turret ring.
	var/list/turret_shifts = list(
		"2" = list("2" = list(0, 0), "1" = list(0, 32), "4" = list(16, 4), "8" = list(-16, 4)),
		"1" = list("2" = list(0, -32), "1" = list(0, 0), "4" = list(16, -29), "8" = list(-16, -29)),
		"4" = list("2" = list(-16, -4), "1" = list(-16, 29), "4" = list(0, 0), "8" = list(-31, 0)),
		"8" = list("2" = list(16, -4), "1" = list(16, 29), "4" = list(31, 0), "8" = list(0, 0))
	)

	/// Barrel tip by turret dir, in pixels from the turret ring of a hull facing the same way.
	var/list/turret_tips = list(
		"2" = list(0, -40),
		"1" = list(0, 39),
		"4" = list(40, 13),
		"8" = list(-41, 13)
	)

/obj/item/hardpoint/primary/lav_cannon/set_bullet_traits()
	..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_iff)
	))

/obj/item/hardpoint/primary/lav_cannon/accepts_magazine(obj/item/ammo_magazine/magazine)
	return istype(magazine, /obj/item/ammo_magazine/hardpoint/lav_cannon)

/// The crewman working the turret, the gunner if there is one.
/obj/item/hardpoint/primary/lav_cannon/proc/get_operator()
	if(!owner)
		return null
	return owner.get_seat_mob(VEHICLE_GUNNER) || owner.get_seat_mob(VEHICLE_DRIVER)

/obj/item/hardpoint/primary/lav_cannon/fire_wrapper(atom/target, mob/living/user, params)
	return ..(target, user || get_operator(), params)

/obj/item/hardpoint/primary/lav_cannon/display_ammo(mob/user)
	return ..(user || get_operator())

/obj/item/hardpoint/primary/lav_cannon/set_target(atom/object)
	. = ..()
	aim_at(target)

/obj/item/hardpoint/primary/lav_cannon/handle_fire(atom/target, mob/living/user, params)
	aim_at(target)
	return ..()

/// Turns the turret to the cardinal closest to the direction of the target.
/obj/item/hardpoint/primary/lav_cannon/proc/aim_at(atom/aim_target)
	if(!owner || !aim_target)
		return
	var/turf/target_turf = get_turf(aim_target)
	var/turf/muzzle_turf = get_origin_turf()
	if(!target_turf || target_turf == muzzle_turf)
		return

	var/angle = Get_Angle(muzzle_turf, target_turf)
	var/new_dir = WEST
	if(angle >= 315 || angle < 45)
		new_dir = NORTH
	else if(angle < 135)
		new_dir = EAST
	else if(angle < 225)
		new_dir = SOUTH

	aimed = TRUE
	if(new_dir == dir)
		return
	setDir(new_dir)
	owner.update_icon()

/obj/item/hardpoint/primary/lav_cannon/rotate(deg)
	var/aim_dir = dir
	..()
	if(aimed)
		setDir(aim_dir)

/obj/item/hardpoint/primary/lav_cannon/on_uninstall(obj/vehicle/multitile/vehicle)
	. = ..()
	aimed = FALSE

/obj/item/hardpoint/primary/lav_cannon/proc/get_turret_shift()
	var/list/shifts_by_turret = turret_shifts["[owner ? owner.dir : dir]"]
	return shifts_by_turret["[dir]"]

/obj/item/hardpoint/primary/lav_cannon/get_hardpoint_image()
	var/list/shift = get_turret_shift()
	return get_icon_image(shift[1], shift[2], dir)

/obj/item/hardpoint/primary/lav_cannon/get_icon_image(x_offset, y_offset, new_dir)
	var/image/turret_image = ..()
	if(health <= initial(health))
		var/image/damage_overlay = image('icons/obj/vehicles/lav.dmi', icon_state = "damaged_turret", dir = new_dir)
		damage_overlay.alpha = 255 * (1 - (health / initial(health)))
		turret_image.overlays += damage_overlay
	return turret_image

/obj/item/hardpoint/primary/lav_cannon/muzzle_flash(angle)
	var/list/shift = get_turret_shift()
	var/list/tip = turret_tips["[dir]"]
	muzzle_flash_pos["[dir]"] = list(tip[1] + shift[1], tip[2] + shift[2] - 16)
	return ..()
