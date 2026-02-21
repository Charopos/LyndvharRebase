/datum/advclass/mercenary/forlorn
	name = "Forvheipal Thrall"
	tutorial = "A thrall-warrior from the strange and enigmatic kingdom in Yoheon, Forvheipal. The thralls are a sellsword contingent of the Zapyrixian Order- mostly made up of Lupians and Vulpkian slaves-from-birth. They will do any work for the highest bidder as per their contract made from birth- and thus you will, too."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/lupian,
		/datum/species/vulpkanin,
		/datum/species/demihuman,
		/datum/species/tabaxi,
	)
	outfit = /datum/outfit/job/roguetown/mercenary/forlorn
	class_select_category = CLASS_CAT_FORVHEIPAL
	min_pq = 0
	cmode_music = 'sound/music/combat_blackstar.ogg'
	subclass_languages = list(/datum/language/forvheipan)
	category_tags = list(CTAG_MERCENARY)
	traits_applied = list(TRAIT_NOPAINSTUN, TRAIT_CRITICAL_RESISTANCE) // We're going back to the original gimmick of Forlorn Hope, having Critical Resistance
	// Since we demoted them to light armor, I think it is fair they have access to expert weapons as that is also the unarmed barbarian gimmick
	// And unarmed now have weapons in AP's new meta. So nothing wrong with it.
	subclass_stats = list(
		STATKEY_WIL = 3,
		STATKEY_STR = 2,
		STATKEY_CON = 2
	)
	subclass_skills = list(
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/maces = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/polearms = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/axes = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/shields = SKILL_LEVEL_EXPERT,	// This was arguably the OG shield + 1hand weapon merc. If this is too much, we can cut it back again.
		// I don't want anyone to suffer FOMO because they picked another weapon choice. Therefore shield is no longer gated behind weapon choice
	)
	extra_context = "This subclass gains Expert skill in their weapon of choice."

/datum/outfit/job/roguetown/mercenary/forlorn/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	neck = /obj/item/clothing/neck/roguetown/gorget/forlorncollar
	mask = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab/gallant
	pants = /obj/item/clothing/under/roguetown/splintlegs
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	belt = /obj/item/storage/belt/rogue/leather/steel/tasset
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	wrists = /obj/item/clothing/wrists/roguetown/bracers/brigandine
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife,
		/obj/item/roguekey/mercenary,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/storage/belt/rogue/pouch/coins/poor
		)
	H.merctype = 5

/datum/outfit/job/roguetown/mercenary/forlorn
	has_loadout = TRUE

/datum/outfit/job/roguetown/mercenary/forlorn/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Warhammer", // The OG
	"Militia Steel Warpick", // Militia / Peasant weapons to slay the oppressors
	"Maciejowski (Pair)",
	"Militia Spear",
	"Militia War Axe",
	"Militia Thresher",
	"Militia Goedendag (Pair)") // Any that scales off labor skill isn't included
	var/weapon_choice = input(H, "Choose your weapon.", "ARMS TO SLAY THE OPPRESSORS") as anything in weapons
	switch(weapon_choice)
		if("Warhammer")
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/mace/warhammer/steel, SLOT_BELT_L)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/shield/heater, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_JOURNEYMAN)
		if("Militia Steel Warpick")
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/pick/militia/steel, SLOT_BELT_L) // This is super good so you only get ONE
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/shield/heater, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_JOURNEYMAN)
		if("Maciejowski (Pair)")
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/sword/falchion/militia, SLOT_BELT_L) // I think this is really mid one handed so they get two
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/sword/falchion/militia, SLOT_BELT_R)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/shield/heater, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN)
		if("Militia Spear")
			H.put_in_hands(new /obj/item/rogueweapon/spear/militia)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/gwstrap, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN)
		if("Militia War Axe")
			H.put_in_hands(new /obj/item/rogueweapon/greataxe/militia)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/gwstrap, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_JOURNEYMAN)
		if("Militia Thresher")
			H.put_in_hands(new /obj/item/rogueweapon/flail/peasantwarflail)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/gwstrap, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN)
		if("Militia Goedendag (Pair)")
			H.put_in_hands(new /obj/item/rogueweapon/woodstaff/militia)
			H.equip_to_slot_or_del(new /obj/item/rogueweapon/woodstaff/militia, SLOT_BACK_L)
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN)
