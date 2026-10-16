/// Starts holding the target at gunpoint with the gun in the active hand
/mob/living/carbon/human/proc/hold_up(mob/living/carbon/human/target)
	var/obj/item/weapon/gun/weapon = get_active_hand()
	if(!istype(weapon) || !istype(target) || target == src || target.stat == DEAD || is_mob_incapacitated())
		return
	if(GetComponent(/datum/component/gunpoint))
		to_chat(src, SPAN_WARNING("You are already holding someone at gunpoint."))
		return
	if(get_dist(src, target) > 5 || !can_see(src, target, 5))
		to_chat(src, SPAN_WARNING("You need a clear view of [target] to hold them up."))
		return
	AddComponent(/datum/component/gunpoint, target, weapon)

/mob/living/carbon/human/proc/lower_aim()
	var/datum/component/gunpoint/aim = GetComponent(/datum/component/gunpoint)
	if(aim)
		qdel(aim)

/// Picks which actions of someone held at gunpoint make this human mag dump
/mob/living/carbon/human/proc/choose_gunpoint_triggers()
	var/list/options = list(
		"Moving" = GUNPOINT_TRIGGER_MOVE,
		"Drawing or using items" = GUNPOINT_TRIGGER_ITEMS,
		"Using the radio" = GUNPOINT_TRIGGER_COMMS,
	)
	var/list/labels = list()
	for(var/option in options)
		labels["[option]: [(gunpoint_triggers & options[option]) ? "on" : "off"]"] = options[option]
	var/picked = tgui_input_list(src, "Which actions of someone you hold at gunpoint make you open fire? Fire from their own gun always does.", "Gunpoint Triggers", labels)
	if(!picked)
		return
	gunpoint_triggers ^= labels[picked]
	to_chat(src, SPAN_NOTICE("Gunpoint triggers are now: [gunpoint_triggers & GUNPOINT_TRIGGER_MOVE ? "moving " : ""][gunpoint_triggers & GUNPOINT_TRIGGER_ITEMS ? "items " : ""][gunpoint_triggers & GUNPOINT_TRIGGER_COMMS ? "radio " : ""]. They apply the next time you hold someone up."))

/mob/living/carbon/human/verb/gunpoint_triggers_verb()
	set name = "Gunpoint Triggers"
	set category = "IC"

	choose_gunpoint_triggers()
