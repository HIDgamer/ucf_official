/// Lightning bolt showing the sprint energy pool
/atom/movable/screen/stamina_bolt
	name = "stamina"
	icon = 'icons/mob/hud/bastion_screen_gen.dmi'
	icon_state = "stamina_full"

/atom/movable/screen/stamina_bolt/proc/update_state(energy_fraction, exhausted)
	var/new_state
	if(exhausted)
		new_state = "stamina_dead"
	else if(energy_fraction <= 0.2)
		new_state = "stamina_crit"
	else if(energy_fraction <= 0.4)
		new_state = "stamina_5"
	else if(energy_fraction <= 0.6)
		new_state = "stamina_4"
	else if(energy_fraction <= 0.7)
		new_state = "stamina_3"
	else if(energy_fraction <= 0.8)
		new_state = "stamina_2"
	else if(energy_fraction <= 0.9)
		new_state = "stamina_1"
	else
		new_state = "stamina_full"
	if(icon_state != new_state)
		icon_state = new_state

/// Vertical bar showing how hydrated the mob is, next to a bottle of water
/atom/movable/screen/thirst
	name = "thirst"
	icon = 'icons/mob/hud/bastion_screen_gen.dmi'
	icon_state = "hungerbar"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/image/drink_image
	var/atom/movable/screen/thirst_bar/thirst_bar
	var/parched = FALSE

/atom/movable/screen/thirst/Initialize(mapload, ...)
	. = ..()
	drink_image = image('icons/obj/items/food/drinkcans.dmi', icon_state = "wy_water", pixel_x = -5)
	drink_image.plane = plane
	drink_image.appearance_flags |= KEEP_APART
	drink_image.filters += filter(arglist(outline_filter(1, COLOR_BLACK, OUTLINE_SHARP)))
	underlays += drink_image
	thirst_bar = new
	vis_contents += thirst_bar

/atom/movable/screen/thirst/Destroy()
	vis_contents.Cut()
	QDEL_NULL(thirst_bar)
	drink_image = null
	return ..()

/atom/movable/screen/thirst/proc/update_thirst(hydration, now_parched)
	thirst_bar.update_fullness(hydration / HYDRATION_MAX)
	if(now_parched == parched)
		return
	parched = now_parched
	if(parched)
		add_filter("thirst_outline", 1, list("type" = "outline", "color" = "#FF0033", "alpha" = 0, "size" = 2))
		animate(get_filter("thirst_outline"), alpha = 200, time = 1.5 SECONDS, loop = -1)
		animate(alpha = 0, time = 1.5 SECONDS)
	else
		remove_filter("thirst_outline")

/atom/movable/screen/thirst_bar
	icon = 'icons/mob/hud/bastion_screen_gen.dmi'
	icon_state = "hungerbar_bar"
	vis_flags = VIS_INHERIT_ID | VIS_INHERIT_PLANE
	var/static/icon/bar_mask
	var/static/list/bar_gradient = list(
		0.0, "#FF0000",
		0.2, "#FF8000",
		0.4, "#f0f000",
		0.6, "#00FF00",
		0.8, "#46daff",
		1.0, "#2A72AA",
	)
	var/bar_offset
	var/last_band = -1

/atom/movable/screen/thirst_bar/Initialize(mapload, ...)
	. = ..()
	bar_mask ||= icon(icon, "hungerbar_mask")

/atom/movable/screen/thirst_bar/proc/update_fullness(new_fullness)
	new_fullness = round(clamp(new_fullness, 0, 1), 0.05)
	if(new_fullness == last_band)
		return
	last_band = new_fullness
	color = gradient(bar_gradient, new_fullness)
	var/old_offset = bar_offset
	bar_offset = clamp(-20 + (20 * new_fullness), -20, 0)
	if(old_offset == bar_offset)
		return
	if(isnull(old_offset))
		add_filter("thirst_bar_mask", 1, alpha_mask_filter(0, bar_offset, bar_mask))
	else
		transition_filter("thirst_bar_mask", list("y" = bar_offset), 0.5 SECONDS)

/datum/hud/human/proc/draw_needs(datum/custom_hud/ui_datum)
	stamina_icon = new /atom/movable/screen/stamina_bolt()
	stamina_icon.screen_loc = ui_datum.UI_STAMINA_LOC
	infodisplay += stamina_icon
	if(issynth(mymob))
		return
	thirst_icon = new /atom/movable/screen/thirst()
	thirst_icon.screen_loc = ui_datum.UI_THIRST_LOC
	infodisplay += thirst_icon
