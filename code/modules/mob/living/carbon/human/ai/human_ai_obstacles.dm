/// What a walker should do about this atom when it blocks a step, anything not classified is a wall
/atom/proc/human_ai_obstacle(mob/living/carbon/human/walker)
	return density ? HAI_OBS_BLOCKED : HAI_OBS_NONE

/obj/structure/human_ai_obstacle(mob/living/carbon/human/walker)
	if(!density)
		return HAI_OBS_NONE
	return climbable ? HAI_OBS_CLIMB : HAI_OBS_BLOCKED

/obj/structure/machinery/door/human_ai_obstacle(mob/living/carbon/human/walker)
	return density ? HAI_OBS_DOOR : HAI_OBS_NONE

/mob/living/human_ai_obstacle(mob/living/carbon/human/walker)
	return density ? HAI_OBS_MOB : HAI_OBS_NONE

/// First thing that stops the body stepping from here to next_turf, as list(kind, atom), null when nothing does
/datum/human_ai_brain/proc/find_obstacle(turf/here, turf/next_turf)
	if(next_turf.density)
		return list(HAI_OBS_BLOCKED, next_turf)
	var/direction = get_dir(here, next_turf)
	var/list/found
	for(var/atom/movable/blocker as anything in next_turf)
		if(blocker == body || !blocker.density || !blocker.BlockedPassDirs(body, direction))
			continue
		var/kind = blocker.human_ai_obstacle(body)
		if(kind == HAI_OBS_NONE)
			continue
		if(!found || kind == HAI_OBS_DOOR || (kind == HAI_OBS_CLIMB && found[1] == HAI_OBS_BLOCKED))
			found = list(kind, blocker)
	for(var/obj/structure/edge in here)
		if(!(edge.flags_atom & ON_BORDER) || !edge.density || !edge.BlockedExitDirs(body, direction))
			continue
		var/kind = edge.human_ai_obstacle(body)
		if(kind != HAI_OBS_NONE && (!found || kind == HAI_OBS_DOOR))
			found = list(kind, edge)
	return found

/datum/human_ai_brain/proc/remember_blocked(turf/blocked, reason)
	blocked_turfs[blocked] = world.time + HAI_BLOCK_MEMORY
	path = null
	next_path_request = 0
	log_decision("blocked at [blocked.x],[blocked.y]: [reason]")
	if(SSxeno_pathfinding?.available && xeno_pathfind_profiles_available())
		rust_xeno_pathfind_danger("[blocked.z],[blocked.x],[blocked.y],[HAI_BLOCK_DANGER],0")

/datum/human_ai_brain/proc/is_blocked_turf(turf/checked)
	var/until = blocked_turfs[checked]
	if(!until)
		return FALSE
	if(until < world.time)
		blocked_turfs -= checked
		return FALSE
	return TRUE

/// Does something about the obstacle, returns TRUE when the body is dealing with it and should keep waiting
/datum/human_ai_brain/proc/handle_obstacle(list/obstacle, turf/next_turf)
	var/atom/blocker = obstacle[2]
	switch(obstacle[1])
		if(HAI_OBS_DOOR)
			return handle_door(blocker, next_turf)
		if(HAI_OBS_CLIMB)
			return start_vault(blocker)
		if(HAI_OBS_MOB)
			next_step_time = world.time + 3
			return sidestep(get_dir(body, next_turf))
	remember_blocked(next_turf, "[blocker] in the way")
	return FALSE

/datum/human_ai_brain/proc/handle_door(obj/structure/machinery/door/door, turf/next_turf)
	if(!door.density)
		return TRUE
	if(door.operating)
		next_step_time = world.time + 4
		return TRUE
	var/obj/structure/machinery/door/airlock/airlock = door
	if(istype(airlock))
		if(airlock.locked || airlock.welded || airlock.isElectrified())
			remember_blocked(next_turf, "[door] is shut for good")
			return FALSE
		if(!airlock.arePowerSystemsOn())
			return start_pry(door, next_turf)
	if(!door.allowed(body))
		remember_blocked(next_turf, "no access to [door]")
		return FALSE
	door.open()
	next_step_time = world.time + door.openspeed + 2
	return TRUE

/datum/human_ai_brain/proc/find_crowbar()
	for(var/obj/item/tool/crowbar/crowbar in list(body.l_hand, body.r_hand, body.belt))
		return crowbar
	return null

/datum/human_ai_brain/proc/start_pry(obj/structure/machinery/door/door, turf/next_turf)
	var/obj/item/tool/crowbar/crowbar = find_crowbar()
	if(!crowbar)
		remember_blocked(next_turf, "[door] has no power and there is no crowbar")
		return FALSE
	acting_until = world.time + 15 SECONDS
	INVOKE_ASYNC(src, PROC_REF(pry_door), door, crowbar)
	return TRUE

/datum/human_ai_brain/proc/pry_door(obj/structure/machinery/door/door, obj/item/tool/crowbar/crowbar)
	if(!QDELETED(door) && !QDELETED(crowbar) && body)
		door.attackby(crowbar, body)
	acting_until = 0

/datum/human_ai_brain/proc/start_vault(obj/structure/structure)
	if(!structure.can_climb(body))
		remember_blocked(get_turf(structure), "cannot climb [structure]")
		return FALSE
	acting_until = world.time + 10 SECONDS
	INVOKE_ASYNC(src, PROC_REF(vault), structure)
	return TRUE

/datum/human_ai_brain/proc/vault(obj/structure/structure)
	if(!QDELETED(structure) && body)
		structure.do_climb(body)
	acting_until = 0
	if(body)
		next_step_time = world.time + body.movement_delay()
