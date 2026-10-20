/// Nothing to do: look around, stroll near home, mutter something or chat with a neighbor
/datum/human_ai_action/idle_life
	id = "idle_life"
	conflicts = HAI_LIMB_LEGS
	intents = list(HAI_INTENT_IDLE)

/datum/human_ai_action/idle_life/get_weight(datum/human_ai_brain/brain)
	if(brain.current_order || brain.waypoint || brain.follow_ref || brain.surrendered || brain.broken_kind || brain.civilian_alarm())
		return 0
	if(brain.idle_goal)
		return 12
	return world.time >= brain.next_idle_time ? 9 : 0

/datum/human_ai_action/idle_life/trigger(datum/human_ai_brain/brain)
	return brain.idle_step()

/datum/human_ai_brain/proc/idle_step()
	if(idle_goal)
		if(move_to(idle_goal, 0, FALSE))
			return TRUE
		idle_goal = null
		next_idle_time = world.time + rand(HAI_IDLE_GAP_MIN, HAI_IDLE_GAP_MAX)
		return FALSE
	next_idle_time = world.time + rand(HAI_IDLE_GAP_MIN, HAI_IDLE_GAP_MAX)
	var/list/choices = list(
		"look" = 40,
		"wander" = round(15 + personality.trait("initiative") * 0.3),
		"talk" = round(personality.trait("chattiness") * 0.3),
		"chat" = round(personality.trait("sociability") * 0.3),
	)
	switch(pick_weight(choices))
		if("look")
			body.setDir(turn(body.dir, pick(45, -45, 90, -90)))
		if("wander")
			return start_wander()
		if("talk")
			express(HAI_EXPR_IDLE)
		if("chat")
			start_conversation()
	return FALSE

/// Picks a spot near home to walk to
/datum/human_ai_brain/proc/start_wander()
	var/turf/home = home_turf || get_turf(body)
	if(!home)
		return FALSE
	var/turf/pick_spot = locate(clamp(home.x + rand(-HAI_IDLE_WANDER_RADIUS, HAI_IDLE_WANDER_RADIUS), 1, world.maxx), clamp(home.y + rand(-HAI_IDLE_WANDER_RADIUS, HAI_IDLE_WANDER_RADIUS), 1, world.maxy), home.z)
	var/turf/goal = pick_spot ? open_turf_near(pick_spot) : null
	if(!goal || get_dist(goal, home) > HAI_IDLE_WANDER_RADIUS + 1)
		return FALSE
	idle_goal = goal
	idle_wanders++
	return TRUE

/// A conscious idle AI human of the same side close by
/datum/human_ai_brain/proc/find_convo_partner()
	for(var/mob/living/carbon/human/other in range(3, body))
		var/datum/human_ai_brain/partner = other.ai_brain
		if(!partner || partner == src || other.faction != body.faction || partner.intent != HAI_INTENT_IDLE || partner.current_order)
			continue
		if(partner.surrendered || partner.broken_kind || world.time < partner.next_convo_time || !partner.can_express())
			continue
		return partner
	return null

/datum/human_ai_brain/proc/start_conversation()
	if(world.time < next_convo_time)
		return FALSE
	var/datum/human_ai_brain/partner = find_convo_partner()
	if(!partner)
		return FALSE
	var/list/talk = get_human_ai_voice(body.faction).small_talk()
	if(!talk || !express_line(HAI_EXPR_CONVO, talk[1]))
		return FALSE
	next_convo_time = world.time + HAI_CONVO_GAP
	partner.next_convo_time = world.time + HAI_CONVO_GAP
	convos_started++
	body.face_atom(partner.body)
	partner.body.face_atom(body)
	addtimer(CALLBACK(partner, TYPE_PROC_REF(/datum/human_ai_brain, answer_conversation), talk[2]), rand(15, 30))
	return TRUE

/datum/human_ai_brain/proc/answer_conversation(line)
	if(stopped || QDELETED(body))
		return
	if(express_line(HAI_EXPR_CONVO, line))
		convo_answers++

/// Friendly types say hello to a stranger who comes close
/datum/human_ai_brain/proc/consider_greeting(mob/living/carbon/human/other)
	if(personality.trait("sociability") < 70 || get_dist(body, other) > 3)
		return
	var/key = REF(other)
	if(greeted[key] && world.time < greeted[key] + HAI_GREET_MEMORY)
		return
	if(express(HAI_EXPR_GREET))
		greeted[key] = world.time
		body.face_atom(other)
