/datum/job/roguetown/keeper
	title = "Keeper"
	tutorial = "Disfigured, shunned, or simply filled with purpose and dedication for Pestra. Some of you are horrifically mutated, disfigured, or diseased. No matter, even the pretty ones feel the toll as it leaves their strength atrophied. Someone has to harvest the holy blood required to purify lux and perpetuate Pestra's gift of medicine. Unfortunately, that's you. To study it and empower it so that Pestra's medicine may blossom even in the this city."
	flag = KEEPER
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_races = RACES_SHUNNED_UP
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	allowed_patrons = list(/datum/patron/divine/pestra)

	outfit = /datum/outfit/job/roguetown/keeper
	display_order = JDO_KEEPER
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null
	round_contrib_points = 3

	job_traits = list(TRAIT_MEDICINE_EXPERT, TRAIT_ALCHEMY_EXPERT, TRAIT_NOSTINK, TRAIT_STEELHEARTED, TRAIT_CLERGY)

	advclass_cat_rolls = list(CTAG_KEEPER = 2)
	job_subclasses = list(
		/datum/advclass/keeper
	)

/datum/advclass/keeper
	name = "Keeper"
	tutorial = "Disfigured, shunned, or simply filled with purpose and dedication for Pestra. Some of you are horrifically mutated, disfigured, or diseased. No matter, even the pretty ones feel the toll as it leaves their strength atrophied. Someone has to harvest the holy blood required to purify lux and perpetuate Pestra's gift of medicine. Unfortunately, that's you. To study it and empower it so that Pestra's medicine may blossom even in the this city."
	outfit = /datum/outfit/job/roguetown/keeper/basic
	category_tags = list(CTAG_KEEPER)

	subclass_stats = list(
		STATKEY_INT = 4,
		STATKEY_WIL = 1,
		STATKEY_CON = 2,
		STATKEY_STR = 1,
		STATKEY_PER = 2,
		STATKEY_SPD = -2,
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/carpentry = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/masonry = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/tanning = SKILL_LEVEL_NOVICE,
		/datum/skill/labor/farming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_EXPERT,
		/datum/skill/labor/butchering = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/magic/holy = SKILL_LEVEL_EXPERT,
	)

/datum/outfit/job/roguetown/keeper/basic/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/psicross/pestra
	cloak = /obj/item/clothing/cloak/templar/pestran
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/monk/holy
	pants = /obj/item/clothing/under/roguetown/trou/leather/eastern
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/pestrasickle
	beltl = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backl = /obj/item/storage/backpack/rogue/backpack/bagpack
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/mid = 1,
							 /obj/item/heart_canister = 2,
							 /obj/item/heart_blood_vial/filled = 2,
							 /obj/item/heart_blood_canister/filled = 1,
							 /obj/item/heart_blood_vial = 5,
							 /obj/item/heart_blood_canister = 1,
							 /obj/item/storage/keyring/keeper = 1,
							 /obj/item/needle/pestra = 1,
							 )
	H.put_in_hands(new /obj/item/storage/belt/rogue/surgery_bag/full/physician(H))
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T3, passive_gain = CLERIC_REGEN_MINOR, start_maxed = TRUE)
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_UPPER_MIDDLE_CLASS, H, "Church Funding.")
