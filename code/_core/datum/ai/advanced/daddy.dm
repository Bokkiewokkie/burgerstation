/ai/advanced/daddy

	objective_delay = 10
	attack_delay = 1

	var/next_chat_time = 0

/ai/advanced/daddy/handle_objectives()

	. = ..()

	if(objective_attack && next_chat_time <= world.time)
		var/list/possible_phrases = list(
			"HE'S BACK.",
			"48 VITALITY. 66 ENDURANCE. 12 ATTUNEMENT. 16 FUCKING STRENGTH.",
			"GIANTS. GIANTS. GIANTS.",
			"STAMINA. HEALTH. ENDURANCE. EVERYTHING YOU COULD EVER WANT.",
			"WELL, WHAT IS IT?"
		)
		owner.say(pick(possible_phrases))
		next_chat_time = world.time + SECONDS_TO_DECISECONDS(5)

	return .

/ai/advanced/daddy/attack_message()
	owner.say("POW.")
