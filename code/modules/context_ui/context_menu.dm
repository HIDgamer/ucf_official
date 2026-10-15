/client
	var/context_hold_serial = 0
	var/context_menu_press = FALSE
	var/context_release_until = 0

/// Starts timing how long the right button stays down
/client/proc/start_context_hold(list/mods)
	if(mods[SHIFT_CLICK] || mods[CTRL_CLICK] || mods[ALT_CLICK] || (prefs?.toggle_prefs & TOGGLE_CONTEXT_MENU_OFF))
		return
	context_hold_serial++
	addtimer(CALLBACK(src, PROC_REF(open_context_menu), context_hold_serial), CONTEXT_MENU_HOLD_TIME)

/client/proc/open_context_menu(serial)
	if(!holding_click || serial != context_hold_serial || !mob)
		return
	var/atom/target = mouse_down_atom?.resolve()
	if(!target || istype(target, /atom/movable/screen))
		return
	var/list/actions = target.get_context_actions(mob)
	if(!length(actions))
		return
	context_menu_press = TRUE
	ignore_next_click = TRUE
	INVOKE_ASYNC(src, PROC_REF(show_context_menu), target, actions)

/client/proc/show_context_menu(atom/target, list/actions)
	var/list/choices = list()
	for(var/action_name in actions)
		var/list/action = actions[action_name]
		choices[action_name] = image('icons/mob/radial_context.dmi', icon_state = action[1])
	var/choice = show_radial_menu(mob, target, choices, "context_[REF(src)]")
	if(!choice || QDELETED(target))
		return
	var/list/chosen = actions[choice]
	var/datum/callback/action_callback = chosen[2]
	action_callback.Invoke()

/// What the context menu offers on this atom, as action name = list(radial icon state, callback)
/atom/proc/get_context_actions(mob/user)
	. = list()
	.["Examine"] = list("radial_examine", CALLBACK(src, PROC_REF(shift_click), user))
	var/turf/tile = get_turf(src)
	if(tile && user.TurfAdjacent(tile) && length(tile.contents))
		.["Tile contents"] = list("radial_lookat", CALLBACK(src, PROC_REF(alt_click), user))

/atom/movable/get_context_actions(mob/user)
	. = ..()
	if(src == user || anchored || !Adjacent(user))
		return
	.[user.pulling == src ? "Stop pulling" : "Pull"] = list("radial_pull", CALLBACK(src, PROC_REF(context_pull), user))

/atom/movable/proc/context_pull(mob/user)
	if(user.pulling == src)
		user.stop_pulling()
	else if(Adjacent(user))
		user.start_pulling(src)

/obj/item/get_context_actions(mob/user)
	. = ..()
	if(loc == user)
		.["Use"] = list("radial_use", CALLBACK(src, PROC_REF(attack_self), user))
		.["Drop"] = list("radial_drop", CALLBACK(src, PROC_REF(context_drop), user))
	else if(isturf(loc) && Adjacent(user) && ishuman(user))
		.["Pick up"] = list("radial_pickup", CALLBACK(src, TYPE_PROC_REF(/atom, attack_hand), user))

/obj/item/proc/context_drop(mob/user)
	if(loc == user)
		user.drop_inv_item_on_ground(src)

/mob/living/get_context_actions(mob/user)
	. = ..()
	if(src == user)
		return
	var/mob/living/living_user = user
	if(!istype(living_user) || !Adjacent(user))
		return
	if(living_user.can_shove_with_secondary_click(src))
		.["Shove"] = list("radial_point", CALLBACK(src, PROC_REF(context_shove), user))
	if(ishuman(src) && user.client)
		.["Strip"] = list("radial_examine2", CALLBACK(src, PROC_REF(context_strip), user))

/mob/living/proc/context_shove(mob/living/user)
	if(user.next_move > world.time || !Adjacent(user))
		return
	user.next_move = world.time
	user.secondary_shove(src, list())

/mob/living/proc/context_strip(mob/user)
	if(user.client && Adjacent(user))
		SEND_SIGNAL(src, COMSIG_ATOM_DROP_ON, user, user.client)

/mob/living/carbon/human/get_context_actions(mob/user)
	. = ..()
	if(src == user)
		.["Check injuries"] = list("radial_examine2", CALLBACK(src, PROC_REF(check_for_injuries)))

/obj/item/modular_computer/get_context_actions(mob/user)
	. = ..()
	if(computer_id_slot && loc == user)
		.["Eject ID"] = list("radial_eject", CALLBACK(src, PROC_REF(remove_id), user))
