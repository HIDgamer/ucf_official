#define GUNPOINT_DELAY_STAGE_2 (2.5 SECONDS)
#define GUNPOINT_DELAY_STAGE_3 (7.5 SECONDS)
#define GUNPOINT_MULT_STAGE_1 1
#define GUNPOINT_MULT_STAGE_2 1.5
#define GUNPOINT_MULT_STAGE_3 2
/// Tiles the shooter can be from the target without losing the aim
#define GUNPOINT_RANGE 5
#define GUNPOINT_FLINCH_CHANCE 50

/// A shooter holding a human at gunpoint, the shot fires and hits harder when the target acts
/datum/component/gunpoint
	dupe_mode = COMPONENT_DUPE_UNIQUE

	var/mob/living/carbon/human/target
	var/obj/item/weapon/gun/weapon
	var/stage = 1
	var/damage_mult = GUNPOINT_MULT_STAGE_1
	var/point_of_no_return = FALSE

/datum/component/gunpoint/Initialize(mob/living/carbon/human/target, obj/item/weapon/gun/weapon)
	if(!ishuman(parent) || !istype(target) || !istype(weapon))
		return COMPONENT_INCOMPATIBLE
	src.target = target
	src.weapon = weapon
	var/mob/living/carbon/human/shooter = parent
	RegisterSignal(target, list(COMSIG_MOVABLE_MOVED, COMSIG_MOB_FIRED_GUN, COMSIG_MOB_ITEM_ATTACK_SELF), PROC_REF(target_acted))
	RegisterSignal(target, COMSIG_PARENT_QDELETING, PROC_REF(cancel))
	RegisterSignal(weapon, list(COMSIG_ITEM_DROPPED, COMSIG_ITEM_EQUIPPED), PROC_REF(cancel))
	shooter.visible_message(SPAN_DANGER("[shooter] aims [weapon] at [target]!"), SPAN_DANGER("You aim [weapon] at [target]!"))
	to_chat(target, SPAN_DANGER("[shooter] is holding you at gunpoint, don't move or act!"))
	if(target.client)
		playsound_client(target.client, 'sound/machines/chime.ogg', vol = 50)
	addtimer(CALLBACK(src, PROC_REF(update_stage), 2), GUNPOINT_DELAY_STAGE_2)

/datum/component/gunpoint/Destroy(force)
	if(target)
		UnregisterSignal(target, list(COMSIG_MOVABLE_MOVED, COMSIG_MOB_FIRED_GUN, COMSIG_MOB_ITEM_ATTACK_SELF, COMSIG_PARENT_QDELETING))
	if(weapon)
		UnregisterSignal(weapon, list(COMSIG_ITEM_DROPPED, COMSIG_ITEM_EQUIPPED, COMSIG_GUN_BEFORE_FIRE))
	target = null
	weapon = null
	return ..()

/datum/component/gunpoint/RegisterWithParent()
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(check_deescalate))
	RegisterSignal(parent, list(COMSIG_MOB_TAKE_DAMAGE, COMSIG_HUMAN_TAKE_DAMAGE), PROC_REF(flinch))

/datum/component/gunpoint/UnregisterFromParent()
	UnregisterSignal(parent, list(COMSIG_MOVABLE_MOVED, COMSIG_MOB_TAKE_DAMAGE, COMSIG_HUMAN_TAKE_DAMAGE))

/datum/component/gunpoint/proc/update_stage(new_stage)
	if(QDELETED(src) || check_deescalate())
		return
	stage = new_stage
	if(stage == 2)
		to_chat(parent, SPAN_DANGER("You steady [weapon] on [target]."))
		to_chat(target, SPAN_DANGER("[parent] has steadied [weapon] on you!"))
		damage_mult = GUNPOINT_MULT_STAGE_2
		addtimer(CALLBACK(src, PROC_REF(update_stage), 3), GUNPOINT_DELAY_STAGE_3)
	else if(stage == 3)
		to_chat(parent, SPAN_DANGER("You have fully steadied [weapon] on [target]."))
		to_chat(target, SPAN_DANGER("[parent] has fully steadied [weapon] on you!"))
		damage_mult = GUNPOINT_MULT_STAGE_3

/// Breaks the aim when the shooter can no longer keep the target in sight or in reach
/datum/component/gunpoint/proc/check_deescalate()
	SIGNAL_HANDLER
	var/mob/living/carbon/human/shooter = parent
	if(shooter.is_mob_incapacitated() || get_dist(shooter, target) > GUNPOINT_RANGE || !can_see(shooter, target, GUNPOINT_RANGE))
		cancel()
		return TRUE

/datum/component/gunpoint/proc/target_acted(datum/source, ...)
	SIGNAL_HANDLER
	if(length(args) >= 5 && args[5])
		return
	INVOKE_ASYNC(src, PROC_REF(fire_shot))

/datum/component/gunpoint/proc/fire_shot()
	if(point_of_no_return || QDELETED(src))
		return
	point_of_no_return = TRUE
	var/mob/living/carbon/human/shooter = parent
	RegisterSignal(weapon, COMSIG_GUN_BEFORE_FIRE, PROC_REF(boost_shot))
	addtimer(CALLBACK(src, PROC_REF(cancel_quietly)), 3 SECONDS)
	weapon.Fire(target, shooter, null, TRUE)

/datum/component/gunpoint/proc/boost_shot(obj/item/weapon/gun/source, obj/projectile/projectile_to_fire)
	SIGNAL_HANDLER
	projectile_to_fire.damage *= damage_mult
	UnregisterSignal(weapon, COMSIG_GUN_BEFORE_FIRE)
	qdel(src)

/datum/component/gunpoint/proc/cancel_quietly()
	if(!QDELETED(src))
		qdel(src)

/datum/component/gunpoint/proc/cancel()
	SIGNAL_HANDLER
	if(QDELETED(src))
		return
	if(!point_of_no_return && target && weapon)
		var/mob/living/carbon/human/shooter = parent
		shooter.visible_message(SPAN_DANGER("[shooter] breaks [shooter.p_their()] aim on [target]!"), SPAN_DANGER("You are no longer aiming [weapon] at [target]."))
	qdel(src)

/// A hit shooter may flinch and fire
/datum/component/gunpoint/proc/flinch(datum/source, list/damagedata, damagetype)
	SIGNAL_HANDLER
	if(!prob(GUNPOINT_FLINCH_CHANCE))
		return
	var/mob/living/carbon/human/shooter = parent
	shooter.visible_message(SPAN_DANGER("[shooter] flinches!"), SPAN_DANGER("You flinch!"))
	INVOKE_ASYNC(src, PROC_REF(fire_shot))

#undef GUNPOINT_DELAY_STAGE_2
#undef GUNPOINT_DELAY_STAGE_3
#undef GUNPOINT_MULT_STAGE_1
#undef GUNPOINT_MULT_STAGE_2
#undef GUNPOINT_MULT_STAGE_3
#undef GUNPOINT_RANGE
#undef GUNPOINT_FLINCH_CHANCE
