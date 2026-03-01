/datum/job/roguetown/lady
	title = "Consort"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	advclass_cat_rolls = list(CTAG_CONSORT = 20)
	job_traits = list(TRAIT_NOBLE, TRAIT_GOODLOVER, TRAIT_NUTCRACKER)
	tutorial = "Picked out of your political value rather than likely any form of love, you have become the Viscount's most trusted confidant--and likely friend--throughout your marriage. Your loyalty and perhaps even your love will be tested this day... for the daggers that threaten your beloved are as equally pointed at your own throat."

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/servant,
	/obj/effect/proc_holder/spell/self/grant_nobility, /obj/effect/proc_holder/spell/self/grant_title) //why not
	outfit = /datum/outfit/job/roguetown/lady

	display_order = JDO_LADY
	give_bank_account = TRUE
	noble_income = 22
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	vice_restrictions = list(/datum/charflaw/mute, /datum/charflaw/unintelligible) //Needs to use the throat - sometimes

	job_subclasses = list(
		/datum/advclass/consort/diplomat,
		/datum/advclass/consort/courtesan,
		/datum/advclass/consort/lowborn
	)

/datum/job/roguetown/exlady
	title = "Consort Dowager"
	flag = LADY
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	display_order = JDO_LADY
	give_bank_account = TRUE

/datum/outfit/job/roguetown/lady
	head = /obj/item/clothing/head/roguetown/nyle/consortcrown
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	backr = /obj/item/storage/backpack/rogue/satchel/short
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	id = /obj/item/scomstone/garrison
	job_bitflag = BITFLAG_ROYALTY

/datum/advclass/consort/diplomat
	name = "Diplomat"
	tutorial = "You've always been a graceful diplomat for your spouse - fluent in flattery, courtesy, and calculated sincerity. There aren't many that can't help but smile in your presence- which is quite helpful in meetings and arrangements."
	outfit = /datum/outfit/job/roguetown/consort/diplomat
	category_tags = list(CTAG_CONSORT)
	traits_applied = list(TRAIT_SEEPRICES, TRAIT_CICERONE)
	subclass_stats = list(
		STATKEY_INT = 3,
		STATKEY_PER = 3,
		STATKEY_WIL = 1,
		STATKEY_SPD = 1,
		STATKEY_LCK = 5
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/music = SKILL_LEVEL_MASTER,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_MASTER,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_NOVICE
	)

/datum/outfit/job/roguetown/consort/diplomat/pre_equip(mob/living/carbon/human/H)
	..()
	if(should_wear_femme_clothes(H))
		neck = /obj/item/storage/belt/rogue/pouch/coins/rich
		beltr = /obj/item/storage/keyring/lady
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		head = /obj/item/clothing/head/roguetown/nyle/consortcrown
		armor = /obj/item/clothing/suit/roguetown/armor/armordress/winterdress/monarch
		backl = /obj/item/rogue/instrument/harp
		beltl = /obj/item/flashlight/flare/torch/lantern
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		backr = /obj/item/storage/backpack/rogue/satchel/short
		id = /obj/item/scomstone/garrison
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
	else if(should_wear_masc_clothes(H))
		head = /obj/item/clothing/head/roguetown/nyle/consortcrown
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		beltl = /obj/item/storage/keyring/lady
		beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
		backr = /obj/item/storage/backpack/rogue/satchel/short
		id = /obj/item/scomstone/garrison
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Savings.")

/datum/advclass/consort/courtesan
	name = "Courtesan"
	tutorial = "Having been picked less for your talents and house and more for your looks, you've taken full advantage of your time in this court to build up a weaved web of gossip and intrigue, using any skills and tactics you could muster."
	outfit = /datum/outfit/job/roguetown/consort/courtesan
	traits_applied = list(TRAIT_ALCHEMY_EXPERT, TRAIT_KEENEARS, TRAIT_BEAUTIFUL)
	category_tags = list(CTAG_CONSORT)
	subclass_stats = list(
		STATKEY_SPD = 3,
		STATKEY_INT = 1,
		STATKEY_PER = 2,
		STATKEY_WIL = 1,
		STATKEY_LCK = 5
	)
	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/stealing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/traps = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/alchemy = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_MASTER,
	)

/datum/outfit/job/roguetown/consort/courtesan/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/nyle/consortcrown
	pants = /obj/item/clothing/under/roguetown/tights/black
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/decorated
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/storage/keyring/lady
	backr = /obj/item/storage/backpack/rogue/satchel/short/black
	id = /obj/item/scomstone/garrison
	if(should_wear_femme_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/armor/armordress/winterdress/monarch
	if(should_wear_masc_clothes(H))
		armor = /obj/item/clothing/suit/roguetown/armor/longcoat
	backpack_contents = list(
		/obj/item/reagent_containers/glass/bottle/rogue/poison = 1,
		/obj/item/lockpick = 1,
		/obj/item/rogueweapon/scabbard/sheath/noble = 1,
		)
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Savings.")

/datum/advclass/consort/lowborn
	name = "Lowborn"
	tutorial = "You never could have dreamed your life would be like this. Though your origins are humble, something special about you - whether it was your good looks, your kind heart, or your bravery - has brought you into the clutches of the court."
	outfit = /datum/outfit/job/roguetown/consort/lowborn
	category_tags = list(CTAG_CONSORT)
	traits_applied = list(TRAIT_SEEDKNOW, TRAIT_CICERONE, TRAIT_HOMESTEAD_EXPERT)
	subclass_stats = list(
		STATKEY_INT = -2,
		STATKEY_STR = 2,
		STATKEY_PER = 1,
		STATKEY_CON = 3,
		STATKEY_WIL = 2,
		STATKEY_SPD = -1,
		STATKEY_LCK = 5
	)
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/riding = SKILL_LEVEL_NOVICE,
		/datum/skill/labor/farming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/butchering = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/cooking = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/sewing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/tanning = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE
	)

/datum/outfit/job/roguetown/consort/lowborn/pre_equip(mob/living/carbon/human/H)
	..()
	if(should_wear_femme_clothes(H))
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/storage/keyring/lady
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		head = /obj/item/clothing/head/roguetown/nyle/consortcrown
		armor = /obj/item/clothing/suit/roguetown/armor/armordress/winterdress/monarch
		backl = /obj/item/rogue/instrument/harp
		beltl = /obj/item/flashlight/flare/torch/lantern
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		backr = /obj/item/storage/backpack/rogue/satchel/short
		id = /obj/item/scomstone/garrison
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
	else if(should_wear_masc_clothes(H))
		head = /obj/item/clothing/head/roguetown/nyle/consortcrown
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather/plaquegold
		beltl = /obj/item/storage/keyring/lady
		beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
		backr = /obj/item/storage/backpack/rogue/satchel/short
		id = /obj/item/scomstone/garrison
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Savings.")
		record_round_statistic(STATS_MARRIAGES_MADE)//Terrible way to do this but like, it wouldn't work off the "I'm married proc" so here we are.

/obj/effect/proc_holder/spell/self/convertrole/servant
	name = "Recruit Servant"
	new_role = "Servant"
	overlay_state = "recruit_servant"
	recruitment_faction = "Servants"
	recruitment_message = "Serve the crown, %RECRUIT!"
	accept_message = "FOR THE CROWN!"
	refuse_message = "I refuse."
	recharge_time = 100
