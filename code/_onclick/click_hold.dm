/*
	The intent of this code isn't to delegate held clicks directly,
	but to provide a simpler interface for when held clicks occur.
*/

// This just checks if A is the click catcher (i.e. the user clicked a black tile on their screen), then updates A and B to be what's "under" the black tile
#define CONVERT_CLICK_CATCHER(A,B,C) if(istype(A,/atom/movable/screen/click_catcher)) { var/list/mods = params2list(params); var/turf/TU = params2turf(mods["screen-loc"], get_turf(eye), src); A = TU; B = TU; C = TRUE }

/client
	/// Whether or not the player is holding their mouse click
	var/holding_click = FALSE
	/// Means that there can only be one click per mousedown.
	var/ignore_next_click
	/// The history of all atoms that were hovered over while the mouse was depressed
	var/list/mouse_trace_history
	var/list/lmb_last_mousedown_mods
	/// What the mouse button went down on, kept to turn a drag that was not meant into a click
	var/datum/weakref/mouse_down_raw
	var/datum/weakref/mouse_down_atom
	var/mouse_down_control
	var/mouse_down_params
	var/datum/entity/clan_player/clan_info

/client/MouseDown(atom/A, turf/T, skin_ctl, params)
	ignore_next_click = FALSE
	mouse_down_atom = null
	mouse_down_raw = A ? WEAKREF(A) : null
	if(!A)
		return

	// If we're clicking on the black part of the screen
	var/click_catcher_click = FALSE
	CONVERT_CLICK_CATCHER(A, T, click_catcher_click)
	if(click_catcher_click)
		params += ";click_catcher=1"
	holding_click = TRUE
	mouse_down_atom = WEAKREF(A)
	mouse_down_control = skin_ctl
	mouse_down_params = params

	mouse_trace_history = null
	LAZYADD(mouse_trace_history, A)

	if(SEND_SIGNAL(mob, COMSIG_MOB_MOUSEDOWN, A, T, skin_ctl, params) & COMSIG_MOB_CLICK_CANCELED)
		return

	var/list/mods = params2list(params)
	if(mods["left"])
		SEND_SIGNAL(src, COMSIG_CLIENT_LMB_DOWN, A, mods)
		lmb_last_mousedown_mods = mods
	if(mods[RIGHT_CLICK])
		start_context_hold(mods)


/client/MouseUp(atom/A, turf/T, skin_ctl, params)
	if(!A)
		return

	var/click_catcher_click = FALSE
	CONVERT_CLICK_CATCHER(A, T, click_catcher_click)
	if(click_catcher_click)
		params += ";click_catcher=1"
	holding_click = FALSE

	if(context_menu_press)
		context_menu_press = FALSE
		context_release_until = world.time + 3
		if(istype(A, /atom/movable/screen/radial/slice))
			A.clicked(mob)
		return

	if(SEND_SIGNAL(mob, COMSIG_MOB_MOUSEUP, A, T, skin_ctl, params) & COMSIG_MOB_CLICK_CANCELED)
		return

	var/list/mods = params2list(params)
	if(mods["left"])
		SEND_SIGNAL(src, COMSIG_CLIENT_LMB_UP, A, params)

/client/MouseDrag(atom/src_obj, atom/over_obj, turf/src_loc, turf/over_loc, src_ctl, over_ctl, params)
	if(!over_obj)
		return

	var/click_catcher_click = FALSE
	CONVERT_CLICK_CATCHER(over_obj, over_loc, click_catcher_click)
	if(click_catcher_click)
		params += ";click_catcher=1"

	if(SEND_SIGNAL(mob, COMSIG_MOB_MOUSEDRAG, src_obj, over_obj, src_loc, over_loc, src_ctl, over_ctl, params) & COMSIG_MOB_CLICK_CANCELED)
		return

	var/list/mods = params2list(params)
	if(mods["left"])
		SEND_SIGNAL(src, COMSIG_CLIENT_LMB_DRAG, src_obj, over_obj, params)

	var/atom/last_atom = LAZYACCESS(mouse_trace_history, length(mouse_trace_history))
	if(over_obj == last_atom)
		return

	// Add the hovered atom to the trace
	LAZYADD(mouse_trace_history, over_obj)

/// Whether a drag that went down on this atom was meant as a click, in harm intent only a drag started with shift is a drag
/proc/drag_is_click(datum/src_object, datum/pressed_raw, mob/user, list/press_mods)
	if(!src_object || pressed_raw != src_object || istype(src_object, /atom/movable/screen))
		return FALSE
	if(user.a_intent != INTENT_HARM || HAS_TRAIT(user, TRAIT_OVERRIDE_CLICKDRAG) || isgun(user.get_active_hand()))
		return FALSE
	return !press_mods[SHIFT_CLICK] && (press_mods[LEFT_CLICK] || press_mods[RIGHT_CLICK] || press_mods[MIDDLE_CLICK])

/client/proc/drag_became_click(datum/src_object, src_location)
	var/datum/weakref/raw_ref = mouse_down_raw
	var/datum/weakref/atom_ref = mouse_down_atom
	mouse_down_raw = null
	mouse_down_atom = null
	var/atom/pressed = atom_ref?.resolve()
	if(!pressed || !drag_is_click(src_object, raw_ref?.resolve(), mob, params2list(mouse_down_params)))
		return FALSE
	Click(pressed, src_location, mouse_down_control, mouse_down_params)
	return TRUE

/client/MouseDrop(datum/src_object, datum/over_object, src_location, over_location, src_control, over_control, params)
	if(world.time <= context_release_until)
		return
	if(drag_became_click(src_object, src_location))
		return
	. = ..()
	if(over_object)
		SEND_SIGNAL(over_object, COMSIG_ATOM_DROPPED_ON, src_object, src)

	if(src_object)
		SEND_SIGNAL(src_object, COMSIG_ATOM_DROP_ON, over_object, src)
