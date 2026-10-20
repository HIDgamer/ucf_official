/// Ref of a patient to the brain that is treating them and until when, so two medics do not queue for one casualty
GLOBAL_LIST_EMPTY(human_ai_patient_claims)
/// Ref of a wounded body that called for a medic to when, where it stood and the faction it belongs to
GLOBAL_LIST_EMPTY(human_ai_medic_calls)

/// What a medical item does
/proc/human_ai_medical_kind(obj/item/thing)
	if(istype(thing, /obj/item/stack/medical))
		var/obj/item/stack/medical/pack = thing
		if(pack.alien || pack.amount <= 0)
			return null
		if(istype(pack, /obj/item/stack/medical/splint))
			return HAI_MED_SPLINT
		if(istype(pack, /obj/item/stack/medical/bruise_pack) || istype(pack, /obj/item/stack/medical/advanced/bruise_pack))
			return HAI_MED_BANDAGE
		if(istype(pack, /obj/item/stack/medical/ointment) || istype(pack, /obj/item/stack/medical/advanced/ointment))
			return HAI_MED_SALVE
	return null

/// Medical supplies in everything the body carries, kind to the list of packs, remembered for a few seconds
/datum/human_ai_brain/proc/medical_supplies()
	if(med_cache && world.time < med_cache_time + 50)
		return med_cache
	var/list/found = list(HAI_MED_BANDAGE = list(), HAI_MED_SALVE = list(), HAI_MED_SPLINT = list())
	for(var/obj/item/thing in body.get_contents())
		var/kind = human_ai_medical_kind(thing)
		if(kind)
			found[kind] += thing
	med_cache = found
	med_cache_time = world.time
	return found

/datum/human_ai_brain/proc/limb_needs_bandage(obj/limb/limb)
	for(var/datum/wound/wound as anything in limb.wounds)
		if(!wound.internal && wound.damage_type != BURN && !(wound.bandaged & WOUND_BANDAGED))
			return TRUE
	return FALSE

/datum/human_ai_brain/proc/limb_needs_salve(obj/limb/limb)
	for(var/datum/wound/wound as anything in limb.wounds)
		if(!wound.internal && wound.damage_type == BURN && !(wound.salved & WOUND_BANDAGED))
			return TRUE
	return FALSE

/// The treatment the patient needs most that the body has the supplies for, as list(kind, limb), null when there is none
/datum/human_ai_brain/proc/patient_need(mob/living/carbon/human/patient)
	var/list/supplies = medical_supplies()
	var/best_kind
	var/obj/limb/best_limb
	var/best_score = 0
	for(var/obj/limb/limb as anything in patient.limbs)
		if(limb.status & (LIMB_DESTROYED|LIMB_ROBOT|LIMB_SYNTHSKIN))
			continue
		var/score = 0
		var/kind
		if(length(supplies[HAI_MED_BANDAGE]) && limb_needs_bandage(limb))
			score = 45 + limb.brute_dam * 0.6
			kind = HAI_MED_BANDAGE
		if(length(supplies[HAI_MED_SALVE]) && limb_needs_salve(limb) && 25 + limb.burn_dam * 0.4 > score)
			score = 25 + limb.burn_dam * 0.4
			kind = HAI_MED_SALVE
		if(length(supplies[HAI_MED_SPLINT]) && (limb.status & LIMB_BROKEN) && !(limb.status & LIMB_SPLINTED) && (limb.name in list("l_arm", "r_arm", "l_leg", "r_leg", "chest", "head")) && 35 + limb.brute_dam > score)
			score = 35 + limb.brute_dam
			kind = HAI_MED_SPLINT
		if(kind && score > best_score)
			best_score = score
			best_kind = kind
			best_limb = limb
	if(!best_kind)
		return null
	return list(best_kind, best_limb)

/// Whether the medic would treat this human at all: its own side, or anyone wounded when it is the helping kind
/datum/human_ai_brain/proc/will_treat(mob/living/carbon/human/other)
	if(other.stat == DEAD || other == body && intent == HAI_INTENT_ENGAGE)
		return FALSE
	var/disposition = get_disposition(other)
	if(disposition <= HAI_DISP_FRIEND)
		return TRUE
	return disposition == HAI_DISP_NEUTRAL && personality.trait("mercy") >= 50 && personality.trait("sociability") >= 50

/// The wounded human in reach that most needs the medic, nobody else is already on
/datum/human_ai_brain/proc/find_patient()
	if(world.time < next_patient_search)
		var/mob/living/carbon/human/kept = patient_ref?.resolve()
		return (kept && !QDELETED(kept) && kept.stat != DEAD) ? kept : null
	next_patient_search = world.time + HAI_PATIENT_SEARCH_INTERVAL
	var/mob/living/carbon/human/best
	var/best_score = 0
	for(var/mob/living/carbon/human/other in view(HAI_MEDIC_RANGE, body))
		if(!will_treat(other))
			continue
		var/list/datum/claim = GLOB.human_ai_patient_claims[REF(other)]
		if(claim && claim[1] != src && claim[2] > world.time && !QDELETED(claim[1]))
			continue
		var/list/need = patient_need(other)
		if(!need)
			continue
		var/health_fraction = clamp(other.health / max(other.maxHealth, 1), 0, 1)
		var/score = (1 - health_fraction) * 100 + (other.stat != CONSCIOUS ? 50 : 0) - get_dist(body, other) * 3 + (other == body ? -20 : 0)
		if(score > best_score)
			best_score = score
			best = other
	if(!best)
		patient_ref = null
		return null
	patient_ref = WEAKREF(best)
	GLOB.human_ai_patient_claims[REF(best)] = list(src, world.time + HAI_PATIENT_CLAIM_TIME)
	return best

/// Puts a medical item in the active hand, setting a two handed gun aside, true when it is there
/datum/human_ai_brain/proc/hand_item(obj/item/item)
	if(item == body.get_active_hand())
		return TRUE
	var/obj/item/weapon/gun/gun = peek_gun()
	if(gun && (gun.flags_item & WIELDED))
		gun.unwield(body)
	for(var/obj/item/held in list(body.get_active_hand(), body.get_inactive_hand()))
		if(held != item && !istype(held, /obj/item/weapon/gun) && !(held.flags_item & (NODROP|ITEM_ABSTRACT)))
			stow_item(held)
	if(body.get_active_hand() && body.get_inactive_hand() && item != body.get_inactive_hand() && !clear_hand(body.get_inactive_hand()))
		return FALSE
	take_out_of_holder(item)
	if(!body.put_in_hands(item, FALSE))
		stow_item(item)
		return FALSE
	if(item == body.get_inactive_hand())
		body.swap_hand()
	return item == body.get_active_hand()

/// Applies the treatment the patient needs most, true while it works on them
/datum/human_ai_brain/proc/treat(mob/living/carbon/human/patient)
	if(is_acting())
		return TRUE
	var/list/need = patient_need(patient)
	if(!need)
		return FALSE
	if(body.pulling)
		body.stop_pulling()
	var/obj/limb/limb = need[2]
	var/list/packs = medical_supplies()[need[1]]
	var/obj/item/stack/medical/pack
	for(var/obj/item/stack/medical/candidate as anything in packs)
		if(!QDELETED(candidate) && candidate.amount > 0)
			pack = candidate
			break
	if(!pack)
		return FALSE
	if(!hand_item(pack))
		return FALSE
	body.zone_selected = limb.name
	body.face_atom(patient)
	acting_until = world.time + ((need[1] == HAI_MED_SPLINT) ? HAI_SPLINT_TIME : HAI_TREAT_TIME)
	med_cache_time = 0
	utility_ref = WEAKREF(pack)
	INVOKE_ASYNC(pack, TYPE_PROC_REF(/obj/item/stack/medical, attack), patient, body)
	treatments++
	log_decision("treating [limb.name] of [patient] with [pack] ([pack.amount] left), hands [body.get_active_hand()] and [body.get_inactive_hand()]")
	if(patient != body)
		GLOB.human_ai_patient_claims[REF(patient)] = list(src, world.time + HAI_PATIENT_CLAIM_TIME)
	return TRUE

/// Puts away what the hands were using once the work is done
/datum/human_ai_brain/proc/tidy_hands()
	if(!utility_ref || is_acting())
		return
	var/obj/item/used = utility_ref.resolve()
	utility_ref = null
	if(used && !QDELETED(used) && used.loc == body)
		log_decision("put away [used]: [stow_item(used)]")
	for(var/obj/item/held in list(body.get_active_hand(), body.get_inactive_hand()))
		if(istype(held, /obj/item/stack/medical) || istype(held, /obj/item/restraint))
			log_decision("put away [held]: [stow_item(held)]")

/// Where a recent call for a medic came from, the nearest one of this side within reach
/datum/human_ai_brain/proc/medic_call_turf()
	var/turf/best
	var/best_distance = HAI_MEDIC_CALL_RANGE + 1
	for(var/key in GLOB.human_ai_medic_calls)
		var/list/call_info = GLOB.human_ai_medic_calls[key]
		if(world.time > call_info[1] + HAI_MEDIC_CALL_MEMORY)
			GLOB.human_ai_medic_calls -= key
			continue
		var/turf/where = call_info[2]
		if(!where || where.z != body.z || call_info[3] != body.faction || key == REF(body))
			continue
		var/distance = get_dist(body, where)
		if(distance < best_distance)
			best_distance = distance
			best = where
	return best

/datum/human_ai_brain/proc/is_medic()
	return role?.id == "medic"

/datum/human_ai_action/treat_patient
	id = "treat_patient"
	conflicts = HAI_LIMB_HANDS|HAI_LIMB_LEGS
	intents = list(HAI_INTENT_IDLE, HAI_INTENT_ALERT, HAI_INTENT_ENGAGE, HAI_INTENT_ORDERED, HAI_INTENT_HOLD)

/datum/human_ai_action/treat_patient/get_weight(datum/human_ai_brain/brain)
	if(!brain.is_medic() || brain.reload_phase != HAI_RELOAD_NONE)
		return 0
	var/mob/living/carbon/human/patient = brain.find_patient()
	if(!patient)
		return 0
	var/triage = world.time < brain.triage_until
	if(brain.suppressed() && !triage && patient.stat == CONSCIOUS)
		return 0
	if(patient.stat != CONSCIOUS || patient.health < patient.maxHealth * 0.4 || triage)
		return 92
	return brain.get_target() ? 45 : 70

/datum/human_ai_action/treat_patient/trigger(datum/human_ai_brain/brain)
	var/mob/living/carbon/human/patient = brain.find_patient()
	if(!patient)
		return FALSE
	if(get_dist(brain.body, patient) > 1)
		return brain.move_to(patient, 1, get_dist(brain.body, patient) > HAI_SPRINT_MIN_DISTANCE)
	if(brain.treat(patient))
		brain.treated_patients[REF(patient)] = TRUE
		return TRUE
	brain.next_patient_search = 0
	return FALSE

/// A medic with nobody visible to treat goes to where a wounded friend called from
/datum/human_ai_action/answer_medic_call
	id = "answer_medic_call"
	conflicts = HAI_LIMB_LEGS
	intents = list(HAI_INTENT_IDLE, HAI_INTENT_ALERT, HAI_INTENT_ORDERED)

/datum/human_ai_action/answer_medic_call/get_weight(datum/human_ai_brain/brain)
	if(!brain.is_medic() || brain.find_patient())
		return 0
	return brain.medic_call_turf() ? 40 : 0

/datum/human_ai_action/answer_medic_call/trigger(datum/human_ai_brain/brain)
	var/turf/where = brain.medic_call_turf()
	if(!where)
		return FALSE
	return brain.move_to(where, 2, get_dist(brain.body, where) > HAI_SPRINT_MIN_DISTANCE)

/// A medic that has nobody else to look after bandages itself
/datum/human_ai_action/self_care
	id = "self_care"
	conflicts = HAI_LIMB_HANDS
	intents = list(HAI_INTENT_IDLE, HAI_INTENT_ALERT)

/datum/human_ai_action/self_care/get_weight(datum/human_ai_brain/brain)
	if(!brain.is_medic() || brain.is_acting() || brain.get_target())
		return 0
	return brain.patient_need(brain.body) ? 30 : 0

/datum/human_ai_action/self_care/trigger(datum/human_ai_brain/brain)
	return brain.treat(brain.body)

/// Pulls a casualty out of the line of fire to the nearest cover
/datum/human_ai_action/drag_casualty
	id = "drag_casualty"
	conflicts = HAI_LIMB_HANDS|HAI_LIMB_LEGS
	intents = list(HAI_INTENT_ENGAGE, HAI_INTENT_ALERT, HAI_INTENT_ORDERED)

/datum/human_ai_action/drag_casualty/get_weight(datum/human_ai_brain/brain)
	if(!brain.is_medic() || !brain.suppressed())
		return 0
	var/mob/living/carbon/human/patient = brain.drag_patient()
	if(!patient || get_dist(brain.body, patient) > 2)
		return 0
	var/turf/threat = brain.threat_turf()
	if(!threat)
		return 0
	if(brain.cover_against(get_turf(patient), threat) >= HAI_COVER_MIN_SCORE)
		if(brain.body.pulling == patient)
			brain.body.stop_pulling()
		return 0
	return brain.drag_goal(patient, threat) ? 94 : 0

/datum/human_ai_action/drag_casualty/trigger(datum/human_ai_brain/brain)
	var/mob/living/carbon/human/patient = brain.drag_patient()
	var/turf/threat = brain.threat_turf()
	if(!patient || !threat)
		return FALSE
	var/turf/goal = brain.drag_goal(patient, threat)
	if(!goal)
		return FALSE
	if(brain.body.pulling != patient)
		if(!brain.body.Adjacent(patient))
			return brain.move_to(patient, 1, FALSE)
		if(!brain.start_drag(patient))
			return FALSE
		brain.dragged++
	var/turf/beyond = get_step(goal, get_dir(get_turf(patient), goal))
	return brain.move_to((beyond && brain.cover_turf_usable(beyond)) ? beyond : goal, 0, FALSE)

/// Takes hold of a downed man to pull, start_pulling() needs a client so the pull is started directly
/datum/human_ai_brain/proc/start_drag(mob/living/carbon/human/patient)
	if(patient.anchored || patient.throwing || body.is_mob_incapacitated())
		return FALSE
	if(!patient.can_be_pulled_by(body) || !patient.pull_response(body))
		return FALSE
	if(!QDELETED(patient.pulledby))
		patient.pulledby.stop_pulling()
	body.do_pull(patient)
	return body.pulling == patient

/// The downed man a medic is pulling or has in reach
/datum/human_ai_brain/proc/drag_patient()
	var/mob/living/carbon/human/pulled = body.pulling
	if(istype(pulled) && pulled.stat != CONSCIOUS)
		return pulled
	var/mob/living/carbon/human/patient = find_patient()
	return (patient && patient.stat != CONSCIOUS) ? patient : null

/// The closest turf to the casualty that shields against the threat and is free to stand on
/datum/human_ai_brain/proc/drag_goal(mob/living/carbon/human/patient, turf/threat)
	if(drag_goal_turf && world.time < next_drag_search)
		return drag_goal_turf
	next_drag_search = world.time + HAI_DRAG_SEARCH_INTERVAL
	drag_goal_turf = null
	var/turf/from = get_turf(patient)
	var/best_distance = INFINITY
	for(var/turf/candidate in range(HAI_DRAG_SEARCH_RADIUS, from))
		var/distance = get_dist(from, candidate)
		if(distance >= best_distance || !cover_turf_usable(candidate) || cover_against(candidate, threat) < HAI_COVER_MIN_SCORE)
			continue
		best_distance = distance
		drag_goal_turf = candidate
	return drag_goal_turf

/datum/npc_order/triage/begin(datum/human_ai_brain/performer)
	..()
	performer.triage_until = world.time + (duration || HAI_TRIAGE_TIME)

/datum/npc_order/triage/tick(datum/human_ai_brain/performer)
	if(performer.find_patient())
		wait_until = world.time + 50
		return FALSE
	if(world.time > wait_until + 20 && world.time > started_at + 30)
		performer.triage_until = 0
		finish(HAI_ORDER_DONE)
	return FALSE
