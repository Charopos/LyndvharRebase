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
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

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
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

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
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"


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
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

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
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

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
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

/datum/migrant_wave/weocilyn_down_six
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_seven
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/retinue = 2,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

/datum/migrant_wave/weocilyn_down_seven
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_eight
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/knight = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

/datum/migrant_wave/weocilyn_down_eight
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/weocilyn_down_nine
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/hand = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

/datum/migrant_wave/weocilyn_down_nine
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	downgrade_wave = /datum/migrant_wave/weocilyn_down_ten
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
		/datum/migrant_role/weocilyn/retinue = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"

/datum/migrant_wave/weocilyn_down_ten
	name = "The Court of Weocilyn"
	shared_wave_type = /datum/migrant_wave/weocilyn
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/weocilyn/lord = 1,
	)
	greet_text = "Fleeing disaster, you have come together as a court, seeking safe haven in the neighboring city of Lyndvhar, promising to take revenge against the destructive forces of Baleron. Stay close and watch out for each other, for you are all that remain!"
