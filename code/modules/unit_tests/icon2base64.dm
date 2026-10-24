/// icon2base64 reads a file and state through rust-g and does not fall back to the slow way, a transform changes the picture, and a ready made icon is still converted
/datum/unit_test/icon2base64_paths

/// Converts a file and state and says whether rust-g made the picture, which it leaves behind as a file, or the slow way was used
/datum/unit_test/icon2base64_paths/proc/made_by_rust_g(icon_file, icon_state)
	fdel("tmp/forged.png")
	var/converted = icon2base64(icon_file, icon_state)
	TEST_ASSERT(istext(converted) && length(converted) > 20, "[icon_file] [icon_state] was not converted")
	TEST_ASSERT_EQUAL(copytext(converted, 1, 5), "iVBO", "[icon_file] [icon_state] did not come out as a PNG in base64, it starts with [copytext(converted, 1, 20)]")
	return fexists("tmp/forged.png")

/datum/unit_test/icon2base64_paths/Run()
	TEST_ASSERT(made_by_rust_g('icons/obj/items/marine-items.dmi', "map"), "An ordinary icon was not made by rust-g, the slow way was used")
	// The minimap icons are what the server converts when it starts. Whether rust-g or the slow way makes them depends on the case of the folder name in the file system,
	// which is icons/ui_icons here and is spelt icons/UI_icons in the code, so only that they all come out right is asked
	var/list/states = icon_states('icons/UI_icons/map_blips.dmi')
	TEST_ASSERT(length(states), "The minimap icon file has no states")
	TEST_ASSERT_EQUAL(length(GLOB.minimap_icons), length(states), "The minimap has [length(GLOB.minimap_icons)] icons and the file has [length(states)] states")
	for(var/state in states)
		var/converted = GLOB.minimap_icons[state]
		TEST_ASSERT(istext(converted) && copytext(converted, 1, 5) == "iVBO", "The minimap icon [state] is not a PNG in base64")

	// An icon that is already made has no file and state to read, so it is converted the old way
	var/icon/ready = icon('icons/obj/items/marine-items.dmi', "map")
	var/slow = icon2base64(ready)
	TEST_ASSERT(istext(slow) && length(slow) > 20, "A ready made icon was not converted")
	TEST_ASSERT_EQUAL(copytext(slow, 1, 5), "iVBO", "The ready made icon did not come out as a PNG in base64")

	var/fast = icon2base64('icons/obj/items/marine-items.dmi', "map")
	var/scaled = icon2base64('icons/obj/items/marine-items.dmi', "map", list(list("type" = RUSTG_ICONFORGE_SCALE, "width" = 16, "height" = 16)))
	TEST_ASSERT(istext(scaled) && scaled != fast, "A transform changed nothing")
	var/icon/scaled_by_hand = icon('icons/obj/items/marine-items.dmi', "map")
	TEST_ASSERT(apply_rustg_transforms(scaled_by_hand, list(list("type" = RUSTG_ICONFORGE_SCALE, "width" = 16, "height" = 16))), "The transforms could not be applied by hand")
	TEST_ASSERT_EQUAL(scaled_by_hand.Width(), 16, "The scale was not applied by hand")
