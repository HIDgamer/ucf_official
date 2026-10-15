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
