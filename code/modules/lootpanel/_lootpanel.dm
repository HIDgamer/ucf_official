/// Lists the contents of a turf in a tgui window
/datum/lootpanel
	var/client/owner
	var/list/datum/search_object/contents = list()
	var/list/datum/search_object/to_image = list()
	var/turf/source_turf

/datum/lootpanel/New(client/owner)
	. = ..()
	src.owner = owner

/datum/lootpanel/Destroy(force)
	reset_contents()
	if(source_turf)
		UnregisterSignal(source_turf, COMSIG_TURF_ENTERED)
	owner = null
	source_turf = null
	return ..()

/datum/lootpanel/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "LootPanel")
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/lootpanel/ui_state(mob/user)
	return GLOB.always_state

/datum/lootpanel/ui_status(mob/user, datum/ui_state/state)
	if(!source_turf || get_dist(user, source_turf) > 1)
		return UI_CLOSE
	if(user.is_mob_incapacitated())
		return UI_UPDATE
	return UI_INTERACTIVE

/datum/lootpanel/ui_close(mob/user)
	if(source_turf)
		UnregisterSignal(source_turf, COMSIG_TURF_ENTERED)
	source_turf = null
	reset_contents()

/datum/lootpanel/ui_data(mob/user)
	var/list/data = list()
	data["contents"] = get_contents()
	data["searching"] = length(to_image)
	return data

/datum/lootpanel/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("grab")
			return grab(ui.user, params)
		if("refresh")
			populate_contents()
			return TRUE

/datum/lootpanel/proc/open(turf/tile)
	if(tile != source_turf)
		if(source_turf)
			UnregisterSignal(source_turf, COMSIG_TURF_ENTERED)
		RegisterSignal(tile, COMSIG_TURF_ENTERED, PROC_REF(on_source_turf_entered))

	source_turf = tile
	populate_contents()
	tgui_interact(owner.mob)

/datum/lootpanel/proc/get_contents()
	. = list()
	for(var/datum/search_object/index as anything in contents)
		. += list(list(
			"icon_state" = index.icon_state,
			"icon" = index.icon,
			"name" = index.name,
			"path" = index.path,
			"ref" = REF(index),
		))

/datum/lootpanel/proc/grab(mob/user, list/params)
	var/ref = params["ref"]
	if(isnull(ref))
		return FALSE

	var/datum/search_object/index = locate(ref) in contents
	var/atom/thing = index?.item
	if(QDELETED(index) || QDELETED(thing))
		return FALSE

	if(thing != source_turf && !(thing in source_turf.contents))
		qdel(index)
		return TRUE

	var/modifiers = ""
	for(var/modifier in list("alt", "ctrl", "middle", "shift", "right"))
		if(params[modifier])
			modifiers += "[modifier]=1;"

	user.do_click(thing, null, modifiers)
	return TRUE

/datum/lootpanel/proc/add_to_index(datum/search_object/index)
	RegisterSignal(index, COMSIG_PARENT_QDELETING, PROC_REF(on_searchable_deleted))
	if(isnull(index.icon))
		to_image += index

	contents += index

/datum/lootpanel/proc/populate_contents()
	if(length(contents))
		reset_contents()

	add_to_index(new /datum/search_object(owner, source_turf))
	for(var/atom/thing as anything in source_turf.contents)
		add_new_searchable(thing)

	queue_update()

/datum/lootpanel/proc/on_source_turf_entered(datum/source, atom/movable/arrived)
	SIGNAL_HANDLER

	addtimer(CALLBACK(src, PROC_REF(add_new_searchable), arrived, TRUE), 0)

/datum/lootpanel/proc/add_new_searchable(atom/movable/thing, from_signal)
	if(QDELETED(thing) || !owner?.mob)
		return
	if(thing.mouse_opacity == MOUSE_OPACITY_TRANSPARENT)
		return
	if(thing.invisibility > owner.mob.see_invisible)
		return
	if(from_signal && (!source_turf || !(thing in source_turf.contents)))
		return

	add_to_index(new /datum/search_object(owner, thing))
	if(from_signal)
		queue_update()

/datum/lootpanel/proc/queue_update()
	var/datum/tgui/window = SStgui.get_open_ui(owner.mob, src)
	window?.send_update()

	if(length(to_image))
		SSlooting.backlog += src

/datum/lootpanel/proc/reset_contents()
	for(var/datum/search_object/index as anything in contents)
		contents -= index
		to_image -= index

		if(QDELETED(index))
			continue

		UnregisterSignal(index, COMSIG_PARENT_QDELETING)
		qdel(index)

/datum/lootpanel/proc/on_searchable_deleted(datum/search_object/source)
	SIGNAL_HANDLER

	contents -= source
	to_image -= source

	var/datum/tgui/window = SStgui.get_open_ui(owner.mob, src)
	if(isnull(window))
		reset_contents()
		return

	if(isturf(source.item))
		populate_contents()
		return

	window.send_update()

/// Generates queued icons for the panel. Returns TRUE once the queue is empty
/datum/lootpanel/proc/process_images()
	for(var/datum/search_object/index as anything in to_image)
		to_image -= index

		if(QDELETED(index) || index.icon)
			continue

		index.generate_icon(owner)

		if(TICK_CHECK)
			break

	var/datum/tgui/window = SStgui.get_open_ui(owner.mob, src)
	if(isnull(window))
		reset_contents()
		return TRUE

	window.send_update()
	return !length(to_image)
