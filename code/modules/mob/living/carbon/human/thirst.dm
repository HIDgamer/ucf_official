/// Thirst effects and the stamina and thirst HUD refresh

/mob/living/carbon/human/proc/get_thirst_state()
	if(hydration < HYDRATION_VERYLOW)
		return THIRST_PARCHED
	if(hydration < HYDRATION_LOW)
		return THIRST_THIRSTY
	return THIRST_QUENCHED

/// Tells the human when they get thirstier or recover
/mob/living/carbon/human/proc/update_thirst_state()
	var/new_state = get_thirst_state()
	if(new_state == thirst_state)
		return
	var/old_state = thirst_state
	thirst_state = new_state
	if(new_state > old_state)
		to_chat(src, SPAN_WARNING(new_state == THIRST_PARCHED ? "Your mouth is parched, you need water." : "You are getting thirsty."))
	else if(new_state == THIRST_QUENCHED)
		to_chat(src, SPAN_NOTICE("You no longer feel thirsty."))

/mob/living/carbon/human/proc/update_stamina_hud()
	var/atom/movable/screen/stamina_bolt/bolt = hud_used?.stamina_icon
	if(!bolt)
		return
	var/energy = get_sprint_energy()
	bolt.update_state(energy / SPRINT_ENERGY_MAX, sprint_exhausted && energy < SPRINT_RESUME_ENERGY)

/mob/living/carbon/human/proc/update_thirst_hud()
	var/atom/movable/screen/thirst/bar = hud_used?.thirst_icon
	bar?.update_thirst(hydration, thirst_state == THIRST_PARCHED)
