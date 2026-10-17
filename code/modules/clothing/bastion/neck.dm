/// The ornate coat, a Bastion neck item that here attaches over armor or is worn in the suit slot like the other Bastion jackets
/obj/item/clothing/accessory/poncho/bastion/linjacket
	name = "ornate coat"
	desc = "You'll hold this weight."
	icon = 'icons/obj/items/clothing/bastion/neck_map.dmi'
	icon_state = "/obj/item/clothing/neck/linjacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/bastion/neck.dmi',
	)
	item_state_slots = list(
		WEAR_JACKET = "linjacket",
	)
	var/coat_color = "#283c55"
	var/tassel_color = "#c4c36d"

/obj/item/clothing/accessory/poncho/bastion/linjacket/get_mob_overlay(mob/user_mob, slot, default_bodytype = "Default")
	if(!LAZYISIN(item_icons, slot))
		return ..()
	var/image/worn = new /image()
	worn.appearance_flags = RESET_COLOR
	worn.overlays += get_coat_layer(user_mob, slot, "linjacket", coat_color)
	worn.overlays += get_coat_layer(user_mob, slot, "tassle", tassel_color)
	return worn

/// One tinted layer of the worn sprite, offset for the wearer's species
/obj/item/clothing/accessory/poncho/bastion/linjacket/proc/get_coat_layer(mob/user_mob, slot, layer_state, layer_color)
	if(ishuman(user_mob))
		var/mob/living/carbon/human/user_human = user_mob
		return user_human.species.get_offset_overlay_image(FALSE, item_icons[slot], layer_state, layer_color, slot)
	return overlay_image(item_icons[slot], layer_state, layer_color, RESET_COLOR)
