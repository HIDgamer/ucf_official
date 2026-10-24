/// The handheld map is held open in front of the face while its window is up, folds and unfolds, and has a sprite for each of those
/datum/unit_test/map_item_states

/datum/unit_test/map_item_states/Run()
	var/obj/item/map/map = allocate(/obj/item/map)
	TEST_ASSERT("map" in icon_states(map.icon), "The item icon has no map state")
	TEST_ASSERT("map_folded" in icon_states(map.icon), "The item icon has no map_folded state")
	for(var/slot in list(WEAR_L_HAND, WEAR_R_HAND))
		var/hand_icon = map.item_icons[slot]
		TEST_ASSERT("map" in icon_states(hand_icon), "The inhand icon for [slot] has no map state")
		TEST_ASSERT("map_studied" in icon_states(hand_icon), "The inhand icon for [slot] has no map_studied state")

	var/mob/living/carbon/human/reader = allocate(/mob/living/carbon/human)
	reader.put_in_hands(map)
	TEST_ASSERT_EQUAL(map.loc, reader, "The map was not put in the reader's hands")
	TEST_ASSERT(!map.folded && map.w_class == SIZE_MEDIUM, "A map starts folded or small")

	var/mob/saved_usr = usr
	usr = reader
	map.attack_self(reader)
	TEST_ASSERT_EQUAL(map.item_state, "map_studied", "A map that is being read is not held open")
	map.Topic("close=1", list("close" = "1"))
	TEST_ASSERT_EQUAL(map.item_state, "map", "Closing the window did not put the map back under the arm")

	map.fold_unfold()
	TEST_ASSERT(map.folded, "The map did not fold")
	TEST_ASSERT_EQUAL(map.w_class, SIZE_TINY, "A folded map is not small")
	TEST_ASSERT_EQUAL(map.icon_state, "map_folded", "A folded map does not look folded")
	TEST_ASSERT_EQUAL(map.item_state, "", "A folded map is still shown in the hands")

	// Using a folded map unfolds it instead of opening it
	map.attack_self(reader)
	TEST_ASSERT(!map.folded, "Using a folded map did not unfold it")
	TEST_ASSERT_EQUAL(map.w_class, SIZE_MEDIUM, "An unfolded map is not big")
	TEST_ASSERT_EQUAL(map.icon_state, "map", "An unfolded map does not look unfolded")

	// It cannot be folded unless it is held
	reader.drop_held_item(map)
	map.fold_unfold()
	TEST_ASSERT(!map.folded, "A map that was not held was folded")
	usr = saved_usr
