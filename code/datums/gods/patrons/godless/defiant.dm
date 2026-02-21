/datum/patron/godless/defiant
	name = "Defiant"
	domain = "Ontological Reality"
	desc = "A sect of Apostasy that firmly believes that while divine beings do exist and have existed that they will not be tied to any of them and will live their own viewpoint as they see fit- earning their place through their deeds and actions alone, be they good or bad. This is a rather popular and famous practice in the Grenzelhoftian territories, where prestige and knightly chivalry comes from acts and deeds of worth."
	worshippers = "Grenzelhoftians, Narcissists, and free spirits"
	associated_faith = /datum/faith/godless
	mob_traits = list(TRAIT_NOFAITHHEAL)
	preference_accessible = TRUE
	undead_hater = FALSE
	confess_lines = list(
		"Gods are WORTHLESS!",
		"I DON'T NEED GODS!",
		"I AM MY OWN GOD!",
		"NO GODS, NO MASTERS!",
	)


/datum/patron/godless/defiant/can_pray(mob/living/follower)
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
