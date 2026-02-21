/datum/patron/godless/faithless
	name = "Faithless"
	domain = "Ontological Reality"
	desc = "A sect of Apostasy rooted in the belief that there is no actual higher state of being and that all fluctuations are caused by natural phenomena. Rather rare to find, as it's usually cemented in blasphemous belief or simple stubborn stigma."
	worshippers = "Extremely stubborn fools, dwarves, scientists"
	associated_faith = /datum/faith/godless
	mob_traits = list(TRAIT_NOFAITHHEAL)
	preference_accessible = TRUE
	undead_hater = FALSE
	confess_lines = list(
		"Gods are not real!",
		"There is no such thing!",
		"I am no believer!",
		"NO GODS, NO MASTERS!",
	)


/datum/patron/godless/faithless/can_pray(mob/living/follower)
	. = ..()
	to_chat(follower, span_danger("To whom would I even pray? To myself? Bah.."))
	return FALSE	//heathen

/datum/patron/godless/on_lesser_heal(
    mob/living/user,
    mob/living/target,
    message_out,
    message_self,
    conditional_buff,
    situational_bonus
)
	*message_out = span_info("Without any particular cause or reason, [target] is healed!")
	*message_self = span_notice("My wounds close without cause.")
