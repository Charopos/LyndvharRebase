/datum/migrant_wave/weocilyn
	name = "The Court of Weocilyn"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/weocilyn
	weight = 50
	downgrade_wave = /datum/migrant_wave/weocilyn_down_one
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/hand = 1,
		/datum/migrant_role/weocilyn/knight = 1,
		/datum/migrant_role/weocilyn/retinue = 4,
	)
	greet_text = "Fleeing the disaster at Weocilyn, you have come together - to find aide for your house, or to infest Azure Peak with the boons of the Ecclesiarchs.. Stay close and watch out for each other, for all of your sakes!"

/datum/migrant_wave/weocilyn_down_one
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_two
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/hand = 1,
		/datum/migrant_role/weocilyn/knight = 1,
		/datum/migrant_role/weocilyn/retinue = 3,
	)
	greet_text = "Fleeing the disaster at Weocilyn, you have come together - to find aide for your house, or to infest Azure Peak with the boons of the Ecclesiarchs.. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."

/datum/migrant_wave/weocilyn_down_two
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_three
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/hand = 1,
		/datum/migrant_role/weocilyn/knight = 1,
		/datum/migrant_role/weocilyn/retinue = 2,
	)
	greet_text = "Fleeing the disaster at Weocilyn, you have come together - to find aide for your house, or to infest Azure Peak with the boons of the Ecclesiarchs.. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."


/datum/migrant_wave/weocilyn_down_three
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_four
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/hand = 1,
		/datum/migrant_role/weocilyn/knight = 1,
		/datum/migrant_role/weocilyn/retinue = 1,
	)
	greet_text = "Fleeing the disaster at Weocilyn, you have come together - to find aide for your house, or to infest Azure Peak with the boons of the Ecclesiarchs.. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."

/datum/migrant_wave/weocilyn_down_four
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_five
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/hand = 1,
		/datum/migrant_role/weocilyn/knight = 1,
	)
	greet_text = "Fleeing the disaster at Weocilyn, you have come together - to find aide for your house, or to infest Azure Peak with the boons of the Ecclesiarchs.. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."

/datum/migrant_wave/weocilyn_down_five
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_six
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/hand = 1,
		/datum/migrant_role/weocilyn/retinue = 1,
	)
	greet_text = "Fleeing the disaster at Weocilyn, you have come together - to find aide for your house, or to infest Azure Peak with the boons of the Ecclesiarchs. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."

/datum/migrant_wave/weocilyn_down_six
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_seven
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/retinue = 2,
	)
	greet_text = "Fleeing the disaster at Weocilyn, you have come together - to find aide for your house, or to infest Azure Peak with the boons of the Ecclesiarchs. Stay close and watch out for each other, for all of your sakes! Some of you already did not make it on the way here..."

/datum/migrant_wave/weocilyn_down_seven
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_eight
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/knight = 1,
	)
	greet_text = "Fleeing the disaster at Weocilyn, you have come together - to find aide for your house, or to infest Azure Peak with the boons of the Ecclesiarchs. Now, in the end, it is only the Lord and their trusty knight left on their lonesome..."

/datum/migrant_wave/weocilyn_down_eight
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_nine
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/hand = 1,
	)
	greet_text = "Fleeing the disaster at Weocilyn, you have come together - to find aide for your house, or to infest Azure Peak with the boons of the Ecclesiarchs. Now, in the end, it is only the Lord and their trusty Hand left on their lonesome..."

/datum/migrant_wave/weocilyn_down_nine
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	downgrade_wave = /datum/migrant_wave/weocilyn_down_ten
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/retinue = 1,
	)
	greet_text = "Fleeing disaster, you have came together as a court, united in a final effort to restore the former glory and promise of Weocilyn. Now, in the end, it is only the Lord and their last loyal follower left on their lonesome..."

/datum/migrant_wave/weocilyn_down_ten
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
	)
	greet_text = "Fleeing disaster, you have came together as a court, united in a final effort to restore the former glory and promise of Weocilyn. It was all for naught - in the end, only you are left, bereft of your family and men. How the mighty have fallen..."
