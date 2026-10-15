/// Components need a valid dupe mode and dupe type
/datum/unit_test/component_duping/Run()
	var/list/bad_dupe_modes = list()
	var/list/bad_dupe_types = list()
	for(var/type in typesof(/datum/component))
		var/datum/component/comp = type
		if(!isnum(initial(comp.dupe_mode)))
			bad_dupe_modes += type
		var/dupe_type = initial(comp.dupe_type)
		if(dupe_type && !ispath(dupe_type))
			bad_dupe_types += type
	TEST_ASSERT(!length(bad_dupe_modes) && !length(bad_dupe_types), "Components with invalid dupe modes: ([bad_dupe_modes.Join(",")]) ||| invalid dupe types: ([bad_dupe_types.Join(",")])")

/// Two plane masters must not share a plane
/datum/unit_test/plane_dupe_detector/Run()
	var/list/planes = list()
	for(var/atom/movable/screen/plane_master/plane_path as anything in subtypesof(/atom/movable/screen/plane_master))
		var/plane = initial(plane_path.plane)
		if(!plane)
			continue
		if(planes["[plane]"])
			var/atom/movable/screen/plane_master/duplicate = planes["[plane]"]
			TEST_FAIL("The [initial(plane_path.name)] and [initial(duplicate.name)] plane masters both use plane [plane].")
		planes["[plane]"] = plane_path

/// Adding and removing traits from one or several sources
/datum/unit_test/trait_addition_and_removal/Run()
	var/datum/trait_target = allocate(/datum)
	ADD_TRAIT(trait_target, "trait_a", "source_a")
	TEST_ASSERT(HAS_TRAIT(trait_target, "trait_a"), "Basic trait addition failed")
	ADD_TRAIT(trait_target, "trait_b", "source_b")
	TEST_ASSERT(HAS_TRAIT_FROM(trait_target, "trait_b", "source_b"), "Failed to verify the source of a trait")
	TEST_ASSERT(HAS_TRAIT_NOT_FROM(trait_target, "trait_b", "source_a"), "Failed to see that the trait has a different source")
	REMOVE_TRAIT(trait_target, "trait_b", "source_b")
	TEST_ASSERT(!HAS_TRAIT(trait_target, "trait_b"), "Basic trait removal failed")
	TEST_ASSERT(HAS_TRAIT(trait_target, "trait_a"), "Removing one trait removed another")
	REMOVE_TRAIT(trait_target, "trait_a", "source_a")

	ADD_TRAIT(trait_target, "trait_main", "source_a")
	ADD_TRAIT(trait_target, "trait_main", "source_b")
	TEST_ASSERT(!HAS_TRAIT_FROM_ONLY(trait_target, "trait_main", "source_a"), "A trait added by two sources counted as having one")
	REMOVE_TRAIT_NOT_FROM(trait_target, "trait_main", "source_a")
	TEST_ASSERT(!HAS_TRAIT_FROM(trait_target, "trait_main", "source_b"), "Removing every other source kept the second source")
	TEST_ASSERT(HAS_TRAIT(trait_target, "trait_main"), "The trait was removed along with the other source")
	REMOVE_TRAIT(trait_target, "trait_main", "source_a")
	TEST_ASSERT(!HAS_TRAIT(trait_target, "trait_main"), "The trait was not removed")

	ADD_TRAIT(trait_target, "trait_a", "source_main")
	ADD_TRAIT(trait_target, "trait_b", "source_main")
	ADD_TRAIT(trait_target, "trait_c", "source_alt")
	REMOVE_TRAITS_NOT_IN(trait_target, "source_main")
	TEST_ASSERT(!HAS_TRAIT(trait_target, "trait_c"), "REMOVE_TRAITS_NOT_IN kept a trait from another source")
	REMOVE_TRAITS_IN(trait_target, "source_main")
	TEST_ASSERT(!HAS_TRAIT(trait_target, "trait_a") && !HAS_TRAIT(trait_target, "trait_b"), "REMOVE_TRAITS_IN kept a trait from the source")

/// range() must return closer turfs first, some code relies on it
/datum/unit_test/range_return/Run()
	var/x = (run_loc_floor_top_right.x - run_loc_floor_bottom_left.x) / 2
	var/y = (run_loc_floor_top_right.y - run_loc_floor_bottom_left.y) / 2
	var/turf/center = locate(x + run_loc_floor_bottom_left.x, y + run_loc_floor_bottom_left.y, run_loc_floor_bottom_left.z)
	var/least_distance = 0
	for(var/turf/checked in orange(center, min(x, y)))
		var/dist = get_dist(center, checked)
		TEST_ASSERT(dist >= least_distance, "Range returned a turf of greater distance before a turf of lower distance")
		least_distance = dist

/// Anchored mobs break the move force system
/datum/unit_test/anchored_mobs/Run()
	var/list/anchored_types = list()
	for(var/mob/mob_type as anything in typesof(/mob))
		if(initial(mob_type.anchored) && !ispath(mob_type, /mob/living/silicon/decoy) && !ispath(mob_type, /mob/dead/observer) && !ispath(mob_type, /mob/new_player))
			anchored_types += "[mob_type]"
	TEST_ASSERT(!length(anchored_types), "These mobs are anchored by default: [anchored_types.Join(" ")]")

/// Stacks of the same kind need a stack id to merge
/datum/unit_test/stack_ids/Run()
	var/list/missing = list()
	for(var/obj/item/stack/stack_type as anything in subtypesof(/obj/item/stack))
		if(initial(stack_type.stack_id) || length(subtypesof(stack_type)))
			continue
		missing += "[stack_type]"
	TEST_ASSERT(!length(missing), "Stacks without a stack_id: [missing.Join(" ")]")

/// Keybindings need a name and unique keys
/datum/unit_test/keybinding_names/Run()
	var/list/seen = list()
	for(var/datum/keybinding/binding_type as anything in subtypesof(/datum/keybinding))
		var/name = initial(binding_type.name)
		if(!name)
			continue
		if(seen[name])
			TEST_FAIL("The keybindings [binding_type] and [seen[name]] share the name [name].")
		seen[name] = binding_type
		if(!initial(binding_type.full_name))
			TEST_FAIL("The keybinding [binding_type] has no full name.")

