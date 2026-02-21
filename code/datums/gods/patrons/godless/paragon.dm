/datum/patron/godless/paragon
	name = "Paragon"
	domain = "Ontological Reality"
	desc = "A sect of Apostasy only reserved for either the truly mad or most self absorbed of narcissists. This is a firm rooted belief that the individual themself is a true divine being, and that all should kowtow before their own strength, so that in death they may ascend to the higher plane of existence and rule as divinity themself. Very little adheres to this sect of belief, though it is sometimes found in some truly deranged Eskallian-Dracanae or powerful Magi."
	worshippers = "Dracanae, Powerful Magi, some Khazumians"
	associated_faith = /datum/faith/godless
	mob_traits = list(TRAIT_NOFAITHHEAL)
	preference_accessible = TRUE
	undead_hater = FALSE
	confess_lines = list(
		"I AM A GOD!",
		"YOU SPEAK TO A TRUE DIVINE BEING!",
		"YOU ARE NOTHING BEFORE MY DIVINITY!",
		"NO GODS, NO MASTERS!",
	)


/datum/patron/godless/paragon/can_pray(mob/living/follower)
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
