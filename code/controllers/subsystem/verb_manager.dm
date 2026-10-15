/// Runs verbs that were delayed to the next tick because the server was overloaded, without yielding
SUBSYSTEM_DEF(verb_manager)
	name = "Verb Manager"
	wait = 1
	flags = SS_TICKER | SS_NO_INIT
	priority = SS_PRIORITY_DELAYED_VERBS
	runlevels = RUNLEVEL_INIT | RUNLEVELS_DEFAULT

	var/list/datum/callback/verb_callback/verb_queue = list()
	/// Running average of verbs executed per second
	var/verbs_executed_per_second = 0
	/// Admins normally run verbs immediately
	var/can_queue_admin_verbs = FALSE
	/// Every verb runs immediately and nothing is queued
	var/immediately_execute_all_verbs = FALSE
	var/always_queue = FALSE

/// Queues the callback for the next tick when the server is overloaded, returns TRUE if it was queued
/proc/_queue_verb(datum/callback/verb_callback/incoming_callback, tick_check, datum/controller/subsystem/verb_manager/subsystem_to_use)
	subsystem_to_use ||= SSverb_manager
	if(QDELETED(incoming_callback) || QDELETED(usr) || !istype(subsystem_to_use))
		return FALSE
	if(!istext(incoming_callback.object) && QDELETED(incoming_callback.object))
		return FALSE
	if(TICK_USAGE < tick_check && !subsystem_to_use.always_queue)
		return FALSE
	if(!subsystem_to_use.can_queue_verb(incoming_callback))
		return FALSE
	return subsystem_to_use.queue_verb(incoming_callback)

/proc/queue_or_call_verb(datum/callback/verb_callback/incoming_callback, tick_check, datum/controller/subsystem/verb_manager/subsystem_to_use)
	if(!_queue_verb(incoming_callback, tick_check, subsystem_to_use))
		incoming_callback.InvokeAsync()

/datum/controller/subsystem/verb_manager/proc/can_queue_verb(datum/callback/verb_callback/incoming_callback)
	if(immediately_execute_all_verbs)
		return FALSE
	if(always_queue)
		return TRUE
	if(usr.client?.admin_holder && !can_queue_admin_verbs)
		return FALSE
	if(!initialized && !(flags & SS_NO_INIT))
		return FALSE
	return !!(runlevels & Master.current_runlevel)

/datum/controller/subsystem/verb_manager/proc/queue_verb(datum/callback/verb_callback/incoming_callback)
	verb_queue += incoming_callback
	return TRUE

/datum/controller/subsystem/verb_manager/fire(resumed)
	run_verb_queue()

/datum/controller/subsystem/verb_manager/proc/run_verb_queue()
	var/executed_verbs = 0
	for(var/datum/callback/verb_callback/queued as anything in verb_queue)
		if(!istype(queued))
			continue
		queued.InvokeAsync()
		executed_verbs++
	verb_queue.Cut()
	verbs_executed_per_second = MC_AVG_SECONDS(verbs_executed_per_second, executed_verbs, wait SECONDS)

/datum/controller/subsystem/verb_manager/stat_entry(msg)
	return ..("V/S:[round(verbs_executed_per_second, 0.01)]")
