/datum/advclass/wretch/heretic
	name = "Heretic"
	tutorial = "You father your unholy cause through the most time-tested of ways: hard, heavy steel in both arms and armor."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/wretch/heretic
	category_tags = list(CTAG_WRETCH)
	traits_applied = list(TRAIT_RITUALIST, TRAIT_HEAVYARMOR)
	maximum_possible_slots = 2 //Ppl dont like heavy armor antags.
	// Heretic is by far the best class with access to rituals (as long as they play a god with ritual), holy and heavy armor. So they keep 7 points.
subclass_stats = list(
		STATKEY_STR = 2,
		STATKEY_CON = 3,
		STATKEY_WIL = 1,
		STATKEY_INT = 2,
		STATKEY_SPD = -1
	)
	subclass_skills = list(
		/datum/skill/magic/holy = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
	)
	subclass_stashed_items = list(
        "Armor Plates" =  /obj/item/repair_kit/metal,
    )

	extra_context = "This subclass gain the Wound Heal miracle and the Convert Heretic spell."

/datum/outfit/job/roguetown/wretch/heretic
	has_loadout = TRUE
	allowed_patrons = ALL_INHUMEN_PATRONS

/datum/outfit/job/roguetown/wretch/heretic/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("You father your unholy cause through the most time-tested of ways: hard, heavy steel in both arms and armor."))
	H.set_blindness(0)
	if(H.mind)
		H.mind?.current.faction += "[H.name]_faction"
		var/weapons = list("Longsword", "Mace", "Flail", "Axe", "Billhook")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		switch(weapon_choice)
			if("Longsword")
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
				beltr = /obj/item/rogueweapon/scabbard/sword
				if(HAS_TRAIT(H, TRAIT_PSYDONIAN_GRIT))
					r_hand = /obj/item/rogueweapon/sword/long/psysword
				else
					r_hand = /obj/item/rogueweapon/sword/long
			if("Mace")
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT, TRUE)
				if(HAS_TRAIT(H, TRAIT_PSYDONIAN_GRIT))
					beltr = /obj/item/rogueweapon/mace/goden/psymace
				else
					beltr = /obj/item/rogueweapon/mace/steel
			if("Flail")
				H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_EXPERT, TRUE)
				if(HAS_TRAIT(H, TRAIT_PSYDONIAN_GRIT))
					beltr = /obj/item/rogueweapon/flail/sflail/psyflail
				else
					beltr = /obj/item/rogueweapon/flail/sflail
			if("Axe")
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_EXPERT, TRUE)
				if(HAS_TRAIT(H, TRAIT_PSYDONIAN_GRIT))
					beltr = /obj/item/rogueweapon/stoneaxe/battle/psyaxe
				else
					beltr = /obj/item/rogueweapon/stoneaxe/woodcut/steel
			if("Billhook")
				l_hand = /obj/item/rogueweapon/scabbard/gwstrap
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE)
				if(HAS_TRAIT(H, TRAIT_PSYDONIAN_GRIT))
					r_hand = /obj/item/rogueweapon/spear/psyspear
				else
					r_hand = /obj/item/rogueweapon/spear/billhook
		var/datum/devotion/C = new /datum/devotion(H, H.patron)
		C.grant_miracles(H, cleric_tier = CLERIC_T2, passive_gain = CLERIC_REGEN_MINOR, start_maxed = TRUE)	//Minor regen, starts maxed out.
		wretch_select_bounty(H)

	// You can convert those the church has shunned.
	H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/convert_heretic)
	H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/wound_heal)
	if (istype (H.patron, /datum/patron/inhumen/zizo))
		if(H.mind)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/minion_order)
			H.verbs |= /mob/living/carbon/human/proc/revelations
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/gravemark)
			H.mind?.current.faction += "[H.name]_faction"
		ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	neck = /obj/item/clothing/neck/roguetown/gorget
	pants = /obj/item/clothing/under/roguetown/chainlegs
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/shield/tower/metal
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/rogueweapon/huntingknife
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/ritechalk = 1,
		/obj/item/flashlight/flare/torch/lantern/prelit = 1,
		/obj/item/rope/chain = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot = 1,	//Small health vial
		)
/datum/outfit/job/roguetown/wretch/heretic/choose_loadout(mob/living/carbon/human/H)
	. = ..()

		// This list exists here so it can be overwritten later. This is really stupid and should probably
		// be done in the pre-equip. Too bad!
	var/helmets = list(
			"Pigface Bascinet" 	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
			"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
			"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
			"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
			"Knight Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
			"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
			"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
			"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
			"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/calmirixia,
			"Slitted Kettle" = /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle,
			"None"
		)

	switch(H.patron?.type)
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_heretic.ogg'
		if(/datum/patron/inhumen/matthios)
			H.cmode_music = 'sound/music/combat_matthios.ogg'
		if(/datum/patron/inhumen/baotha)
			H.cmode_music = 'sound/music/combat_baotha.ogg'
		if(/datum/patron/inhumen/graggar)
			H.cmode_music = 'sound/music/combat_graggar.ogg'
	if(H.mind)
		var/helmchoice = input(H, "Choose your Helm.", "TAKE UP HELMS") as anything in helmets

		if(helmchoice != "None")
			var/helmet = helmets[helmchoice]
			H.equip_to_slot_if_possible(new helmet, SLOT_HEAD)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/roguetown/armor/plate/cuirass, SLOT_ARMOR, TRUE)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk, SLOT_SHIRT, TRUE)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/roguetown/chain, SLOT_GLOVES, TRUE)
	H.equip_to_slot_or_del(new /obj/item/clothing/wrists/roguetown/bracers, SLOT_WRISTS, TRUE)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/roguetown/boots/armor, SLOT_SHOES, TRUE)

/obj/effect/proc_holder/spell/invoked/convert_heretic
	name = "Convert The Downtrodden"
	desc = "Convert an soul excommunicated, cursed, or forced onto apotasy to your cause. Requires a willing participant, and takes a long time to cast."
	invocations = list("Show this lost sheep the righteous path.")
	invocation_type = "whisper"
	sound = 'sound/magic/bless.ogg'
	devotion_cost = 100
	recharge_time = 20 MINUTES
	// Long to prevent combat casting and forcing popups.
	chargetime = 10 SECONDS
	associated_skill = /datum/skill/magic/holy
	overlay_state = "convert_heretic"

/obj/effect/proc_holder/spell/invoked/convert_heretic/cast(list/targets, mob/living/carbon/human/user)
	if(!HAS_TRAIT(user, TRAIT_HERESIARCH))
		to_chat(user, span_warning("You lack the knowledge for this ritual."))
		return FALSE

	var/mob/living/carbon/human/target = targets[1]

	if(!ishuman(target))
		revert_cast()
		return FALSE

	if(target.cmode)
		revert_cast()
		return FALSE

	//This SHOULD stop most heretics from being convertible and self-curing should they somehow get cursed in the future.
	if(HAS_TRAIT(target, TRAIT_HERESIARCH))
		to_chat(user, span_warning("[target] is already serving the greater good."))
		revert_cast()
		return FALSE

	if(alert(target, "[user.real_name] is trying to convert you to their patron, [user.patron.name]. Do you accept?", "Conversion Request", "Yes", "No") != "Yes")
		to_chat(user, span_warning("[target] refused your offer of conversion."))
		revert_cast()
		return FALSE

	var/absolvable = FALSE
	// Check if target qualifies for absolving
	if(HAS_TRAIT(target, TRAIT_EXCOMMUNICATED))
		absolvable = TRUE

	if(target.has_status_effect(/datum/status_effect/debuff/apostasy))
		target.remove_status_effect(/datum/status_effect/debuff/apostasy)
		absolvable = TRUE

	// Remove from global lists
	if(target.real_name in GLOB.apostasy_players)
		GLOB.apostasy_players -= target.real_name
		absolvable = TRUE
	if(target.real_name in GLOB.excommunicated_players)
		GLOB.excommunicated_players -= target.real_name
		absolvable = TRUE

	if(!absolvable)
		to_chat(user, span_warning("[target] doesn't bear the church's marks of shame!"))
		return

	// Remove divine punishments
	target.remove_status_effect(/datum/status_effect/debuff/apostasy)
	target.remove_status_effect(/datum/status_effect/debuff/excomm)
	target.remove_stress(/datum/stressevent/apostasy)
	target.remove_stress(/datum/stressevent/excommunicated)

	// Remove divine curses
	for(var/datum/curse/C in target.curses)
		target.remove_curse(C)

	// Save devotion state if exists
	var/saved_level = CLERIC_T0
	var/saved_max_progression = CLERIC_T1
	var/saved_devotion_gain = CLERIC_REGEN_MINOR

	if(target.devotion)
		saved_level = target.devotion.level
		saved_devotion_gain = target.devotion.passive_devotion_gain
		saved_max_progression = target.devotion.max_progression

		// Remove all granted spells
		if(target.patron != user.patron)
			for(var/obj/effect/proc_holder/spell/S in target.devotion.granted_spells)
				target.mind.RemoveSpell(S)

		target.devotion.Destroy()

	// Change patron
	target.patron = new user.patron.type()
	to_chat(target, span_userdanger("Your soul now belongs to [user.patron.name]!"))

	// Grant new devotion
	var/datum/devotion/new_devotion = new /datum/devotion(target, target.patron)
	target.devotion = new_devotion
	new_devotion.grant_miracles(target, saved_level, saved_devotion_gain, saved_max_progression)

	// Final conversion
	ADD_TRAIT(target, TRAIT_HERESIARCH, TRAIT_GENERIC)
	ADD_TRAIT(target, TRAIT_EXCOMMUNICATED, TRAIT_GENERIC)
	ADD_TRAIT(target, TRAIT_ZURCH, TRAIT_GENERIC)
	to_chat(user, span_danger("You've converted [target.name] to [user.patron.name]!"))
	to_chat(target, span_danger("You feel ancient powers lifting divine burdens from your soul..."))

	return TRUE

/mob/living/carbon/human/proc/revelations()
	set name = "Revelations"
	set category = "Cleric"
	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	var/obj/item/S = get_inactive_held_item()
	var/found = null
	if(!istype(I) || !ishuman(I.grabbed))
		to_chat(src, span_warning("I don't have a victim in my hands!"))
		return
	H = I.grabbed
	if(H == src)
		to_chat(src, span_warning("I already torture myself."))
		return
	if (!H.restrained())
		to_chat(src, span_warning ("My victim needs to be restrained in order to do this!"))
		return
	if(!istype(S, /obj/item/clothing/neck/roguetown/psicross/inhumen/aalloy))
		to_chat(src, span_warning("I need to be holding a zcross to extract this divination!"))
		return
	for(var/obj/structure/fluff/psycross/zizocross/N in oview(5, src))
		found = N
	if(!found)
		to_chat(src, span_warning("I need a large profane shrine structure nearby to extract this divination!"))
		return
	if(!H.stat)
		var/static/list/faith_lines = list(
			"THE TRUTH SHALL SET YOU FREE!",
			"WHO IS YOUR GOD!?",
			"ARE YOU FAITHFUL!?",
			"WHO IS YOUR SHEPHERD!?",
		)
		src.visible_message(span_warning("[src] shoves the decrepit zcross into [H]'s lux!"))
		say(pick(faith_lines), spans = list("torture"))
		H.emote("agony", forced = TRUE)

		if(!(do_mob(src, H, 10 SECONDS)))
			return
		H.confess_sins("patron")
		return
	to_chat(src, span_warning("This one is not in a ready state to be questioned..."))
