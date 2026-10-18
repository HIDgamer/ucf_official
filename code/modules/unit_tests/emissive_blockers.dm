/// How many overlays of this atom sit on the emissive plane
/datum/unit_test/emissive_blockers/proc/count_blockers(atom/movable/thing)
	var/count = 0
	for(var/image/overlay as anything in thing.overlays)
		if(overlay.plane == EMISSIVE_PLANE)
			count++
	return count

/datum/unit_test/emissive_blockers/Run()
	var/turf/here = run_loc_floor_bottom_left
	var/obj/structure/closet/closet = allocate(/obj/structure/closet, here)
	TEST_ASSERT_EQUAL(count_blockers(closet), 1, "A closet should block emissives with one overlay")
	var/obj/item/paper/paper = allocate(/obj/item/paper, here)
	TEST_ASSERT_EQUAL(count_blockers(paper), 1, "A paper should block emissives with one overlay")
	paper.blocks_emissive = EMISSIVE_BLOCK_NONE
	paper.refresh_emissive_block()
	TEST_ASSERT_EQUAL(count_blockers(paper), 0, "A paper that blocks nothing still has a blocker")
	paper.blocks_emissive = EMISSIVE_BLOCK_GENERIC
	paper.refresh_emissive_block()
	paper.refresh_emissive_block()
	TEST_ASSERT_EQUAL(count_blockers(paper), 1, "Refreshing the paper stacked up blockers")
	var/mob/living/carbon/human/human = allocate(/mob/living/carbon/human, here)
	TEST_ASSERT_NOTNULL(human.em_block, "A human has no unique emissive blocker")
	TEST_ASSERT(count_blockers(human) >= 1, "A human does not block emissives")
	human.blocks_emissive = EMISSIVE_BLOCK_NONE
	human.refresh_emissive_block()
	for(var/obj/limb/limb as anything in human.limbs)
		limb.blocks_emissive = EMISSIVE_BLOCK_NONE
	human.update_body()
	TEST_ASSERT_EQUAL(count_blockers(human), 0, "A human that blocks nothing still has a blocker")
