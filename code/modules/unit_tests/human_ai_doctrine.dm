/// Mercenaries talk like mercenaries and the rebels still talk like rebels
/datum/unit_test/human_ai_doctrine_voices

/datum/unit_test/human_ai_doctrine_voices/Run()
	TEST_ASSERT_EQUAL(get_human_ai_voice(FACTION_MERCENARY).id, "mercenary", "Mercenaries do not talk like mercenaries")
	TEST_ASSERT_EQUAL(get_human_ai_voice(FACTION_FREELANCER).id, "mercenary", "Freelancers do not talk like mercenaries")
	TEST_ASSERT_EQUAL(get_human_ai_voice(FACTION_DUTCH).id, "mercenary", "Dutch's Dozen do not talk like mercenaries")
	TEST_ASSERT_EQUAL(get_human_ai_voice(FACTION_CLF).id, "rebel", "The CLF lost its voice")
	var/datum/human_ai_voice/bank = GLOB.human_ai_voices["mercenary"]
	TEST_ASSERT_NOTNULL(bank, "There is no mercenary voice")
	TEST_ASSERT(length(bank.line("contact", null)), "The mercenary voice has nothing to say on contact")
	TEST_ASSERT(length(bank.small_talk()), "The mercenary voice has no small talk")

/// A man nobody picked a nature for is what his people are like, a boss is a different sort and a chosen nature is never overruled
/datum/unit_test/human_ai_faction_natures

/datum/unit_test/human_ai_faction_natures/Run()
	for(var/faction in GLOB.human_ai_faction_natures)
		var/list/natures = GLOB.human_ai_faction_natures[faction]
		for(var/nature in natures)
			TEST_ASSERT(nature in GLOB.human_ai_personalities, "[faction] has [nature], which is not a nature")
	for(var/nature in GLOB.human_ai_leader_natures)
		TEST_ASSERT(nature in GLOB.human_ai_personalities, "The leaders have [nature], which is not a nature")
	TEST_ASSERT(human_ai_is_leader_job("Insurgent Cell Leader"), "A cell leader is not a leader")
	TEST_ASSERT(human_ai_is_leader_job("Squad Leader"), "A squad leader is not a leader")
	TEST_ASSERT(!human_ai_is_leader_job("Mercenary"), "A mercenary is a leader")
	TEST_ASSERT(!human_ai_is_leader_job(null), "Nobody is a leader")

	var/mob/living/carbon/human/man = allocate(/mob/living/carbon/human, run_loc_floor_bottom_left)
	man.create_hud()
	man.faction = FACTION_MERCENARY
	man.job = "Mercenary"
	TEST_ASSERT(attach_human_ai(man), "The mercenary took no brain")
	TEST_ASSERT(man.ai_brain.personality.id in GLOB.human_ai_faction_natures[FACTION_MERCENARY], "A mercenary is [man.ai_brain.personality.id], which is not what mercenaries are like")
	detach_human_ai(man)

	man.job = "Mercenary Leader"
	TEST_ASSERT(attach_human_ai(man), "The leader took no brain")
	TEST_ASSERT(man.ai_brain.personality.id in GLOB.human_ai_leader_natures, "A leader is [man.ai_brain.personality.id], which is not what leaders are like")
	detach_human_ai(man)

	TEST_ASSERT(attach_human_ai(man, "friendly"), "The mercenary took no brain with a chosen nature")
	TEST_ASSERT_EQUAL(man.ai_brain.personality.id, "friendly", "A nature that was picked on purpose was overruled")
	detach_human_ai(man)

	// A faction without a doctrine keeps the blank nature it always had
	man.faction = FACTION_MARINE
	man.job = "Squad Rifleman"
	TEST_ASSERT(attach_human_ai(man), "The marine took no brain")
	TEST_ASSERT_EQUAL(man.ai_brain.personality.id, "neutral", "A marine was given a nature by a doctrine he does not have")
	detach_human_ai(man)

/// The people of the factions with a kit carry the grenades it calls for and are not handed a second one of a kind they have
/datum/unit_test/human_ai_faction_kit

/datum/unit_test/human_ai_faction_kit/Run()
	var/mob/living/carbon/human/merc = allocate(/mob/living/carbon/human, run_loc_floor_bottom_left)
	merc.create_hud()
	merc.faction = FACTION_MERCENARY
	var/obj/item/storage/backpack/pack = new(merc)
	merc.put_in_back(pack)
	TEST_ASSERT(attach_human_ai(merc), "The mercenary took no brain")
	var/datum/human_ai_brain/brain = merc.ai_brain
	TEST_ASSERT_NOTNULL(brain.find_grenade(HAI_GRENADE_LETHAL), "A mercenary carries no frag grenade")
	TEST_ASSERT_NOTNULL(brain.find_grenade(HAI_GRENADE_SMOKE), "A mercenary carries no smoke grenade")
	TEST_ASSERT_NULL(brain.find_grenade(HAI_GRENADE_FLASH), "A mercenary was handed a flashbang he does not need")
	detach_human_ai(merc)

	// Whoever already has a grenade of a kind is not given another
	var/mob/living/carbon/human/armed = allocate(/mob/living/carbon/human, run_loc_floor_bottom_left)
	armed.create_hud()
	armed.faction = FACTION_MERCENARY
	var/obj/item/storage/backpack/armed_pack = new(armed)
	armed.put_in_back(armed_pack)
	var/obj/item/explosive/grenade/high_explosive/frag/own = new(armed_pack)
	TEST_ASSERT(attach_human_ai(armed), "The armed mercenary took no brain")
	var/frags = 0
	for(var/obj/item/explosive/grenade/high_explosive/frag/frag in armed.get_contents())
		frags++
	TEST_ASSERT_EQUAL(frags, 1, "A man with a frag grenade was handed another")
	TEST_ASSERT(own in armed.get_contents(), "The grenade he had was taken away")
	TEST_ASSERT_NOTNULL(armed.ai_brain.find_grenade(HAI_GRENADE_SMOKE), "The man with a frag grenade was not handed the smoke he lacked")
	detach_human_ai(armed)

	// The marines have no kit of their own
	var/mob/living/carbon/human/marine = allocate(/mob/living/carbon/human, run_loc_floor_bottom_left)
	marine.create_hud()
	marine.faction = FACTION_MARINE
	var/obj/item/storage/backpack/marine_pack = new(marine)
	marine.put_in_back(marine_pack)
	TEST_ASSERT(attach_human_ai(marine), "The marine took no brain")
	TEST_ASSERT_NULL(marine.ai_brain.find_grenade(HAI_GRENADE_LETHAL), "A marine was handed a grenade by a kit he does not have")
	detach_human_ai(marine)
