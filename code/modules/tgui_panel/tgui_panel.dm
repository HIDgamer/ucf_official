/*!
 * Copyright (c) 2020 Aleksej Komarov
 * SPDX-License-Identifier: MIT
 */

/**
 * tgui_panel datum
 * Hosts tgchat and other nice features.
 */
/datum/tgui_panel
	var/client/client
	var/datum/tgui_window/window
	var/broken = FALSE
	var/initialized_at
	var/next_highlight_sound = 0

/datum/tgui_panel/New(client/client, id)
	src.client = client
	window = new(client, id)
	window.subscribe(src, PROC_REF(on_message))

/datum/tgui_panel/Del()
	window.unsubscribe(src)
	window.close()
	return ..()

/**
 * public
 *
 * TRUE if panel is initialized and ready to receive messages.
 */
/datum/tgui_panel/proc/is_ready()
	return !broken && window.is_ready()

/**
 * public
 *
 * Initializes tgui panel.
 */
/datum/tgui_panel/proc/initialize(force = FALSE)
	set waitfor = FALSE
	// Minimal sleep to defer initialization to after client constructor
	sleep(1 TICKS)
	initialized_at = world.time
	// Perform a clean initialization
	window.initialize(
		strict_mode = TRUE,
		assets = list(
			get_asset_datum(/datum/asset/simple/tgui_panel),
		))
	window.send_asset(get_asset_datum(/datum/asset/simple/namespaced/fontawesome))
	window.send_asset(get_asset_datum(/datum/asset/simple/namespaced/tgfont))
	window.send_asset(get_asset_datum(/datum/asset/spritesheet/chat))
	// Other setup
	request_telemetry()
	addtimer(CALLBACK(src, PROC_REF(on_initialize_timed_out)), 5 SECONDS)

/**
 * private
 *
 * Called when initialization has timed out.
 */
/datum/tgui_panel/proc/on_initialize_timed_out()
	// Currently does nothing but sending a message to old chat.
	SEND_TEXT(client, "<span class=\"userdanger\">Failed to load fancy chat, click <a href='byond://?src=[REF(src)];reload_tguipanel=1'>HERE</a> to attempt to reload it.</span>")

/**
 * private
 *
 * Callback for handling incoming tgui messages.
 */
/datum/tgui_panel/proc/on_message(type, payload)
	if(type == "ready")
		broken = FALSE
		window.send_message("update", list(
			"config" = list(
				"client" = list(
					"ckey" = client.ckey,
					"address" = client.address,
					"computer_id" = client.computer_id,
				),
				"window" = list(
					"fancy" = FALSE,
					"locked" = FALSE,
				),
			),
		))
		send_player_info()
		return TRUE
// Deprecated due to removal of old sound play commands
//	if(type == "audio/setAdminMusicVolume")
//		client.admin_music_volume = payload["volume"]
//		return TRUE
	if(type == "telemetry")
		analyze_telemetry(payload)
		return TRUE
	if(type == "chat/highlight_sound")
		play_highlight_sound(payload)
		return TRUE
	if(type == "act/ping_relays")
		ping_relays()
		return TRUE

/**
 * public
 *
 * Sends a round restart notification.
 */
/datum/tgui_panel/proc/send_roundrestart()
	window.send_message("roundrestart")

/// Sounds the chat panel may ask to have played when a highlight matches
GLOBAL_LIST_INIT(chat_highlight_sounds, list(
	"sound/misc/highlight_sounds/Beep.ogg" = 'sound/misc/highlight_sounds/Beep.ogg',
))

/**
 * public
 *
 * Sends the client's current job, character and saved character names,
 * used for conditional chat highlights.
 */
/datum/tgui_panel/proc/send_player_info()
	if(broken || !window)
		return
	window.send_message("player/set", list(
		"job" = client.mob?.job,
		"character" = client.mob?.real_name || client.prefs?.real_name,
		"characters" = client.prefs?.get_saved_character_names(),
	))

/// Plays one of the allowed highlight sounds for the client, at most once every couple of seconds
/datum/tgui_panel/proc/play_highlight_sound(list/payload)
	if(!islist(payload) || world.time < next_highlight_sound)
		return
	var/sound_file = payload["file"]
	if(!istext(sound_file) || !GLOB.chat_highlight_sounds[sound_file])
		return
	var/volume = text2num(payload["volume"])
	if(!isnum(volume))
		volume = 0.5
	next_highlight_sound = world.time + 2 SECONDS
	playsound_client(client, GLOB.chat_highlight_sounds[sound_file], vol = clamp(volume, 0, 1) * 100)
