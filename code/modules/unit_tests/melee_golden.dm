/// Fixed melee exchanges whose damage and attack delay must never change unintentionally
/datum/unit_test/melee_golden
	var/list/golden = list(
		"human force 5 brute" = 5,
		"human force 5 burn" = 0,
		"human force 10 brute" = 10,
		"human force 10 burn" = 0,
		"human force 20 brute" = 20,
		"human force 20 burn" = 0,
		"human force 40 brute" = 40,
		"human force 40 burn" = 0,
		"human fire 10 brute" = 0,
		"human fire 10 burn" = 10,
		"human armor 10 brute" = 14.5289,
		"human armor 10 burn" = 0,
		"human armor 25 brute" = 7.41843,
		"human armor 25 burn" = 0,
		"human armor 50 brute" = 0,
		"human armor 50 burn" = 0,
		"human skill 3 brute" = 10,
		"human skill 3 burn" = 0,
		"human sharp edge brute" = 15,
		"human sharp edge burn" = 0,
		"xeno /mob/living/carbon/xenomorph/runner force 20 brute" = 30,
		"xeno /mob/living/carbon/xenomorph/runner force 20 armor" = 100,
		"xeno /mob/living/carbon/xenomorph/drone force 20 brute" = 30,
		"xeno /mob/living/carbon/xenomorph/drone force 20 armor" = 100,
		"xeno /mob/living/carbon/xenomorph/lurker force 20 brute" = 30,
		"xeno /mob/living/carbon/xenomorph/lurker force 20 armor" = 100,
		"xeno /mob/living/carbon/xenomorph/warrior force 20 brute" = 30,
		"xeno /mob/living/carbon/xenomorph/warrior force 20 armor" = 100,
		"xeno /mob/living/carbon/xenomorph/ravager force 20 brute" = 27.2727,
		"xeno /mob/living/carbon/xenomorph/ravager force 20 armor" = 100,
		"xeno /mob/living/carbon/xenomorph/crusher force 20 brute" = 24.7934,
		"xeno /mob/living/carbon/xenomorph/crusher force 20 armor" = 100,
		"xeno /mob/living/carbon/xenomorph/queen force 20 brute" = 27.2727,
		"xeno /mob/living/carbon/xenomorph/queen force 20 armor" = 100,
		"xeno runner skill 2 brute" = 45,
		"xeno runner skill 2 armor" = 100,
		"xeno crusher skill 2 brute" = 37.1901,
		"xeno crusher skill 2 armor" = 100,
		"xeno crusher three hits brute" = 74.3802,
		"xeno crusher three hits armor" = 100,
		"xeno runner five hits brute" = 150,
		"xeno runner five hits armor" = 100,
		"item on human delay" = 8.25,
		"item speed 5 on human delay" = 3.75,
		"item speed 20 on human delay" = 15,
		"item on xeno delay" = 8.25,
		"item on crate delay" = 5,
		"item on item delay" = 0,
		"zero force on human delay" = 8.25,
		"help hand on human delay" = 10,
		"disarm hand on human delay" = 10,
		"hand on crate delay" = 5,
		"hand on item delay" = 2,
	)

/datum/unit_test/melee_golden/proc/record(name, value)
	if(isnull(golden[name]))
		TEST_FAIL("No golden value for [name]")
		text2file("\"[name]\" = [value],", "data/melee_golden_rec.txt")
		return
	if(abs(golden[name] - value) > 0.001)
		TEST_FAIL("[name]: expected [golden[name]], got [value]")

/datum/unit_test/melee_golden/proc/make_attacker(skill_level = 0)
	var/mob/living/carbon/human/attacker = allocate(/mob/living/carbon/human, run_loc_floor_bottom_left)
	attacker.skills = new /datum/skills()
	attacker.skills.set_skill(SKILL_MELEE_WEAPONS, skill_level)
	attacker.zone_selected = "chest"
	attacker.a_intent = INTENT_HARM
	return attacker

/datum/unit_test/melee_golden/proc/make_weapon(force, damtype = BRUTE, sharp = FALSE, edge = FALSE, attack_speed = 11)
	var/obj/item/weapon = allocate(/obj/item, run_loc_floor_bottom_left)
	weapon.force = force
	weapon.damtype = damtype
	weapon.sharp = sharp
	weapon.edge = edge
	weapon.attack_speed = attack_speed
	weapon.flags_item &= ~NOBLUDGEON
	return weapon

/datum/unit_test/melee_golden/proc/human_hit(name, force, damtype = BRUTE, armor = 0, skill_level = 0, sharp = FALSE, edge = FALSE)
	var/mob/living/carbon/human/attacker = make_attacker(skill_level)
	var/mob/living/carbon/human/target = allocate(/mob/living/carbon/human, run_loc_floor_bottom_left)
	if(armor)
		var/obj/item/clothing/suit/vest = allocate(/obj/item/clothing/suit, run_loc_floor_bottom_left)
		vest.armor_melee = armor
		vest.flags_armor_protection = BODY_FLAG_CHEST
		target.wear_suit = vest
	var/obj/item/weapon = make_weapon(force, damtype, sharp, edge)
	weapon.attack(target, attacker)
	var/obj/limb/chest = target.get_limb("chest")
	record("[name] brute", chest.brute_dam)
	record("[name] burn", chest.burn_dam)

/datum/unit_test/melee_golden/proc/xeno_hit(name, path, force, skill_level = 0, hits = 1)
	var/mob/living/carbon/human/attacker = make_attacker(skill_level)
	var/mob/living/carbon/xenomorph/target = allocate(path, run_loc_floor_bottom_left)
	var/obj/item/weapon = make_weapon(force)
	for(var/i in 1 to hits)
		weapon.attack(target, attacker)
	record("[name] brute", target.getBruteLoss())
	record("[name] armor", target.armor_integrity)

/datum/unit_test/melee_golden/proc/delay_case(name, target_path, force = 10, attack_speed = 11, intent = INTENT_HARM, armed = TRUE)
	var/mob/living/carbon/human/attacker = make_attacker()
	attacker.a_intent = intent
	var/atom/target = allocate(target_path, run_loc_floor_bottom_left)
	var/obj/item/weapon
	if(armed)
		weapon = make_weapon(force, attack_speed = attack_speed)
	attacker.next_move = world.time
	attacker.click_adjacent(target, weapon, list())
	record("[name] delay", attacker.next_move - world.time)

/datum/unit_test/melee_golden/Run()
	human_hit("human force 5", 5)
	human_hit("human force 10", 10)
	human_hit("human force 20", 20)
	human_hit("human force 40", 40)
	human_hit("human fire 10", 10, BURN)
	human_hit("human armor 10", 20, armor = 10)
	human_hit("human armor 25", 20, armor = 25)
	human_hit("human armor 50", 20, armor = 50)
	human_hit("human skill 3", 10, skill_level = 3)
	human_hit("human sharp edge", 15, sharp = TRUE, edge = TRUE)

	for(var/path in list(/mob/living/carbon/xenomorph/runner, /mob/living/carbon/xenomorph/drone, /mob/living/carbon/xenomorph/lurker, /mob/living/carbon/xenomorph/warrior, /mob/living/carbon/xenomorph/ravager, /mob/living/carbon/xenomorph/crusher, /mob/living/carbon/xenomorph/queen))
		xeno_hit("xeno [path] force 20", path, 20)
	xeno_hit("xeno runner skill 2", /mob/living/carbon/xenomorph/runner, 20, skill_level = 2)
	xeno_hit("xeno crusher skill 2", /mob/living/carbon/xenomorph/crusher, 20, skill_level = 2)
	xeno_hit("xeno crusher three hits", /mob/living/carbon/xenomorph/crusher, 20, hits = 3)
	xeno_hit("xeno runner five hits", /mob/living/carbon/xenomorph/runner, 20, hits = 5)


	delay_case("item on human", /mob/living/carbon/human)
	delay_case("item speed 5 on human", /mob/living/carbon/human, attack_speed = 5)
	delay_case("item speed 20 on human", /mob/living/carbon/human, attack_speed = 20)
	delay_case("item on xeno", /mob/living/carbon/xenomorph/runner)
	delay_case("item on crate", /obj/structure/closet/crate)
	delay_case("item on item", /obj/item)
	delay_case("zero force on human", /mob/living/carbon/human, force = 0)
	delay_case("help hand on human", /mob/living/carbon/human, intent = INTENT_HELP, armed = FALSE)
	delay_case("disarm hand on human", /mob/living/carbon/human, intent = INTENT_DISARM, armed = FALSE)
	delay_case("hand on crate", /obj/structure/closet/crate, armed = FALSE)
	delay_case("hand on item", /obj/item, armed = FALSE)
