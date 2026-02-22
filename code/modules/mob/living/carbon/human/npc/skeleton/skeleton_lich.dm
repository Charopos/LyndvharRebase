/mob/living/carbon/human/species/skeleton/npc/dungeon/lich
	skel_fragile = FALSE
	skel_outfit = /datum/outfit/job/roguetown/npc/skeleton/dungeon/lich

/mob/living/carbon/human/species/skeleton/npc/dungeon/lich
	skel_fragile = TRUE
	skel_outfit = /datum/outfit/job/roguetown/npc/skeleton/dungeon/lich

/datum/outfit/job/roguetown/npc/skeleton/dungeon/lich/pre_equip(mob/living/carbon/human/H)
	..()
	wrists = /obj/item/clothing/wrists/roguetown/bracers/paalloy
	gloves = /obj/item/clothing/gloves/roguetown/plate/paalloy
	armor = /obj/item/clothing/suit/roguetown/armor/plate/paalloy
	shoes = /obj/item/clothing/shoes/roguetown/boots/aalloy
	pants = /obj/item/clothing/under/roguetown/platelegs/paalloy
	neck = /obj/item/clothing/neck/roguetown/chaincoif/paalloy
	head = /obj/item/clothing/head/roguetown/helmet/heavy/guard/paalloy
	mask = /obj/item/clothing/head/roguetown/roguehood/black
	cloak = /obj/item/clothing/cloak/tabard/stabard/black
	belt = /obj/item/storage/belt/rogue/leather/battleskirt/black
	H.STASTR = 14
	H.STAPER = 10
	H.STASPD = 7
	H.STACON = 14
	H.STAWIL = 16
	H.STAINT = 1
	H.faction = list("lich")
	H.wander = TRUE

	H.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/craft/sewing, 1, TRUE)

	H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)

	H.set_patron(/datum/patron/inhumen/zizo)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	H.possible_rmb_intents = list(/datum/rmb_intent/feint,\
	/datum/rmb_intent/aimed,\
	/datum/rmb_intent/strong,\
	/datum/rmb_intent/swift,\
	/datum/rmb_intent/riposte,\
	/datum/rmb_intent/weak)
	H.swap_rmb_intent(num=1)

	if(prob(50))
		r_hand = /obj/item/rogueweapon/spear/paalloy
		l_hand = null
	else
		r_hand = /obj/item/rogueweapon/greatsword/paalloy
		l_hand = null
