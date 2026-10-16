#define TWE_ARMOR_TYPES list(/obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk4, /obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk2, /obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk5)

/// Returns each protection value of an armor type in a fixed order
/datum/unit_test/twe_armor/proc/armor_values(obj/item/clothing/suit/armor)
	return list(armor.armor_melee, armor.armor_bullet, armor.armor_laser, armor.armor_energy, armor.armor_bomb, armor.armor_bio, armor.armor_rad, armor.armor_internaldamage)

/// The Mk. armors sit where they were asked to relative to the M3 armors
/datum/unit_test/twe_armor/Run()
	var/obj/item/clothing/suit/storage/marine/medium/m3 = allocate(/obj/item/clothing/suit/storage/marine/medium)
	var/obj/item/clothing/suit/storage/marine/light/m3_light = allocate(/obj/item/clothing/suit/storage/marine/light)
	var/obj/item/clothing/suit/storage/marine/heavy/eod = allocate(/obj/item/clothing/suit/storage/marine/heavy)
	var/obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk4/heavy = allocate(/obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk4)
	var/obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk2/light = allocate(/obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk2)
	var/obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk5/lightfoot = allocate(/obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk5)

	var/list/m3_values = armor_values(m3)
	var/list/eod_values = armor_values(eod)
	var/list/heavy_values = armor_values(heavy)
	var/better_than_m3 = FALSE
	for(var/index in 1 to length(heavy_values))
		TEST_ASSERT(heavy_values[index] >= m3_values[index], "Mk. IV protection value [index] is worse than the M3 medium")
		TEST_ASSERT(heavy_values[index] <= eod_values[index], "Mk. IV protection value [index] is better than the M3-EOD")
		if(heavy_values[index] > m3_values[index])
			better_than_m3 = TRUE
	TEST_ASSERT(better_than_m3, "Mk. IV is not better than the M3 medium anywhere")
	TEST_ASSERT_EQUAL(heavy.slowdown, m3.slowdown, "Mk. IV mobility differs from the M3 medium")
	TEST_ASSERT_EQUAL(heavy.movement_compensation, m3.movement_compensation, "Mk. IV gun handling differs from the M3 medium")
	TEST_ASSERT_EQUAL(heavy.storage_slots, m3.storage_slots, "Mk. IV storage differs from the M3 medium")

	var/list/mk2_values = armor_values(light)
	var/list/m3_light_values = armor_values(m3_light)
	for(var/index in 1 to length(mk2_values))
		TEST_ASSERT_EQUAL(mk2_values[index], m3_light_values[index], "Mk. II protection value [index] differs from the M3-L")
	TEST_ASSERT_EQUAL(light.slowdown, m3_light.slowdown, "Mk. II mobility differs from the M3-L")
	TEST_ASSERT_EQUAL(light.storage_slots, m3_light.storage_slots + 1, "Mk. II does not have one more storage slot than the M3-L")

	var/list/lightfoot_values = armor_values(lightfoot)
	for(var/index in 1 to length(lightfoot_values))
		TEST_ASSERT(lightfoot_values[index] <= m3_light_values[index], "Mk. V protection value [index] is better than the M3-L")
	TEST_ASSERT(lightfoot.slowdown <= SLOWDOWN_ARMOR_NONE, "Mk. V slows its wearer down")
	TEST_ASSERT_EQUAL(lightfoot.storage_slots, 5, "Mk. V does not have 5 storage slots")

	for(var/armor_type in TWE_ARMOR_TYPES)
		var/obj/item/clothing/suit/armor = allocate(armor_type)
		TEST_ASSERT(icon_exists(armor.icon, armor.icon_state), "[armor_type] has no item icon state [armor.icon_state] in [armor.icon]")
		TEST_ASSERT(icon_exists(armor.item_icons[WEAR_JACKET], armor.item_state), "[armor_type] has no worn icon state [armor.item_state] in [armor.item_icons[WEAR_JACKET]]")

/// The jumpsuit has its item, worn, rolled and jacketless sprites
/datum/unit_test/twe_jumpsuit/Run()
	var/obj/item/clothing/under/marine/veteran/royal_marine/jumpsuit/jumpsuit = allocate(/obj/item/clothing/under/marine/veteran/royal_marine/jumpsuit)
	TEST_ASSERT(icon_exists(jumpsuit.icon, jumpsuit.icon_state), "The jumpsuit has no item icon state")
	TEST_ASSERT(icon_exists(jumpsuit.item_icons[WEAR_BODY], jumpsuit.worn_state), "The jumpsuit has no worn icon state")
	TEST_ASSERT(jumpsuit.flags_jumpsuit & UNIFORM_SLEEVE_ROLLABLE, "The jumpsuit does not have rollable sleeves")
	TEST_ASSERT(jumpsuit.flags_jumpsuit & UNIFORM_JACKET_REMOVABLE, "The jumpsuit does not have a removable jacket")

/// The Royal Marines Commando survivor is dressed in Mk. armor and is spawned on Hybrisa
/datum/unit_test/twe_survivor/Run()
	var/mob/living/carbon/human/survivor = allocate(/mob/living/carbon/human)
	arm_equipment(survivor, /datum/equipment_preset/survivor/hybrisa/royal_marine_commando, FALSE, FALSE)
	TEST_ASSERT(istype(survivor.w_uniform, /obj/item/clothing/under/marine/veteran/royal_marine/jumpsuit), "The commando survivor has no jumpsuit")
	TEST_ASSERT(istype(survivor.wear_suit, /obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk4) || istype(survivor.wear_suit, /obj/item/clothing/suit/storage/marine/veteran/royal_marine/mk2), "The commando survivor has no Mk. armor, wears [survivor.wear_suit]")
	TEST_ASSERT(istype(survivor.l_hand, /obj/item/weapon/gun/smg/p90/twe), "The commando survivor has no P90")
	TEST_ASSERT(findtext(file2text("maps/lv759_hybrisa_prospera.json"), "royal_marine_commando"), "The commando survivor is not in the Hybrisa survivor list")

#undef TWE_ARMOR_TYPES
