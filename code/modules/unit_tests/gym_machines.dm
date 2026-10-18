/datum/unit_test/gym_machines/Run()
	var/turf/here = run_loc_floor_bottom_left
	var/list/machine_types = list(
		/obj/structure/punching_bag,
		/obj/structure/weightmachine/stacklifter,
		/obj/structure/weightmachine/weightlifter,
		/obj/structure/machinery/treadmill,
		/obj/structure/machinery/treadmill/console,
	)
	for(var/path in machine_types)
		var/obj/machine = allocate(path, here)
		TEST_ASSERT(icon_exists(machine.icon, machine.icon_state), "[path] has no sprite [machine.icon_state] in [machine.icon]")
		qdel(machine)
	for(var/path in typesof(/obj/structure/weightmachine) - /obj/structure/weightmachine)
		var/obj/structure/weightmachine/machine = allocate(path, here)
		TEST_ASSERT(icon_exists(machine.icon, machine.icon_state_inuse), "[path] has no sprite [machine.icon_state_inuse]")
		qdel(machine)

	var/mob/living/carbon/human/lifter = allocate(/mob/living/carbon/human, get_step(here, EAST))
	lifter.create_hud()
	var/obj/structure/punching_bag/bag = allocate(/obj/structure/punching_bag, get_step(here, NORTH))
	bag.attack_hand(lifter)
	var/obj/structure/weightmachine/stacklifter/stacklifter = allocate(/obj/structure/weightmachine/stacklifter, get_step(here, SOUTH))
	stacklifter.attack_hand(lifter)
	TEST_ASSERT(!stacklifter.in_use, "The stack lifter was left in use")
	TEST_ASSERT_EQUAL(lifter.loc, stacklifter.loc, "The lifter was not put on the stack lifter")
	TEST_ASSERT_EQUAL(lifter.pixel_z, 0, "The lifter was left floating by the stack lifter")
	TEST_ASSERT_EQUAL(stacklifter.icon_state, "fitnesslifter", "The stack lifter kept its in use sprite")

	var/turf/back_turf = locate(here.x + 3, here.y + 3, here.z)
	var/turf/console_turf = get_step(back_turf, SOUTH)
	var/obj/structure/machinery/treadmill/back = allocate(/obj/structure/machinery/treadmill, back_turf)
	var/obj/structure/machinery/treadmill/console/console = allocate(/obj/structure/machinery/treadmill/console, console_turf)
	TEST_ASSERT_EQUAL(console.second_half_ref?.resolve(), back, "The treadmill console did not find its other half")
	TEST_ASSERT_EQUAL(back.second_half_ref?.resolve(), console, "The treadmill did not find its console")
	console.stat = 0
	back.stat = 0
	console.toggle_running()
	TEST_ASSERT(console.machine_processing && back.machine_processing, "The console did not start both halves")
	console.toggle_running()
	TEST_ASSERT(!console.machine_processing && !back.machine_processing, "The console did not stop both halves")
	qdel(console)
	TEST_ASSERT(QDELETED(back), "Losing the console left the other half behind")
