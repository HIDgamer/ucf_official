/datum/reagents/vessel/New(maximum)
	if(!maximum)
		maximum = 1000
	..()

/// Injects all contents into an object
/datum/reagents/vessel/proc/inject_vessel(atom/target, interaction = NONE, reactions = TRUE, delay)
	if(interaction == INGEST && ismob(target))
		var/mob/drinker = target
		for(var/datum/reagent/reagent in reagent_list)
			drinker.hydration = min(HYDRATION_MAX, drinker.hydration + reagent.hydration_factor * reagent.volume)
		if(ishuman(drinker))
			var/mob/living/carbon/human/human_drinker = drinker
			human_drinker.update_thirst_hud()
	reaction(target, interaction, reactions)
	if(delay)
		sleep(delay)
	trans_to(target, total_volume)
	qdel(src)
