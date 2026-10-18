/particles/smoke
	icon = 'icons/effects/particles/smoke.dmi'
	icon_state = list("smoke_1" = 1, "smoke_2" = 1, "smoke_3" = 2)
	width = 100
	height = 100
	count = 1000
	spawning = 4
	lifespan = 1.5 SECONDS
	fade = 1 SECONDS
	velocity = list(0, 0.4, 0)
	position = list(6, 0, 0)
	drift = generator(GEN_SPHERE, 0, 2, NORMAL_RAND)
	friction = 0.2
	gravity = list(0, 0.95)
	grow = 0.05

/particles/smoke/steam
	icon_state = list("steam_1" = 1, "steam_2" = 1, "steam_3" = 2)
	fade = 1.5 SECONDS

/particles/smoke/steam/mild
	spawning = 1
	velocity = list(0, 0.3, 0)
	friction = 0.25

/particles/smoke/steam/bad
	icon_state = list("steam_1" = 1, "smoke_1" = 1, "smoke_2" = 1, "smoke_3" = 1)
	spawning = 2
	velocity = list(0, 0.25, 0)

/datum/looping_sound/grill
	mid_sounds = list('sound/machines/grill/grillsizzle.ogg')
	mid_length = 1.5 SECONDS
	volume = 40

/datum/looping_sound/oven
	start_sound = 'sound/machines/oven/oven_loop_start.ogg'
	start_length = 1 SECONDS
	mid_sounds = list('sound/machines/oven/oven_loop_mid.ogg')
	mid_length = 2 SECONDS
	end_sound = 'sound/machines/oven/oven_loop_end.ogg'
	volume = 60

/datum/looping_sound/deep_fryer
	start_sound = 'sound/machines/fryer/deep_fryer_immerse.ogg'
	start_length = 1 SECONDS
	mid_sounds = list(
		'sound/machines/fryer/deep_fryer_1.ogg',
		'sound/machines/fryer/deep_fryer_2.ogg',
	)
	mid_length = 2 SECONDS
	end_sound = 'sound/machines/fryer/deep_fryer_emerge.ogg'
	volume = 30
