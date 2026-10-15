
// Called when the item is in the active hand, and clicked; alternately, there is an 'activate held object' verb or you can hit pagedown.
/obj/item/proc/attack_self(mob/user)
	SHOULD_CALL_PARENT(TRUE)
	SEND_SIGNAL(src, COMSIG_ITEM_ATTACK_SELF, user)
	SEND_SIGNAL(user, COMSIG_MOB_ITEM_ATTACK_SELF, src)

	if(flags_item & CAN_DIG_SHRAPNEL && ishuman(user))
		dig_out_shrapnel(user)

/// Called when the item is used with a right-click on something in reach, return SECONDARY_ATTACK_CANCEL to use the click up
/obj/item/proc/attack_secondary(atom/target, mob/user, list/mods)
	return SECONDARY_ATTACK_CONTINUE

/obj/item/weapon/attack_secondary(atom/target, mob/living/user, list/mods)
	if(!istype(user) || !user.can_shove_with_secondary_click(target))
		return SECONDARY_ATTACK_CONTINUE
	user.secondary_shove(target, mods)
	return SECONDARY_ATTACK_CANCEL

// No comment
/atom/proc/attackby(obj/item/W, mob/living/user, list/mods)
	if(SEND_SIGNAL(src, COMSIG_PARENT_ATTACKBY, W, user, mods) & COMPONENT_NO_AFTERATTACK)
		return TRUE
	SEND_SIGNAL(user, COMSIG_MOB_PARENT_ATTACKBY, src, W)
	return FALSE

/atom/movable/attackby(obj/item/W, mob/living/user)
	. = ..()
	if(W && !.)
		if(!(W.flags_item & NOBLUDGEON))
			visible_message(SPAN_DANGER("[src] has been hit by [user] with [W]."), null, null, 5, CHAT_TYPE_MELEE_HIT)
			user.animation_attack_on(src, used_item = W)
			if(!CONFIG_GET(flag/smooth_attack_animation))
				user.flick_attack_overlay(src, "punch")
			return ATTACKBY_HINT_UPDATE_NEXT_MOVE

/mob/living/attackby(obj/item/I, mob/user)
	/* Commented surgery code, proof of concept. Would need to tweak human attackby to prevent duplication; mob/living don't have separate limb objects.
	if((user.mob_flags & SURGERY_MODE_ON) && user.a_intent & (INTENT_HELP|INTENT_DISARM))
		safety = TRUE
		var/datum/surgery/current_surgery = active_surgeries[user.zone_selected]
		if(current_surgery)
			if(current_surgery.attempt_next_step(user, I))
				return TRUE
		else if(initiate_surgery_moment(I, src, null, user))
			return TRUE
	*/
	if(istype(I) && ismob(user))
		return I.attack(src, user)


// Proximity_flag is 1 if this afterattack was called on something adjacent, in your square, or on your person.
// Click parameters is the params string from byond Click() code, see that documentation.
/obj/item/proc/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	return FALSE


/// Plays the sound of the item hitting something, louder for harder hits and a generic thud if it has none of its own
/obj/item/proc/play_hit_sound()
	var/hit_sound = hitsound
	if(!hit_sound && force)
		hit_sound = "swing_hit"
	if(hit_sound)
		playsound(loc, hit_sound, clamp(15 + force * 0.75, 20, 55), 1)

/obj/item/proc/attack(mob/living/M, mob/living/user)
	if((flags_item & NOBLUDGEON) || (MODE_HAS_MODIFIER(/datum/gamemode_modifier/disable_attacking_corpses) && M.stat == DEAD && !user.get_target_lock(M.faction_group)))
		return FALSE

	if(SEND_SIGNAL(M, COMSIG_ITEM_ATTEMPT_ATTACK, user, src) & COMPONENT_CANCEL_ATTACK) //Sent by target mob.
		return FALSE

	if(SEND_SIGNAL(src, COMSIG_ITEM_ATTACK, user, M) & COMPONENT_CANCEL_ATTACK) //Sent by source item.
		return FALSE

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!H.melee_allowed)
			to_chat(H, SPAN_DANGER("You are currently unable to attack."))
			return FALSE

	var/showname = "."
	if(user)
		if(M == user)
			showname = " by themselves."
		else
			showname = " by [user]."
	if(!(user in viewers(M, null)))
		showname = "."

	if (user.a_intent == INTENT_HELP && ((user.client?.prefs && user.client?.prefs?.toggle_prefs & TOGGLE_HELP_INTENT_SAFETY) || (user.mob_flags & SURGERY_MODE_ON)))
		playsound(loc, 'sound/effects/pop.ogg', 25, 1)
		user.visible_message(SPAN_NOTICE("[M] has been poked with [src][showname]"),
			SPAN_NOTICE("You poke [M == user ? "yourself":M] with [src]."), null, 4)

		return FALSE

	/////////////////////////
	user.attack_log += "\[[time_stamp()]\]<font color='red'> Attacked [key_name(M)] with [name] (INTENT: [uppertext(intent_text(user.a_intent))]) (DAMTYE: [uppertext(damtype)])</font>"
	M.attack_log += "\[[time_stamp()]\]<font color='orange'> Attacked by  [key_name(user)] with [name] (INTENT: [uppertext(intent_text(user.a_intent))]) (DAMTYE: [uppertext(damtype)])</font>"
	msg_admin_attack("[key_name(user)] attacked [key_name(M)] with [name] (INTENT: [uppertext(intent_text(user.a_intent))]) (DAMTYE: [uppertext(damtype)]) in [get_area(src)] ([src.loc.x],[src.loc.y],[src.loc.z]).", src.loc.x, src.loc.y, src.loc.z)

	/////////////////////////

	add_fingerprint(user)

	var/power = force
	if(user.skills)
		power = floor(power * (1 + 0.25 * user.skills.get_skill_level(SKILL_MELEE_WEAPONS))) //25% bonus per melee level
	if(!ishuman(M))
		var/used_verb = "attacked"
		if(LAZYLEN(attack_verb))
			used_verb = pick(attack_verb)
		user.visible_message(SPAN_DANGER("[M] has been [used_verb] with [src][showname]."),
			SPAN_DANGER("You [used_verb] [M == user ? "yourself":M] with [src]."), null, 5, CHAT_TYPE_MELEE_HIT)

		user.animation_attack_on(M, used_item = src)
		if(!CONFIG_GET(flag/smooth_attack_animation))
			user.flick_attack_overlay(M, "punch")
		if(isxeno(M))
			var/mob/living/carbon/xenomorph/X = M
			power = armor_damage_reduction(GLOB.xeno_melee, power, X.armor_deflection + X.armor_deflection_buff - X.armor_deflection_debuff, 20, 0, 0, X.armor_integrity)

			if(X.melee_vulnerability_mult != 0)
				power *= X.melee_vulnerability_mult

			var/armor_punch = armor_break_calculation(GLOB.xeno_melee, power, X.armor_deflection + X.armor_deflection_buff - X.armor_deflection_debuff, 20, 0, 0, X.armor_integrity)
			X.apply_armorbreak(armor_punch)
		play_hit_sound()
		switch(damtype)
			if("brute")
				M.apply_damage(power,BRUTE)
			if("fire")
				M.apply_damage(power,BURN)
				to_chat(M, SPAN_WARNING("It burns!"))
		if(power > 5)
			animation_flash_color(M)
			if(power >= MELEE_HEAVY_HIT)
				shake_camera(M, 2, 1)
			M.last_damage_data = create_cause_data(initial(name), user)
			user.track_hit(initial(name))
			if(user.faction == M.faction)
				user.track_friendly_fire(initial(name))
		M.updatehealth()
	else
		var/mob/living/carbon/human/H = M
		var/hit = H.attacked_by(src, user)
		if(hit)
			play_hit_sound()
		return (hit|ATTACKBY_HINT_UPDATE_NEXT_MOVE)
	return (ATTACKBY_HINT_NO_AFTERATTACK|ATTACKBY_HINT_UPDATE_NEXT_MOVE)
