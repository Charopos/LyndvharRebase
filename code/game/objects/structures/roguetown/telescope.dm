/obj/structure/telescope
	name = "telescope"
	desc = "A mysterious telescope pointing towards the stars. Peer through its glassy eye to \
	glimpse at what lies beyond the world's horizon."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "telescope"
	density = TRUE
	anchored = FALSE

/obj/structure/telescope/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Left-click the telescope to randomly glimpse at a notable star, planet, or astral presence.")

/obj/structure/telescope/attack_hand(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	var/random_message = pick("Noc's silvered glare soothes your mind..", "Astrata's fiery presence blinds you!", "Hermes's swifted orbit graces a shadow between Astrata and Noc..", "Kytheria's golden clouds swirl with blessed strife..", "Neoplx's saffiric glow wounds the heart with a sense of sudden somberness..", "Jove's bleeding vortex marrs its width with a crimson trail..", "Zuranus's shadowed presence looks upon you with eternal malice..", "Beowricke's worldly horizon reaches out as far as the telescope can see..", "You see a star!", "The stars smile upon you!", "Bands of starlight bedazzle the sky!")
	to_chat(H, span_notice("[random_message]"))

	if(random_message == "Astrata's fiery presence blinds you!")
		if(do_after(H, 25, target = src))
			var/obj/item/bodypart/affecting = H.get_bodypart("head")
			to_chat(H, span_warning("Astrata's blinding light causes you intense pain! Ow, fuck!"))
			if(affecting && affecting.receive_damage(0, 5))
				H.update_damage_overlays()
	if(random_message == "Noc's silvered glare soothes your mind..")
		if(do_after(H, 2.5 SECONDS, target = src))
			to_chat(H, span_rose("Noc's calming glow seems to help clear your thoughts.."))
			H.apply_status_effect(/datum/status_effect/buff/nocblessing)
	if(random_message == "Zuranus's shadowed presence looks upon you with eternal malice..")
		if(do_after(H, 2.5 SECONDS, target = src))
			to_chat(H, span_warning("You feel an otherworldly presence watching you.."))
			H.apply_status_effect(/datum/status_effect/debuff/dazed)

/obj/structure/globe
	name = "globe"
	desc = "A wooden globe representing the world. Key landmarks are indicated by adjacent \
	annotations; at a glance you can pick out 'Valoria', 'Grenzelhoft', 'Rhaenval', 'Greencrest', \
	and on the eastern coast of Lewyn, a modest peninsula marked as 'Draguippe', and there upon that peninsula is the city of Lyndvhar."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "globe"
	density = TRUE
	anchored = FALSE

/obj/structure/globe/attack_hand(mob/user)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	var/random_message = pick("You spin the globe!", "You land on the Draguippe!", "You land on Zybantu!", "You land on Rhaenval!", "You land on Greencrest!", "You land on Lyndhardtia!")
	to_chat(H, span_notice("[random_message]"))

/obj/structure/globe/get_mechanics_examine(mob/user)
	. = ..()
	. += span_info("Left-click the globe to spin it, before randomly landing on a notable kingdom or point of interest.")
