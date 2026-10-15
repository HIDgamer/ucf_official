GLOBAL_LIST_EMPTY(voice_pack_groups)
GLOBAL_LIST_INIT(voice_pack_list, gen_voice_packs())
/// Admin toggle for every talk sound
GLOBAL_VAR_INIT(voices_enabled, TRUE)

/proc/gen_voice_packs()
	var/list/packs = list()
	for(var/pack_type in subtypesof(/datum/voice_pack))
		var/datum/voice_pack/pack = new pack_type
		if(!pack.id)
			qdel(pack)
			continue
		for(var/index in 2 to 3)
			if(length(pack.sounds) < index)
				pack.sounds += pack.sounds[1]
		packs[pack.id] = pack
		LAZYADD(GLOB.voice_pack_groups[pack.group_name], pack)
	return packs

/// The voice packs a character can pick, display name = id, robot voices only for synthetics
/proc/get_voice_pack_choices(synthetic = FALSE)
	var/list/choices = list()
	for(var/pack_id in GLOB.voice_pack_list)
		var/datum/voice_pack/pack = GLOB.voice_pack_list[pack_id]
		if(pack.synth_only && !synthetic)
			continue
		choices[pack.display_name()] = pack_id
	return choices

/// A set of short sounds played as a character talks
/datum/voice_pack
	var/name
	var/id
	var/group_name
	/// Talk, ask and exclaim sounds, a missing ask or exclaim uses the talk sound
	var/list/sounds = list()
	var/max_pitch = VOICE_DEFAULT_MAXPITCH
	var/min_pitch = VOICE_DEFAULT_MINPITCH
	var/max_speed = VOICE_DEFAULT_MAXSPEED
	var/min_speed = VOICE_DEFAULT_MINSPEED
	var/volume = 1
	var/synth_only = FALSE

/datum/voice_pack/proc/display_name()
	return "[group_name]: [name]"

/datum/voice_pack/human
	group_name = "Human"

/datum/voice_pack/human/speak_1
	id = "goon.speak_1"
	name = "Speak 1"
	sounds = list('sound/voice/barks/goon/speak_1.ogg', 'sound/voice/barks/goon/speak_1_ask.ogg', 'sound/voice/barks/goon/speak_1_exclaim.ogg')

/datum/voice_pack/human/speak_2
	id = "goon.speak_2"
	name = "Speak 2"
	sounds = list('sound/voice/barks/goon/speak_2.ogg', 'sound/voice/barks/goon/speak_2_ask.ogg', 'sound/voice/barks/goon/speak_2_exclaim.ogg')

/datum/voice_pack/human/speak_3
	id = "goon.speak_3"
	name = "Speak 3"
	sounds = list('sound/voice/barks/goon/speak_3.ogg', 'sound/voice/barks/goon/speak_3_ask.ogg', 'sound/voice/barks/goon/speak_3_exclaim.ogg')

/datum/voice_pack/human/speak_4
	id = "goon.speak_4"
	name = "Speak 4"
	sounds = list('sound/voice/barks/goon/speak_4.ogg', 'sound/voice/barks/goon/speak_4_ask.ogg', 'sound/voice/barks/goon/speak_4_exclaim.ogg')

/datum/voice_pack/human/blub
	id = "goon.blub"
	name = "Blub"
	sounds = list('sound/voice/barks/goon/blub.ogg', 'sound/voice/barks/goon/blub_ask.ogg', 'sound/voice/barks/goon/blub_exclaim.ogg')

/datum/voice_pack/human/bottalk_1
	id = "goon.bottalk_1"
	name = "Bottalk 1"
	sounds = list('sound/voice/barks/goon/bottalk_1.ogg')

/datum/voice_pack/human/bottalk_2
	id = "goon.bottalk_2"
	name = "Bottalk 2"
	sounds = list('sound/voice/barks/goon/bottalk_2.ogg')

/datum/voice_pack/human/bottalk_3
	id = "goon.bottalk_3"
	name = "Bottalk 3"
	sounds = list('sound/voice/barks/goon/bottalk_3.ogg')

/datum/voice_pack/human/beep
	id = "misc.beep"
	name = "Beep"
	sounds = list('sound/voice/barks/misc/beep.ogg')
	max_pitch = 0.7
	max_speed = 4
	volume = 0.3

/datum/voice_pack/synthetic
	group_name = "Synthetic"
	synth_only = TRUE

/datum/voice_pack/synthetic/cyborg
	id = "goon.cyborg"
	name = "Cyborg"
	sounds = list('sound/voice/barks/goon/cyborg.ogg', 'sound/voice/barks/goon/cyborg_ask.ogg', 'sound/voice/barks/goon/cyborg_exclaim.ogg')

/datum/voice_pack/synthetic/ai
	id = "goon.radio_ai"
	name = "AI"
	sounds = list('sound/voice/barks/goon/radio_ai.ogg')

/datum/voice_pack/synthetic/radio
	id = "goon.radio"
	name = "Radio"
	sounds = list('sound/voice/barks/goon/radio.ogg')

/datum/voice_pack/synthetic/radio_two
	id = "goon.radio2"
	name = "Radio 2"
	sounds = list('sound/voice/barks/goon/radio2.ogg')

/datum/voice_pack/synthetic/machine
	id = "misc.synthetic"
	name = "Machine"
	sounds = list('sound/voice/barks/misc/synthetic.ogg')
	max_speed = 4
