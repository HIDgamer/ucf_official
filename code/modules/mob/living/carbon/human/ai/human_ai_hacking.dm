/// Whether this brain breaks into doors it has no access to, only the CLF do
/datum/human_ai_brain/proc/can_hack_doors()
	return body.faction == FACTION_CLF

/// Starts breaking into the door, true while the hack is under way
/datum/human_ai_brain/proc/start_hack(obj/structure/machinery/door/door, turf/next_turf)
	if(suppressed() || get_target())
		// Nobody works on a lock while being shot at, so the door counts as shut for now
		remember_blocked(next_turf, "no time to hack [door]", HAI_DETOUR_MEMORY)
		return FALSE
	acting_until = world.time + HAI_HACK_TIME + 3 SECONDS
	INVOKE_ASYNC(src, PROC_REF(hack_door), door)
	return TRUE

/**
 * Stands at the door and works at its panel until it gives. Anything that moves the body, hurts it or turns up an enemy stops the work
 * and the door is left alone for a while.
 */
/datum/human_ai_brain/proc/hack_door(obj/structure/machinery/door/door)
	var/turf/start = get_turf(body)
	body.face_atom(door)
	body.visible_message(SPAN_WARNING("[body] jams a bypass rig into [door]'s access panel!"), SPAN_NOTICE("You start bypassing [door]'s lock."))
	playsound(door, 'sound/effects/sparks2.ogg', 25, TRUE)
	var/finish = world.time + HAI_HACK_TIME
	while(world.time < finish)
		sleep(10)
		if(QDELETED(body) || QDELETED(door) || stopped || body.stat != CONSCIOUS || body.is_mob_incapacitated() || get_turf(body) != start || !body.Adjacent(door) || suppressed() || get_target())
			acting_until = 0
			if(!QDELETED(body) && !QDELETED(door))
				remember_blocked(get_turf(door), "the hack on [door] was interrupted", HAI_DETOUR_MEMORY)
			return
	acting_until = 0
	var/datum/effect_system/spark_spread/sparks = new
	sparks.set_up(4, 1, door)
	sparks.start()
	playsound(door, 'sound/effects/sparks4.ogg', 30, TRUE)
	door.open()
	hacks++
	log_decision("hacked [door] open")
	next_step_time = world.time + door.openspeed + 2
