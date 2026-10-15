/*
Ideas for the subtle effects of hallucination:

Light up oxygen/phoron indicators (done)
Cause health to look critical/dead, even when standing (done)
Characters silently watching you
Brief flashes of fire/space/bombs/c4/dangerous shit (done)
Items that are rare/traitorous/don't exist appearing in your inventory slots (done)
Strange audio (should be rare) (done)
Gunshots/explosions/opening doors/less rare audio (done)

*/

/mob/living/carbon/var
	image/halimage
	image/halbody
	obj/halitem
	hal_screwyhud = 0 //1 - critical, 2 - dead, 3 - oxygen indicator, 4 - toxin indicator
	handling_hal = 0
	hal_crit = 0

/mob/living/carbon/proc/handle_hallucinations()
	if(handling_hal)
		return
	handling_hal = 1
	while(client && hallucination > 20)
		sleep(rand(200,500)/(hallucination/25))
		if(QDELETED(client) || isnull(client.prefs))
			continue
		var/hallucination_type = pick_random_hallucination(hallucination)
		if(hallucination_type)
			new hallucination_type(src)
	handling_hal = 0




/*obj/structure/machinery/proc/mockpanel(list/buttons,start_txt,end_txt,list/mid_txts)

	if(!mocktxt)

		mocktxt = ""

		var/possible_txt = list("Launch Escape Pods","Self-Destruct Sequence","\[Swipe ID\]","De-Monkify",\
		"Reticulate Splines","Plasma","Open Valve","Lockdown","Nerf Airflow","Kill Traitor","Nihilism",\
		"OBJECTION!","Arrest Stephen Bowman","Engage Anti-Trenna Defenses","Increase Captain IQ","Retrieve Arms",\
		"Play Charades","Oxygen","Inject BeAcOs","Ninja Lizards","Limit Break","Build Sentry")

		if(mid_txts)
			while(length(mid_txts))
				var/mid_txt = pick(mid_txts)
				mocktxt += mid_txt
				mid_txts -= mid_txt

		while(length(buttons))

			var/button = pick(buttons)

			var/button_txt = pick(possible_txt)

			mocktxt += "<a href='byond://?src=\ref[src];[button]'>[button_txt]</a><br>"

			buttons -= button
			possible_txt -= button_txt

	return start_txt + mocktxt + end_txt + "</TT></BODY></HTML>"

/proc/check_panel(mob/M)
	if (istype(M, /mob/living/carbon/human) || isRemoteControlling(M))
		if(M.hallucination < 15)
			return 1
	return 0*/

/obj/effect/fake_attacker
	icon = null
	icon_state = null
	name = ""
	desc = ""
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	var/mob/living/carbon/human/my_target = null
	var/weapon_name = null
	var/obj/item/weap = null
	var/image/currentimage = null
	var/image/left
	var/image/right
	var/image/up
	var/collapse
	var/image/down

	health = 100

/obj/effect/fake_attacker/attackby(obj/item/P as obj, mob/user as mob)
	step_away(src,my_target,2)
	for(var/mob/M in oviewers(GLOB.world_view_size,my_target))
		to_chat(M, SPAN_WARNING("<B>[my_target] flails around wildly.</B>"))
	my_target.show_message(SPAN_DANGER("<B>[src] has been attacked by [my_target] </B>"), SHOW_MESSAGE_VISIBLE) //Lazy.

	src.health -= P.force


	return

/obj/effect/fake_attacker/Crossed(mob/M, somenumber)
	if(M == my_target)
		step_away(src,my_target,2)
		if(prob(30))
			for(var/mob/O in oviewers(GLOB.world_view_size , my_target))
				to_chat(O, SPAN_DANGER("<B>[my_target] stumbles around.</B>"))

/obj/effect/fake_attacker/New()
	..()
	spawn(30 SECONDS)
		if(my_target)
			my_target.hallucinations -= src
		qdel(src)
	step_away(src,my_target,2)
	spawn attack_loop()

/obj/effect/fake_attacker/Destroy()
	if(my_target)
		my_target.hallucinations -= src
		my_target = null
	weap = null
	currentimage = null
	left = null
	right = null
	up = null
	down = null
	return ..()

/obj/effect/fake_attacker/proc/updateimage()
	if(src.dir == NORTH)
		src.currentimage = new /image(up,src)
	else if(src.dir == SOUTH)
		src.currentimage = new /image(down,src)
	else if(src.dir == EAST)
		src.currentimage = new /image(right,src)
	else if(src.dir == WEST)
		src.currentimage = new /image(left,src)
	my_target << currentimage


/obj/effect/fake_attacker/proc/attack_loop()
	while(1)
		sleep(rand(5,10))
		if(src.health < 0)
			collapse()
			continue
		if(get_dist(src,my_target) > 1)
			setDir(get_dir(src,my_target))
			step_towards(src,my_target)
			updateimage()
		else
			if(prob(15))
				if(weapon_name)
					my_target << sound(pick('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg'))
					my_target.show_message(SPAN_DANGER("<B>[my_target] has been attacked with [weapon_name] by [src.name] </B>"), SHOW_MESSAGE_VISIBLE)
					my_target.halloss += 8
					if(prob(20))
						my_target.AdjustEyeBlur(3)
					if(prob(33))
						if(!locate(/obj/effect/overlay) in my_target.loc)
							fake_blood(my_target)
				else
					my_target << sound(pick('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg'))
					my_target.show_message(SPAN_DANGER("<B>[src.name] has punched [my_target]!</B>"), SHOW_MESSAGE_VISIBLE)
					my_target.halloss += 4
					if(prob(33))
						if(!locate(/obj/effect/overlay) in my_target.loc)
							fake_blood(my_target)

		if(prob(15))
			step_away(src,my_target,2)

/obj/effect/fake_attacker/proc/collapse()
	collapse = 1
	updateimage()

/proc/fake_blood(mob/target)
	var/obj/effect/overlay/O = new/obj/effect/overlay(target.loc)
	O.name = "blood"
	var/image/I = image('icons/effects/blood.dmi',O,"floor[rand(1,7)]",O.dir,1)
	target << I
	QDEL_IN(O, 30 SECONDS)
	return

GLOBAL_LIST_INIT(non_fakeattack_weapons, list(/obj/item/device/aicard,\
	/obj/item/clothing/shoes/magboots, /obj/item/disk/nuclear,\
	/obj/item/clothing/suit/space/uscm, /obj/item/tank))

/proc/fake_attack(mob/living/target)
// var/list/possible_clones = new/list()
	var/mob/living/carbon/human/clone = null
	var/clone_weapon = null

	for(var/mob/living/carbon/human/H in GLOB.alive_mob_list)
		if(H.stat)
			continue
// possible_clones += H
		clone = H
		break //changed the code a bit. Less randomised, but less work to do. Should be ok, world.contents aren't stored in any particular order.

// if(!length(possible_clones)) return
// clone = pick(possible_clones)
	if(!clone)
		return

	//var/obj/effect/fake_attacker/F = new/obj/effect/fake_attacker(outside_range(target))
	var/obj/effect/fake_attacker/F = new/obj/effect/fake_attacker(target.loc)
	if(clone.l_hand)
		if(!(locate(clone.l_hand) in GLOB.non_fakeattack_weapons))
			clone_weapon = clone.l_hand.name
			F.weap = clone.l_hand
	else if (clone.r_hand)
		if(!(locate(clone.r_hand) in GLOB.non_fakeattack_weapons))
			clone_weapon = clone.r_hand.name
			F.weap = clone.r_hand

	F.name = clone.name
	F.my_target = target
	F.weapon_name = clone_weapon
	target.hallucinations += F


	F.left = image(clone,dir = WEST)
	F.right = image(clone,dir = EAST)
	F.up = image(clone,dir = NORTH)
	F.down = image(clone,dir = SOUTH)

	F.updateimage()
