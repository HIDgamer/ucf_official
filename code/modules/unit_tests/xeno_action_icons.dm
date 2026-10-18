/// Every xeno ability button has an icon state in its icon file
/datum/unit_test/xeno_action_icons/Run()
	var/list/missing = list()
	for(var/path in subtypesof(/datum/action/xeno_action))
		var/datum/action/xeno_action/action_path = path
		var/state = initial(action_path.action_icon_state)
		if(isnull(state))
			continue
		if(!icon_exists(initial(action_path.icon_file), state))
			missing += "[path] \"[state]\""
	TEST_ASSERT(!length(missing), "Xeno actions with missing button icons:\n[missing.Join("\n")]")
