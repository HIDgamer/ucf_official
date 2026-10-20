/// The AI humans one admin session has selected in the NPC command panel
/datum/npc_command_selection
	var/list/mob/living/carbon/human/selected = list()

/// Whether the human is something the panel may command: alive, clientless and piloted by a running brain
/datum/npc_command_selection/proc/valid(mob/living/carbon/human/human)
	return istype(human) && !QDELETED(human) && human.stat != DEAD && !human.client && human.ai_brain && !human.ai_brain.stopped

/// The only way to read the selection, anything that stopped being commandable is dropped first
/datum/npc_command_selection/proc/get_selected()
	for(var/mob/living/carbon/human/human as anything in selected)
		if(!valid(human))
			selected -= human
	return selected.Copy()

/datum/npc_command_selection/proc/select(mob/living/carbon/human/human)
	if(!valid(human))
		return FALSE
	selected |= human
	return TRUE

/datum/npc_command_selection/proc/select_list(list/humans)
	var/count = 0
	for(var/mob/living/carbon/human/human as anything in humans)
		if(select(human))
			count++
	return count

/datum/npc_command_selection/proc/deselect(mob/living/carbon/human/human)
	selected -= human

/datum/npc_command_selection/proc/toggle(mob/living/carbon/human/human)
	if(human in selected)
		deselect(human)
		return FALSE
	return select(human)

/datum/npc_command_selection/proc/clear()
	selected = list()

/datum/npc_command_selection/proc/is_selected(mob/living/carbon/human/human)
	return human in selected

/datum/npc_command_selection/Destroy()
	selected = null
	return ..()
