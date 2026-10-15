/obj/item/ammo_magazine/hardpoint/lav_cannon
	name = "LAV-35 35mm APHE Magazine"
	desc = "A magazine for the LAV-35 Autocannon filled with 35mm armor-piercing high-explosive rounds. Supports IFF."
	caliber = "35mm"
	icon_state = "ace_autocannon"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/USCM/vehicles.dmi'
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/bullet/tank/dualcannon/lav_aphe
	max_rounds = 50
	gun_type = /obj/item/hardpoint/primary/lav_cannon

/obj/item/ammo_magazine/hardpoint/lav_cannon/update_icon()
	if(current_rounds > 0)
		icon_state = "ace_autocannon"
	else
		icon_state = "ace_autocannon_empty"

/obj/item/ammo_magazine/hardpoint/lav_cannon/he_airburst
	name = "LAV-35 35mm HE Airburst Magazine"
	desc = "A magazine for the LAV-35 Autocannon filled with 35mm high-explosive airburst shells. Detonates where the shell lands, scattering shrapnel."
	default_ammo = /datum/ammo/bullet/tank/lav_he_airburst
