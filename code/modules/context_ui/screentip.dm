/// Text at the top of the screen saying what clicking the hovered atom does
/atom/movable/screen/screentip
	name = "screentip"
	icon = 'icons/effects/effects.dmi'
	icon_state = "nothing"
	screen_loc = "TOP,LEFT"
	layer = ABOVE_HUD_LAYER
	plane = ABOVE_HUD_PLANE
	flags_atom = NOINTERACT
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	maptext_width = 640
	maptext_height = 40
	maptext_x = 8
	maptext_y = -8

/client
	var/atom/movable/screen/screentip/screentip

/client/proc/show_screentip(text)
	if(!screentip)
		screentip = new
		screen += screentip
	screentip.maptext = text

/client/proc/hide_screentip()
	if(screentip)
		screentip.maptext = null

/atom/MouseEntered(location, control, params)
	. = ..()
	var/mob/hovering = usr
	var/client/viewer = hovering?.client
	if(!viewer)
		return
	if(istype(src, /atom/movable/screen) || isturf(src) || !name || (viewer.prefs?.toggle_prefs & TOGGLE_SCREENTIPS_OFF))
		viewer.hide_screentip()
		return
	viewer.show_screentip(get_screentip(hovering))

/atom/MouseExited(location, control, params)
	. = ..()
	usr?.client?.hide_screentip()

/// The name and the clicks that do something, shown while the mouse is over the atom
/atom/proc/get_screentip(mob/user)
	var/list/hints = get_screentip_hints(user, user.get_active_hand())
	hints += "Shift: Examine"
	var/hint_text = hints.Join("  |  ")
	return MAPTEXT("<b>[name]</b><br>[hint_text]")

/atom/proc/get_screentip_hints(mob/user, obj/item/held)
	. = list()
	var/reach = src != user && Adjacent(user)
	if(isobj(src) && !istype(src, /obj/effect) && reach)
		. += held ? "LMB: Use [held.name]" : "LMB: Interact"
	var/atom/movable/mover = src
	if(istype(mover) && reach && !mover.anchored)
		. += "Ctrl: Pull"
	if(reach && !(client_context_menu_off(user)))
		. += "Hold RMB: Menu"

/obj/item/get_screentip_hints(mob/user, obj/item/held)
	. = list()
	var/reach = Adjacent(user)
	if(loc == user)
		. += "LMB: Take"
	else if(reach && isturf(loc))
		. += held ? "LMB: Use [held.name]" : "LMB: Pick up"
	if(ismovable(src) && reach && !anchored && isturf(loc))
		. += "Ctrl: Pull"
	if(reach && !client_context_menu_off(user))
		. += "Hold RMB: Menu"

/mob/living/get_screentip_hints(mob/user, obj/item/held)
	. = list()
	var/reach = src != user && Adjacent(user)
	if(reach)
		if(held && held.force && !(held.flags_item & NOBLUDGEON))
			. += "LMB: Attack"
		else if(held)
			. += "LMB: Use [held.name]"
		else
			switch(user.a_intent)
				if(INTENT_HELP)
					. += "LMB: Help"
				if(INTENT_DISARM)
					. += "LMB: Disarm"
				if(INTENT_GRAB)
					. += "LMB: Grab"
				if(INTENT_HARM)
					. += "LMB: Harm"
		var/mob/living/living_user = user
		if(istype(living_user) && living_user.can_shove_with_secondary_click(src) && (!held || istype(held, /obj/item/weapon)))
			. += "RMB: Shove"
		if(!client_context_menu_off(user))
			. += "Hold RMB: Menu"

/// Whether the user turned the hold menu off
/atom/proc/client_context_menu_off(mob/user)
	return user.client?.prefs?.toggle_prefs & TOGGLE_CONTEXT_MENU_OFF
