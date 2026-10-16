/// Every ported Bastion clothing item has its item and worn sprites
/datum/unit_test/bastion_clothing_sprites/Run()
	var/static/list/roots = list(
		/obj/item/clothing/under/bastion = WEAR_BODY,
		/obj/item/clothing/suit/bastion = WEAR_JACKET,
		/obj/item/clothing/accessory/poncho/bastion = WEAR_JACKET,
		/obj/item/clothing/head/bastion = WEAR_HEAD,
		/obj/item/clothing/shoes/bastion = WEAR_FEET,
		/obj/item/clothing/gloves/bastion = WEAR_HANDS,
		/obj/item/clothing/mask/bastion = WEAR_FACE,
		/obj/item/clothing/glasses/bastion = WEAR_EYES,
		/obj/item/storage/backpack/bastion = WEAR_BACK,
	)
	var/list/missing = list()
	for(var/root in roots)
		var/slot = roots[root]
		for(var/path in subtypesof(root))
			var/obj/item/clothing = allocate(path)
			if(!clothing.icon_state)
				continue
			if(!icon_exists(clothing.icon, clothing.icon_state))
				missing += "[path] item [clothing.icon_state]"
				continue
			var/worn_state = LAZYACCESS(clothing.item_state_slots, slot) || clothing.icon_state
			if(!icon_exists(clothing.item_icons[slot], worn_state))
				missing += "[path] worn [worn_state]"
	TEST_ASSERT(!length(missing), "Clothing with missing sprites:\n[missing.Join("\n")]")

/// Hooded coats put their hood on and fold it back, toggle suits switch sprite
/datum/unit_test/bastion_hooded_coat/Run()
	var/mob/living/carbon/human/wearer = allocate(/mob/living/carbon/human)
	wearer.create_hud()
	var/obj/item/clothing/under/bastion/rank/civilian/janitor/uniform = allocate(/obj/item/clothing/under/bastion/rank/civilian/janitor)
	TEST_ASSERT(wearer.equip_to_slot_if_possible(uniform, WEAR_BODY), "The uniform could not be worn")
	var/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/security/coat = allocate(/obj/item/clothing/accessory/poncho/bastion/hooded/wintercoat/security)
	TEST_ASSERT(wearer.equip_to_slot_if_possible(coat, WEAR_JACKET), "The coat could not be worn")
	coat.attack_self(wearer)
	TEST_ASSERT(coat.hood_up && wearer.head == coat.hood, "The hood did not go on the head")
	TEST_ASSERT_EQUAL(coat.icon_state, "[coat.closed_icon_state]_t", "The coat sprite did not change with the hood up")
	coat.attack_self(wearer)
	TEST_ASSERT(!coat.hood_up && !wearer.head && coat.hood.loc == coat, "The hood did not fold back into the coat")
	TEST_ASSERT_EQUAL(coat.icon_state, coat.closed_icon_state, "The coat sprite did not return")
	coat.attack_self(wearer)
	wearer.drop_inv_item_on_ground(coat)
	TEST_ASSERT(!coat.hood_up && !wearer.head && coat.hood.loc == coat, "Taking the coat off left the hood behind")
	var/obj/item/clothing/suit/bastion/toggle/toggle_suit = allocate(subtypesof(/obj/item/clothing/suit/bastion/toggle)[1])
	toggle_suit.attack_self(wearer)
	TEST_ASSERT_EQUAL(toggle_suit.icon_state, "[toggle_suit.closed_icon_state]_t", "The toggle suit did not switch sprite")
	var/obj/item/clothing/suit/storage/marine/armor = allocate(/obj/item/clothing/suit/storage/marine)
	TEST_ASSERT(armor.can_attach_accessory(coat), "The coat cannot be attached to armor")

/// The Mann Shield preset dresses a human as the Bastion blueshield and is admin restricted
/datum/unit_test/mann_shield_preset/Run()
	var/datum/equipment_preset/preset = GLOB.gear_name_presets_list["Mann Shield Preset"]
	TEST_ASSERT_NOTNULL(preset, "The Mann Shield preset is not registered")
	TEST_ASSERT(length(preset.restricted_to_ckeys), "The Mann Shield preset is not restricted")
	var/mob/living/carbon/human/shield = allocate(/mob/living/carbon/human)
	arm_equipment(shield, /datum/equipment_preset/other/mann_shield, FALSE, FALSE)
	TEST_ASSERT(istype(shield.w_uniform, /obj/item/clothing/under/bastion/rank/blueshield), "No blueshield uniform")
	TEST_ASSERT(istype(shield.wear_suit, /obj/item/clothing/accessory/poncho/bastion/armor/vest/blueshield/jacket), "No blueshield jacket")
	TEST_ASSERT(istype(shield.head, /obj/item/clothing/head/beret/marine/commander/council), "No blue beret")
	TEST_ASSERT(istype(shield.back, /obj/item/storage/backpack/bastion/blueshield), "No blueshield backpack")
	TEST_ASSERT(istype(shield.belt, /obj/item/storage/belt/security/MP/full/blueshield), "No blueshield belt")
	TEST_ASSERT(istype(shield.gloves, /obj/item/clothing/gloves/bastion/combat), "No combat gloves")
	TEST_ASSERT(istype(shield.shoes, /obj/item/clothing/shoes/bastion/jackboots), "No jackboots")

/// Every wardrobe vendor stocks real items and has its sprite
/datum/unit_test/bastion_wardrobe_vendors/Run()
	var/list/problems = list()
	for(var/path in subtypesof(/obj/structure/machinery/vending/bastion))
		var/obj/structure/machinery/vending/bastion/vendor = allocate(path)
		if(!icon_exists(vendor.icon, vendor.icon_state))
			problems += "[path] icon [vendor.icon_state]"
		if(!length(vendor.products))
			problems += "[path] has no products"
		for(var/product in vendor.products)
			if(!ispath(product, /obj/item))
				problems += "[path] stocks [product]"
	TEST_ASSERT(!length(problems), "Wardrobe vendor problems:\n[problems.Join("\n")]")

/// The commanding officer and synthetic snowflake vendors stock the Bastion clothing and nothing captain themed
/datum/unit_test/bastion_vendor_lists/Run()
	var/list/problems = list()
	for(var/list/entry as anything in GLOB.cm_vending_clothing_bastion_co + GLOB.cm_vending_clothing_bastion_synth)
		if(!entry[3])
			continue
		if(!ispath(entry[3], /obj/item))
			problems += "[entry[1]] is not an item"
	for(var/list/entry as anything in GLOB.cm_vending_clothing_bastion_co)
		if(entry[3] && findtext("[entry[3]]", "captain"))
			problems += "[entry[3]] is captain clothing"
	for(var/list/entry as anything in GLOB.cm_vending_clothing_bastion_synth)
		if(entry[3] && findtext("[entry[3]]", "costume|dress|bunny"))
			problems += "[entry[3]] is not humble"
	var/obj/structure/machinery/cm_vending/clothing/commanding_officer/co_vendor = allocate(/obj/structure/machinery/cm_vending/clothing/commanding_officer)
	TEST_ASSERT(length(co_vendor.get_listed_products()) > length(GLOB.cm_vending_clothing_commanding_officer), "The CO vendor does not stock the Bastion clothing")
	var/obj/structure/machinery/cm_vending/clothing/synth/snowflake/synth_vendor = allocate(/obj/structure/machinery/cm_vending/clothing/synth/snowflake)
	TEST_ASSERT(length(synth_vendor.get_listed_products()) > length(GLOB.cm_vending_clothing_synth_snowflake), "The synth snowflake vendor does not stock the Bastion clothing")
	TEST_ASSERT(!length(problems), "Vendor list problems:\n[problems.Join("\n")]")
