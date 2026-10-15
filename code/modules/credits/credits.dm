#define CREDIT_ROLL_SPEED (18 SECONDS)
#define CREDIT_SPAWN_SPEED (1 SECONDS)
#define CREDIT_ANIMATE_HEIGHT (32 * world.icon_size)
#define CREDIT_EASE_DURATION (2.2 SECONDS)
#define CREDIT_MAX_CAST 24

GLOBAL_LIST_INIT(credit_disclaimers, list(
	"No xenomorphs were harmed in the making of this operation, they were harmed in the making of the marines.",
	"Any resemblance to actual military procedure is purely accidental.",
	"The Weyland-Yutani Corporation is not liable for acid burns, lost limbs, or lost dignity.",
	"All sprites were created by trained professionals. Do not try this at home.",
	"The Requisitions department would like to remind you that the budget was not a suggestion.",
	"Marines are advised that the xenomorph did not start it.",
	"The Synthetic was fully compliant at the time of filming.",
	"No ASRS crates were safe during production.",
))

/// Clients that hid the credits for the current roll
GLOBAL_LIST_EMPTY(credits_hidden_clients)

/proc/get_credit_episode_name()
	var/list/names
	switch(SSticker.mode?.round_finished)
		if(MODE_INFESTATION_M_MAJOR, MODE_BATTLEFIELD_M_MAJOR)
			names = list("THE HIVE FALLS", "NOTHING LEFT TO BURN", "SEMPER FI, ALWAYS", "CLEAN SWEEP", "THE LONG WAY HOME")
		if(MODE_INFESTATION_M_MINOR, MODE_BATTLEFIELD_M_MINOR)
			names = list("A COSTLY VICTORY", "BARELY STANDING", "THE SURVIVORS", "HELL OF A SHIFT", "WE TOOK THE LZ")
		if(MODE_INFESTATION_X_MAJOR, MODE_BATTLEFIELD_W_MAJOR)
			names = list("THE HIVE RISES", "NO ONE LEFT TO SCREAM", "GAME OVER, MAN", "ALL QUIET ON THE SHIP", "THEY CAME FOR THE MARINES")
		if(MODE_INFESTATION_X_MINOR, MODE_BATTLEFIELD_W_MINOR)
			names = list("A BAD DAY", "THE HIVE SURVIVES", "WHAT WENT WRONG", "THE ONES THAT GOT AWAY", "SHOULD HAVE STAYED ASLEEP")
		if(MODE_INFECTION_ZOMBIE_WIN)
			names = list("THE DEAD WALK", "ZERO HOUR", "SOMETHING IN THE AIR", "PATIENT ZERO")
		if(MODE_GENERIC_DRAW_NUKE)
			names = list("THE LAST LIGHT", "A VERY BIG MISTAKE", "BURN IT ALL DOWN")
		else
			names = list("MUTUAL DESTRUCTION", "NOBODY WINS", "THE QUIET AFTERWARD", "STALEMATE", "WHAT ELSE IS NEW")
	return pick(names)

/proc/build_credit_lines()
	var/list/lines = list()
	var/datum/entity/statistic/round/stats = GLOB.round_statistics
	var/operation = stats?.round_name || "Unnamed Operation"
	lines += "<center><b>[uppertext(operation)]</b></center>"
	lines += "<center>[get_credit_episode_name()]</center>"
	lines += "<center>[SSticker.mode?.round_finished || "The round has ended"]</center>"

	var/list/cast = list()
	for(var/mob/living/carbon/human/human as anything in GLOB.human_mob_list)
		if(!human.mind || !human.job || QDELETED(human))
			continue
		cast += "[human.real_name] as [human.job][human.stat == DEAD ? " (deceased)" : ""]"
	if(length(cast))
		lines += "<center><b>STARRING</b></center>"
		cast = shuffle(cast)
		for(var/index in 1 to min(length(cast), CREDIT_MAX_CAST))
			lines += "<center>[cast[index]]</center>"

	lines += "<center><b>BY THE NUMBERS</b></center>"
	lines += "<center>Operation length: [DisplayTimeText(world.time - SSticker.round_start_time)]</center>"
	if(stats)
		lines += "<center>Marines lost: [length(stats.marine_deaths)]</center>"
		lines += "<center>Xenomorphs slain: [length(stats.xeno_deaths)]</center>"
		lines += "<center>Rounds fired: [stats.total_projectiles_fired]</center>"
		lines += "<center>Friendly fire incidents: [stats.total_friendly_fire_instances]</center>"

	var/list/disclaimers = shuffle(GLOB.credit_disclaimers.Copy())
	lines += "<center><b>DISCLAIMERS</b></center>"
	for(var/index in 1 to 3)
		lines += "<center>[disclaimers[index]]</center>"
	lines += "<center><b>THANK YOU FOR PLAYING</b></center>"
	return lines

/proc/roll_credits()
	set waitfor = FALSE

	GLOB.credits_hidden_clients.Cut()
	var/list/lines = build_credit_lines()
	for(var/client/viewer in GLOB.clients)
		if(viewer.prefs?.show_roundend_credits)
			add_verb(viewer, /client/proc/hide_credits)
	for(var/line in lines)
		new /atom/movable/screen/credit(null, line)
		sleep(CREDIT_SPAWN_SPEED)
	sleep(CREDIT_ROLL_SPEED)
	for(var/client/viewer in GLOB.clients)
		remove_verb(viewer, /client/proc/hide_credits)
	GLOB.credits_hidden_clients.Cut()

/client/proc/hide_credits()
	set name = "Hide Credits"
	set category = "OOC"

	remove_verb(src, /client/proc/hide_credits)
	GLOB.credits_hidden_clients += src
	for(var/atom/movable/screen/credit/credit in screen)
		remove_from_screen(credit)

/atom/movable/screen/credit
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	alpha = 0
	plane = CINEMATIC_PLANE
	layer = CINEMATIC_LAYER
	screen_loc = "CENTER-6:16,BOTTOM"
	var/matrix/target

/atom/movable/screen/credit/Initialize(mapload, credited)
	. = ..()
	maptext = MAPTEXT(credited)
	maptext_width = world.icon_size * 12
	maptext_height = world.icon_size * 2
	var/matrix/rolled = matrix(transform)
	rolled.Translate(0, CREDIT_ANIMATE_HEIGHT)
	animate(src, transform = rolled, time = CREDIT_ROLL_SPEED)
	target = rolled
	animate(src, alpha = 255, time = CREDIT_EASE_DURATION, flags = ANIMATION_PARALLEL)
	addtimer(CALLBACK(src, PROC_REF(fade_out)), CREDIT_ROLL_SPEED - CREDIT_EASE_DURATION)
	INVOKE_ASYNC(src, PROC_REF(show_to_players))
	QDEL_IN(src, CREDIT_ROLL_SPEED)

/atom/movable/screen/credit/Destroy()
	target = null
	return ..()

/atom/movable/screen/credit/proc/fade_out()
	animate(src, alpha = 0, transform = target, time = CREDIT_EASE_DURATION)

/atom/movable/screen/credit/proc/show_to_players()
	for(var/client/viewer in GLOB.clients)
		if((viewer in GLOB.credits_hidden_clients) || !viewer.prefs?.show_roundend_credits)
			continue
		viewer.add_to_screen(src)

#undef CREDIT_ROLL_SPEED
#undef CREDIT_SPAWN_SPEED
#undef CREDIT_ANIMATE_HEIGHT
#undef CREDIT_EASE_DURATION
#undef CREDIT_MAX_CAST
