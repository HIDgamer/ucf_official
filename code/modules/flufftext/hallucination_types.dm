/// A single hallucination, started on a carbon and removed when it ends
/datum/hallucination
	var/mob/living/carbon/hallucinator
	/// Chance weight among random hallucinations, 0 means it is never picked at random
	var/random_weight = 0
	/// Hallucination level needed before it can be picked
	var/min_level = 0

/datum/hallucination/New(mob/living/carbon/target)
	hallucinator = target
	INVOKE_ASYNC(src, PROC_REF(run_hallucination))

/datum/hallucination/Destroy(force)
	cleanup()
	hallucinator = null
	return ..()

/datum/hallucination/proc/run_hallucination()
	if(QDELETED(hallucinator))
		qdel(src)
		return
	start()
	if(!QDELETED(src))
		qdel(src)

/// Plays out the hallucination, may sleep
/datum/hallucination/proc/start()
	return

/// Undoes whatever is still applied to the hallucinator
/datum/hallucination/proc/cleanup()
	return

/// A random open floor the hallucinator can see
/datum/hallucination/proc/get_view_floor(min_distance = 0)
	var/list/possible_points = list()
	for(var/turf/open/floor/floor in view(hallucinator, GLOB.world_view_size))
		if(min_distance && get_dist(floor, hallucinator) < min_distance)
			continue
		possible_points += floor
	if(length(possible_points))
		return pick(possible_points)

/proc/pick_random_hallucination(level)
	var/list/candidates = list()
	for(var/datum/hallucination/hallucination_type as anything in subtypesof(/datum/hallucination))
		if(hallucination_type::random_weight > 0 && level >= hallucination_type::min_level)
			candidates[hallucination_type] = hallucination_type::random_weight
	if(length(candidates))
		return pick_weight(candidates)

/datum/hallucination/screwy_hud
	random_weight = 15

/datum/hallucination/screwy_hud/start()
	hallucinator.hal_screwyhud = pick(1, 2, 3, 3, 4, 4)
	sleep(rand(100, 250))

/datum/hallucination/screwy_hud/cleanup()
	if(hallucinator && !hallucinator.hal_crit)
		hallucinator.hal_screwyhud = 0

/datum/hallucination/strange_item
	random_weight = 10

/datum/hallucination/strange_item/start()
	if(hallucinator.halitem || !hallucinator.client)
		return
	var/obj/halitem = new
	var/datum/custom_hud/ui_datum = GLOB.custom_huds_list[hallucinator.client.prefs.UI_style]
	var/list/slots_free = list(ui_datum.ui_lhand, ui_datum.ui_rhand)
	if(hallucinator.l_hand)
		slots_free -= ui_datum.ui_lhand
	if(hallucinator.r_hand)
		slots_free -= ui_datum.ui_rhand
	if(ishuman(hallucinator))
		var/mob/living/carbon/human/human = hallucinator
		if(!human.belt)
			slots_free += ui_datum.ui_belt
		if(!human.l_store)
			slots_free += ui_datum.ui_storage1
		if(!human.r_store)
			slots_free += ui_datum.ui_storage2
	if(!length(slots_free))
		qdel(halitem)
		return
	halitem.screen_loc = pick(slots_free)
	halitem.layer = 50
	switch(rand(1, 6))
		if(1)
			halitem.icon = 'icons/obj/items/weapons/guns/guns_by_faction/USCM/revolvers.dmi'
			halitem.icon_state = "m44r"
			halitem.name = "Revolver"
		if(2)
			halitem.icon = 'icons/obj/items/assemblies.dmi'
			halitem.icon_state = "plastic-explosive0"
			halitem.name = "Mysterious Package"
			if(prob(25))
				halitem.icon_state = "c4small_1"
		if(3)
			halitem.icon = 'icons/obj/items/weapons/melee/swords.dmi'
			halitem.icon_state = "sword1"
			halitem.name = "Sword"
		if(4)
			halitem.icon = 'icons/obj/items/weapons/melee/non_lethal.dmi'
			halitem.icon_state = "stunbaton"
			halitem.name = "Stun Baton"
		if(5)
			halitem.icon = 'icons/obj/items/card.dmi'
			halitem.icon_state = "emag"
			halitem.name = "Cryptographic Sequencer"
		if(6)
			halitem.icon = 'icons/obj/items/weapons/grenade.dmi'
			halitem.icon_state = "flashbang1"
			halitem.name = "Flashbang"
	hallucinator.halitem = halitem
	hallucinator.client.add_to_screen(halitem)
	sleep(rand(100, 250))

/datum/hallucination/strange_item/cleanup()
	if(!hallucinator?.halitem)
		return
	hallucinator.client?.remove_from_screen(hallucinator.halitem)
	QDEL_NULL(hallucinator.halitem)

/datum/hallucination/danger_flash
	random_weight = 15

/datum/hallucination/danger_flash/start()
	if(hallucinator.halimage || !hallucinator.client)
		return
	var/turf/open/floor/target = get_view_floor()
	if(!target)
		return
	switch(rand(1, 3))
		if(1)
			hallucinator.halimage = image('icons/turf/floors/space.dmi', target, "[rand(1, 25)]", TURF_LAYER)
		if(2)
			hallucinator.halimage = image('icons/effects/fire.dmi', target, "1", TURF_LAYER)
		if(3)
			hallucinator.halimage = image('icons/obj/items/assemblies.dmi', target, "plastic-explosive2", OBJ_LAYER + 0.01)
	hallucinator.client.images += hallucinator.halimage
	sleep(rand(10, 50))

/datum/hallucination/danger_flash/cleanup()
	if(!hallucinator?.halimage)
		return
	hallucinator.client?.images -= hallucinator.halimage
	hallucinator.halimage = null

/datum/hallucination/husk
	random_weight = 5

/datum/hallucination/husk/start()
	if(hallucinator.halbody || !hallucinator.client)
		return
	var/turf/open/floor/target = get_view_floor()
	if(!target)
		return
	hallucinator.halbody = image('icons/mob/humans/human.dmi', target, pick("husk_l", "husk_s", "husk_s"), TURF_LAYER)
	hallucinator.client.images += hallucinator.halbody
	sleep(rand(50, 80))

/datum/hallucination/husk/cleanup()
	if(!hallucinator?.halbody)
		return
	hallucinator.client?.images -= hallucinator.halbody
	hallucinator.halbody = null

/datum/hallucination/strange_audio
	random_weight = 25

/datum/hallucination/strange_audio/start()
	switch(rand(1, 12))
		if(1)
			hallucinator << 'sound/machines/airlock.ogg'
		if(2)
			hallucinator << pick('sound/effects/Explosion1.ogg', 'sound/effects/Explosion2.ogg')
		if(3)
			hallucinator << 'sound/effects/explosionfar.ogg'
		if(4)
			hallucinator << pick('sound/effects/Glassbr1.ogg', 'sound/effects/Glassbr2.ogg', 'sound/effects/Glassbr3.ogg')
		if(5)
			hallucinator << 'sound/machines/twobeep.ogg'
		if(6)
			hallucinator << 'sound/machines/windowdoor.ogg'
		if(7)
			hallucinator << 'sound/weapons/Gunshot.ogg'
			sleep(rand(10, 30))
			hallucinator << 'sound/weapons/Gunshot.ogg'
		if(8)
			hallucinator << 'sound/weapons/smash.ogg'
		if(9)
			hallucinator << 'sound/weapons/Taser.ogg'
			sleep(rand(10, 30))
			hallucinator << 'sound/weapons/Taser.ogg'
		if(10, 11, 12)
			hallucinator << pick('sound/effects/ghost.ogg', 'sound/effects/ghost2.ogg', 'sound/effects/Heart Beat.ogg', 'sound/effects/screech.ogg',\
				'sound/hallucinations/behind_you1.ogg', 'sound/hallucinations/behind_you2.ogg', 'sound/hallucinations/far_noise.ogg', 'sound/hallucinations/growl1.ogg', 'sound/hallucinations/growl2.ogg',\
				'sound/hallucinations/growl3.ogg', 'sound/hallucinations/im_here1.ogg', 'sound/hallucinations/im_here2.ogg', 'sound/hallucinations/i_see_you1.ogg', 'sound/hallucinations/i_see_you2.ogg',\
				'sound/hallucinations/look_up1.ogg', 'sound/hallucinations/look_up2.ogg', 'sound/hallucinations/over_here1.ogg', 'sound/hallucinations/over_here2.ogg', 'sound/hallucinations/over_here3.ogg',\
				'sound/hallucinations/turn_around1.ogg', 'sound/hallucinations/turn_around2.ogg', 'sound/hallucinations/veryfar_noise.ogg', 'sound/hallucinations/wail.ogg')

/datum/hallucination/fake_death
	random_weight = 2
	min_level = 50

/datum/hallucination/fake_death/start()
	hallucinator.sleeping = 20
	hallucinator.hal_crit = 1
	hallucinator.hal_screwyhud = 1
	sleep(rand(50, 100))

/datum/hallucination/fake_death/cleanup()
	if(!hallucinator)
		return
	hallucinator.sleeping = 0
	hallucinator.hal_crit = 0
	hallucinator.hal_screwyhud = 0

/datum/hallucination/fake_attacker
	random_weight = 4
	min_level = 60

/datum/hallucination/fake_attacker/start()
	fake_attack(hallucinator)

/// Something with a hiss in the dark that rushes the hallucinator and is gone
/obj/effect/client_image_holder/hallucinated_xeno
	image_icon = 'icons/mob/xenos/castes/tier_1/runner.dmi'
	image_state = "Normal Runner Running"
	image_pixel_x = -16
	image_pixel_y = -6

/datum/hallucination/fake_xeno
	random_weight = 10
	min_level = 30

/datum/hallucination/fake_xeno/start()
	if(!hallucinator.client)
		return
	var/turf/start_turf = get_view_floor(4)
	if(!start_turf)
		return
	var/obj/effect/client_image_holder/hallucinated_xeno/xeno = new(start_turf, hallucinator)
	hallucinator << pick('sound/voice/alien_growl1.ogg', 'sound/voice/alien_growl2.ogg', 'sound/voice/alien_growl3.ogg')
	for(var/step_count in 1 to rand(2, 4))
		sleep(0.3 SECONDS)
		if(QDELETED(xeno) || QDELETED(hallucinator))
			break
		xeno.dir = get_dir(xeno, hallucinator)
		xeno.forceMove(get_step_towards(xeno, hallucinator))
	if(!QDELETED(xeno))
		qdel(xeno)

/datum/hallucination/distant_roar
	random_weight = 10
	min_level = 25

/datum/hallucination/distant_roar/start()
	hallucinator << pick('sound/voice/alien_distantroar_3.ogg', 'sound/voice/alien_echoroar_1.ogg', 'sound/voice/alien_echoroar_2.ogg', 'sound/voice/alien_echoroar_3.ogg')
