/datum/advclass/mercenary/rhaenval
	name = "Rhaenish Privateer"
	tutorial = "You are one of many upstarts from Rhaenval, who sailed from the coastal capital of Miklanborh to the eastern beaches of Lyndhardtia in search of a more... honest means of profit than the vikings of infamy."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/rhaenval
	class_select_category = CLASS_CAT_RHAENVAL
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_vagarian.ogg'
	subclass_languages = list(/datum/language/rhaenish)
	extra_context = "This subclass has 2 loadouts with various stats, skills & equipment."
	subclass_skills = list(
	//Universal skills
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/tanning = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/fishing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_EXPERT, //All of you can suck my dick they're SEAMEN
		/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_NOVICE,
	)

/datum/outfit/job/roguetown/mercenary/rhaenval

/datum/outfit/job/roguetown/mercenary/rhaenval/pre_equip(mob/living/carbon/human/H)
	..()

	//Universal gear
	backl = /obj/item/storage/backpack/rogue/satchel/short
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backpack_contents = list(
		/obj/item/flashlight/flare/torch/metal = 1,
		/obj/item/roguekey/mercenary = 1,
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	if(H.mind)
		var/classes = list("Leðurháls - Byrine Grunt", "Skemmdarvargur - Ravager")
		var/classchoice = input(H, "Choose your archetypes", "Available archetypes") as anything in classes

		switch(classchoice)
			if("Leðurháls - Byrine Grunt")	//Medium armor, pick between swords or axes. Boots-on-the-ground for hire. 
				H.set_blindness(0)
				to_chat(H, span_warning("Clad in their unique leatherbound chainmaille and shortsword, The Danheim Leðurháls - roughly translated in Imperial to 'Leatherneck' due to their choice of leather gorgets over forged metal - are known for their harsh dogmatisms and steady personalities."))
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather/atgervi
				head = /obj/item/clothing/head/roguetown/helmet/bascinet/atgervi/rhaenval/ownel
				gloves = /obj/item/clothing/gloves/roguetown/chain/rhaenval
				armor = /obj/item/clothing/suit/roguetown/armor/brigandine/rhaenval
				pants = /obj/item/clothing/under/roguetown/splintlegs/rhaenval
				wrists = /obj/item/clothing/wrists/roguetown/bracers/splint
				backr = /obj/item/rogueweapon/shield/iron
				beltr = /obj/item/rogueweapon/scabbard/sword
				l_hand = /obj/item/rogueweapon/sword/short/rhaenval
				neck = /obj/item/clothing/neck/roguetown/leather
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
				H.change_stat(STATKEY_STR, 2)
				H.change_stat(STATKEY_PER, 2) //You technically wield a shortsword
				H.change_stat(STATKEY_WIL, 2)
				H.change_stat(STATKEY_CON, 2)
				H.change_stat(STATKEY_INT, -1) //Unga swordsman.
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
				H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()



			if("Skemmdarvargur - Ravager")	//Light armor, beast claws or dual handaxes. 
				H.set_blindness(0)
				to_chat(H, span_warning("The Skemmdarvargur are famously known to hail from the northern city of Skugge, the first line of defense for the Northern Empty. Although highly superstitious with their various carved armaments, they lack the mystical miracles of the Iskarn Shamans."))
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather/atgervi
				head = /obj/item/clothing/head/roguetown/helmet/bascinet/atgervi/rhaenval
				gloves = /obj/item/clothing/gloves/roguetown/angle/rhaenvalfur
				armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/rhaenval
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
				pants = /obj/item/clothing/under/roguetown/trou/leather/rhaenval
				neck = /obj/item/clothing/neck/roguetown/coif/heavypadding
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 3, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/craft/traps, 3, TRUE)			//Ditto
				H.change_stat(STATKEY_CON, 2)
				H.change_stat(STATKEY_WIL, 3)
				H.change_stat(STATKEY_SPD, 2)
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
				H.dna.species.soundpack_m = new /datum/voicepack/male/evil() //Dodge builds are evil
				var/weapons = list("Handclaws","Dual Handaxes")
				var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
				if(H.mind)
					switch(weapon_choice)
						if("Handclaws")
							H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_EXPERT, TRUE)
							l_hand = /obj/item/rogueweapon/handclaw //You dont get the insane fucking steel or the special Iskarn ones
						if("Dual Handaxes")
							H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_EXPERT, TRUE)
							r_hand = /obj/item/rogueweapon/stoneaxe/handaxe
							l_hand = /obj/item/rogueweapon/stoneaxe/handaxe
							ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)

	H.merctype = 1

