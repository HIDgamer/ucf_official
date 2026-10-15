/// How a character's talk sounds are played
/datum/atom_voice
	var/datum/voice_pack/voicepack
	/// Used instead of the voice pack when the speaker is a synthetic
	var/datum/voice_pack/synth_voicepack
	var/datum/voice_pack/active_pack
	var/pitch = 1
	/// Each sound is played at the pitch plus or minus half of this
	var/pitch_range = 0.2
	/// Lower values are faster
	var/speed = 6
	var/long_bark_serial = 0

/datum/atom_voice/proc/set_voice_pack(id, synthetic = FALSE)
	var/datum/voice_pack/pack = GLOB.voice_pack_list[id]
	if(synthetic)
		synth_voicepack = pack || GLOB.voice_pack_list[VOICE_DEFAULT_SYNTH_PACK]
		return
	if(!pack || pack.synth_only)
		pack = GLOB.voice_pack_list[VOICE_DEFAULT_PACK]
	voicepack = pack

/datum/atom_voice/proc/set_from_prefs(datum/preferences/prefs)
	set_voice_pack(prefs.voice_pack)
	set_voice_pack(prefs.synth_voice_pack, synthetic = TRUE)
	pitch = prefs.voice_pitch
	speed = prefs.voice_speed
	pitch_range = prefs.voice_pitch_range

/datum/atom_voice/proc/get_volume(datum/voice_pack/pack, is_yell)
	return clamp(VOICE_BASE_VOLUME * pack.volume * (is_yell ? 1.25 : 1), 0, 100)

/// Plays the talk sounds for a spoken message to the clients that hear it
/datum/atom_voice/proc/start_barking(message, list/hearers, talk_icon_state, atom/movable/speaker, over_radio = FALSE)
	var/datum/voice_pack/pack = over_radio ? GLOB.voice_pack_list[VOICE_RADIO_PACK] : (issynth(speaker) ? synth_voicepack : voicepack)
	if(!pack || !GLOB.voices_enabled || SSlag_switch.measures[DISABLE_TALK_SOUNDS] || !length(message))
		return
	var/list/client/listeners = list()
	for(var/mob/hearer in hearers)
		if(hearer.client)
			listeners += hearer.client
	if(!length(listeners))
		return
	var/is_yell = talk_icon_state == "2"
	long_bark(pack, listeners, get_turf(speaker), get_volume(pack, is_yell), is_yell, length(message))

/// A run of sounds that is cut off when the next message starts
/datum/atom_voice/proc/long_bark(datum/voice_pack/pack, list/client/listeners, turf/source, volume, is_yell, message_len)
	active_pack = pack
	var/vocal_speed = clamp(speed, pack.min_speed, pack.max_speed)
	var/base_ticks = max(round(vocal_speed / 4 / world.tick_lag), 1)
	var/num_barks = min(round(message_len / vocal_speed), 24)
	var/serial = ++long_bark_serial
	var/total_delay = 0
	for(var/index in 0 to num_barks)
		if(total_delay > 1.5 SECONDS)
			break
		addtimer(CALLBACK(src, PROC_REF(short_bark), listeners, source, volume, serial), total_delay)
		total_delay += (base_ticks + rand(0, round(base_ticks * (is_yell ? 0.5 : 1)))) * world.tick_lag

/datum/atom_voice/proc/short_bark(list/client/listeners, turf/source, volume, serial)
	if(serial != long_bark_serial || !active_pack)
		return
	var/datum/sound_template/template = new
	template.file = active_pack.sounds[1]
	template.channel = get_free_channel()
	template.volume = volume
	template.volume_cat = VOLUME_VOICE
	template.frequency = clamp(pitch + rand(pitch_range * -50, pitch_range * 50) / 100, active_pack.min_pitch, active_pack.max_pitch)
	template.falloff = 2
	if(source)
		template.x = source.x
		template.y = source.y
		template.z = source.z
	SSsound.queue(template, listeners.Copy())

/// Plays a sample of the human or the synthetic voice to one client
/datum/atom_voice/proc/preview(client/target, synthetic = FALSE)
	var/datum/voice_pack/pack = synthetic ? synth_voicepack : voicepack
	if(!pack || !target)
		return
	long_bark(pack, list(target), null, get_volume(pack, FALSE), FALSE, 32)

/// Humans have talk sounds taken from their character preferences
/mob/living/carbon/human/proc/set_voice_from_prefs(datum/preferences/prefs)
	if(!bark_voice)
		bark_voice = new
	bark_voice.set_from_prefs(prefs)

/datum/preferences/proc/preview_voice(mob/user, synthetic = FALSE)
	if(!user?.client || !COOLDOWN_FINISHED(src, voice_preview_cooldown))
		return
	COOLDOWN_START(src, voice_preview_cooldown, 2 SECONDS)
	var/datum/atom_voice/sample = new
	sample.set_from_prefs(src)
	sample.preview(user.client, synthetic)

/datum/admins/proc/toggle_voices()
	set name = "Toggle Talk Sounds"
	set category = "Server"
	set desc = "Turns every character's talk sounds on or off."

	GLOB.voices_enabled = !GLOB.voices_enabled
	to_world(SPAN_BOLDNOTICE("Talk sounds have been globally [GLOB.voices_enabled ? "enabled" : "disabled"]."))
	message_admins("[key_name_admin(usr)] toggled talk sounds [GLOB.voices_enabled ? "on" : "off"].")
