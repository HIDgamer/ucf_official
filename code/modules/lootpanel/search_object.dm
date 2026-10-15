/// Compact data for one entry in a loot panel
/datum/search_object
	var/atom/item
	var/icon
	var/icon_state
	var/name
	var/path

/datum/search_object/New(client/owner, atom/item)
	. = ..()

	src.item = item
	name = item.name
	if(isobj(item))
		path = item.type

	if(!isturf(item))
		RegisterSignal(item, list(COMSIG_ITEM_PICKUP, COMSIG_MOVABLE_MOVED, COMSIG_PARENT_QDELETING), PROC_REF(on_item_moved))

	if(ismob(item) || length(item.overlays) > 2 || !isfile(item.icon) || !length("[item.icon]"))
		return

	icon = "[item.icon]"
	icon_state = item.icon_state

/datum/search_object/Destroy(force)
	item = null
	icon = null
	return ..()

/// Renders the full flattened icon, used for entries a plain icon state can't represent
/datum/search_object/proc/generate_icon(client/owner)
	icon = icon2html(getFlatIcon(item), owner, sourceonly = TRUE)

/datum/search_object/proc/on_item_moved(atom/source)
	SIGNAL_HANDLER

	if(!QDELETED(src))
		qdel(src)
