/datum/sex_session_lock
	var/mob/living/locked_host
	var/locked_organ_slot
	var/obj/item/locked_item

/datum/sex_session_lock/New(mob/_host, _locked_slot, obj/item/_locked_item)
	. = ..()
	locked_host = _host
	locked_organ_slot = _locked_slot
	locked_item = _locked_item
	LAZYADD(GLOB.locked_sex_objects, src)

/datum/sex_session_lock/Destroy(force, ...)
	. = ..()
	LAZYREMOVE(GLOB.locked_sex_objects, src)
	locked_host = null
	locked_item = null

/datum/sex_action
	abstract_type = /datum/sex_action

	/// Display name of the action
	var/name = "Generic Action"
	///Description for hover
	var/description = "Generic desc"

	/// Whether this action can continue indefinitely
	var/continous = TRUE
	/// How long each iteration takes
	var/do_time = 3.3 SECONDS
	/// Stamina cost per iteration
	var/stamina_cost = 0.5
	/// Whether to check if user is incapacitated
	var/check_incapacitated = TRUE
	/// Whether participants must be on same tile
	var/check_same_tile = TRUE
	/// Whether this requires a grab
	var/require_grab = FALSE
	/// Minimum grab state required
	var/required_grab_state = GRAB_PASSIVE
	/// Whether aggressive grab bypasses same tile requirement
	var/aggro_grab_instead_same_tile = FALSE
	///this is a list of locks we created to prevent penis portal powers
	var/list/datum/sex_session_lock/sex_locks = list()
	///this is the priority of our action for the target so when ejaculate messages are looked at its highest priority
	var/target_priority = 10
	///this is the priority of our action for the user
	var/user_priority = 10
	/// Whether this action supports knotting on climax
	var/knot_on_finish = FALSE
	/// Whether this action can trigger knots
	var/can_knot = FALSE
	///basically for actions being done by the user where the target is the inserter set this to true
	var/flipped = FALSE
	///Intensity of the climax from this action.
	var/intensity = 2
	///Used for determining whether the good lover bonus can apply
	var/masturbation = FALSE
	///Whenever or not you need to be adjacent to someone to use it
	var/ranged_action = FALSE
	/// Whether this action is subtle (only messages/sounds to involved parties, no particles)
	var/subtle = FALSE
	/// Whether this action is discrete (only does obvious animations if intent is higher than firm and speed is greater or equal to steady)
	var/discrete = FALSE 
	///Whenever it should be actually displayed on the panel or not
	var/debug_erp_panel_verb = TRUE

/datum/sex_action/Destroy()
	for(var/datum/sex_session_lock/lock in sex_locks)
		qdel(lock)
	sex_locks.Cut()

	return ..()

/datum/sex_action/proc/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(debug_erp_panel_verb)
		return FALSE
	if(user.get_highest_grab_state_on(target) == GRAB_AGGRESSIVE)
		return TRUE //Battlefuck buff
	return TRUE

/// Checks if this action should be automatically subtle due to location
/// Returns TRUE if either participant's loc is a mob
/datum/sex_action/proc/is_location_subtle(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(!user || !target)
		return FALSE
	
	// Check if user is inside target
	if(ismob(user.loc) && user.loc == target)
		return TRUE
	
	// Check if target is inside user
	if(ismob(target.loc) && target.loc == user)
		return TRUE
	
	return FALSE

/// Checks if discrete actions should remain subtle based on force and speed
/// Returns TRUE if action should stay subtle (force <= FIRM AND speed < STEADY)
/datum/sex_action/proc/is_discrete_subtle(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(!discrete)
		return FALSE
	
	var/datum/sex_session/sex_session = get_sex_session(user, target)
	if(!sex_session)
		return TRUE // Default to subtle if no session
	
	// Discrete actions only become obvious if force > FIRM OR speed >= STEADY
	if(sex_session.force > SEX_FORCE_MID || sex_session.speed >= SEX_SPEED_MID)
		return FALSE // Not subtle - action is obvious
	
	return TRUE // Subtle - action is discrete

/datum/sex_action/proc/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	SHOULD_CALL_PARENT(TRUE)
	return TRUE

/datum/sex_action/proc/try_knot_on_climax(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(!knot_on_finish)
		return FALSE
	if(!can_knot)
		return FALSE

	var/datum/sex_session/session = get_sex_session(user, target)
	if(!session)
		return FALSE
	return SEND_SIGNAL(user, COMSIG_SEX_TRY_KNOT, target, session.force, get_knot_count())

/datum/sex_action/proc/get_knot_count()
	return 0

/datum/sex_action/proc/check_location_accessible(mob/living/carbon/human/user, mob/living/carbon/human/target, location = BODY_ZONE_CHEST, grabs = FALSE, skipundies = TRUE)
	var/obj/item/bodypart/bodypart = target.get_bodypart(location)
	var/self_target = FALSE
	if(target == user)
		self_target = TRUE

	if(!bodypart)
		return FALSE

	if(user.get_highest_grab_state_on(target) == GRAB_AGGRESSIVE)
		return TRUE //Battlefuck buff

	if(src.check_same_tile && (user != target || self_target))
		var/same_tile = (get_turf(user) == get_turf(target))
		var/grab_bypass = (src.aggro_grab_instead_same_tile && user.get_highest_grab_state_on(target) == GRAB_AGGRESSIVE)
		if(!same_tile && !grab_bypass)
			return FALSE

	if(src.require_grab && (user != target || self_target))
		var/grabstate = user.get_highest_grab_state_on(target)
		if((grabstate == null || grabstate < src.required_grab_state))
			return FALSE

	var/result = get_location_accessible(target, location = location, grabs = grabs, skipundies = skipundies)
	return result

/datum/sex_action/proc/get_users_penis(mob/living/carbon/human/user)
	if(!user)
		return null
	return user.getorganslot(ORGAN_SLOT_PENIS)

/datum/sex_action/proc/has_double_penis(mob/living/carbon/human/user)
	if(!user)
		return FALSE
	var/obj/item/organ/penis/penis = user.getorganslot(ORGAN_SLOT_PENIS)
	if(!penis?.functional)
		return FALSE
	return penis.penis_type in list(
		PENIS_TYPE_TAPERED_DOUBLE,
		PENIS_TYPE_TAPERED_DOUBLE_KNOTTED
	)

/datum/sex_action/proc/has_slit_sheath(mob/living/carbon/human/target)
	if(!target)
		return FALSE
	var/obj/item/organ/penis/penis = target.getorganslot(ORGAN_SLOT_PENIS)
	if(!penis)
		return FALSE
	return penis.sheath_type == SHEATH_TYPE_SLIT

/datum/sex_action/proc/has_sensitive_ears(mob/living/carbon/human/target)
	if(!target)
		return FALSE
	var/obj/item/organ/ears/ears = target.getorganslot(ORGAN_SLOT_EARS)
	if(!ears)
		return FALSE
	return ears.ear_sensitivity == EARS_SENSITIVE

/datum/sex_action/proc/find_original_owner_by_ckey(target_ckey)
	if(!target_ckey)
		return null

	for(var/mob/living/carbon/human/H in GLOB.human_list)
		if(H.ckey == target_ckey)
			return H

	return null

/datum/sex_action/proc/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	SHOULD_CALL_PARENT(TRUE)
	lock_sex_object(user, target)

	var/message = get_start_message(user, target)
	if(message)
		var/is_subtle = subtle || is_location_subtle(user, target) || is_discrete_subtle(user, target)
		
		if(is_subtle)
			// Subtle mode: only send to involved parties
			to_chat(user, message)
			if(target && target != user)
				to_chat(target, message)
		else
			// Normal mode: visible to everyone
			user.visible_message(message)

	var/sound = get_start_sound(user, target)
	if(sound)
		var/is_subtle = subtle || is_location_subtle(user, target) || is_discrete_subtle(user, target)
		if(is_subtle)
			// Subtle mode: only play to involved parties
			if(user?.client)
				SEND_SOUND(user, sound(sound, repeat = FALSE, wait = FALSE, volume = 20, channel = CHANNEL_HEARTBEAT))
			if(target?.client && target != user)
				SEND_SOUND(target, sound(sound, repeat = FALSE, wait = FALSE, volume = 20, channel = CHANNEL_HEARTBEAT))
		else
			// Normal mode: play to area
			playsound(target, sound, 20, TRUE, ignore_walls = FALSE)

	return TRUE

/datum/sex_action/proc/get_start_message(mob/living/carbon/human/user, mob/living/carbon/human/target)
	return null

/datum/sex_action/proc/get_start_sound(mob/living/carbon/human/user, mob/living/carbon/human/target)
	return null

/datum/sex_action/proc/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	return

/datum/sex_action/proc/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	SHOULD_CALL_PARENT(TRUE)
	unlock_sex_object(user, target)

	var/message = get_finish_message(user, target)
	if(message)
		var/is_subtle = subtle || is_location_subtle(user, target) || is_discrete_subtle(user, target)
		if(is_subtle)
			// Subtle mode: only send to involved parties
			to_chat(user, message)
			if(target && target != user)
				to_chat(target, message)
		else
			// Normal mode: visible to everyone
			user.visible_message(message)

	return

/// Override this to provide the message shown when the action finishes (e.g., withdrawal message)
/datum/sex_action/proc/get_finish_message(mob/living/carbon/human/user, mob/living/carbon/human/target)
	return null

/datum/sex_action/proc/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/datum/sex_session/sex_session = get_sex_session(user, target)
	if(sex_session.finished_check())
		return TRUE
	return FALSE


/datum/sex_action/proc/lock_sex_object(mob/living/carbon/human/user, mob/living/carbon/human/target)
	return FALSE

/datum/sex_action/proc/unlock_sex_object(mob/living/carbon/human/user, mob/living/carbon/human/target)
	for(var/datum/sex_session_lock/lock as anything in sex_locks)
		qdel(lock)
	sex_locks.Cut()

/datum/sex_action/proc/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/target)
	return

/datum/sex_action/proc/check_sex_lock(mob/locked, organ_slot, obj/item/item)
	if(!organ_slot && !item)
		return FALSE
	for(var/datum/sex_session_lock/lock as anything in GLOB.locked_sex_objects)
		if(lock in sex_locks)
			continue
		if(lock.locked_host != locked)
			continue
		if(lock.locked_item != item && lock.locked_organ_slot != organ_slot)
			continue
		return TRUE
	return FALSE


/datum/sex_action/proc/do_onomatopoeia(mob/living/carbon/human/user)
	// Check if action is subtle - if so, don't show balloon alert to viewers
	var/mob/living/carbon/human/target = null
	for(var/datum/sex_session/session in GLOB.sex_sessions)
		if(session.user == user)
			target = session.target
			break
	
	var/is_subtle = subtle || is_location_subtle(user, target) || is_discrete_subtle(user, target)
	if(is_subtle)
		return // Don't show onomatopoeia if action is subtle
	
	user.balloon_alert_to_viewers("Plap!", x_offset = rand(-15, 15), y_offset = rand(0, 25))

/// Helper to play sounds respecting subtle mode
/datum/sex_action/proc/play_sex_sound(mob/living/carbon/human/user, mob/living/carbon/human/target, sound_file, volume = 50)
	if(!sound_file)
		return
	
	var/is_subtle = subtle || is_location_subtle(user, target) || is_discrete_subtle(user, target)
	
	if(is_subtle)
		// Subtle mode: only play to involved parties
		if(user?.client)
			SEND_SOUND(user, sound(sound_file, repeat = FALSE, wait = FALSE, volume = volume, channel = CHANNEL_HEARTBEAT))
		if(target?.client && target != user)
			SEND_SOUND(target, sound(sound_file, repeat = FALSE, wait = FALSE, volume = volume, channel = CHANNEL_HEARTBEAT))
	else
		// Normal mode: play to area
		playsound(target, sound_file, volume, TRUE, -2, ignore_walls = FALSE)

/// Helper to show messages respecting subtle mode
/datum/sex_action/proc/show_sex_message(mob/living/carbon/human/user, mob/living/carbon/human/target, message)
	if(!message)
		return
	
	var/is_subtle = subtle || is_location_subtle(user, target) || is_discrete_subtle(user, target)
	
	if(is_subtle)
		// Subtle mode: only send to involved parties
		to_chat(user, message)
		if(target && target != user)
			to_chat(target, message)
	else
		// Normal mode: visible to everyone
		user.visible_message(message)

/datum/sex_action/proc/show_sex_effects(mob/living/carbon/human/user)
	var/mob/living/carbon/human/target = null
	// Try to find the target from an active session
	for(var/datum/sex_session/session in GLOB.sex_sessions)
		if(session.user == user)
			target = session.target
			break
	
	var/is_subtle = subtle || is_location_subtle(user, target) || is_discrete_subtle(user, target)
	
	if(is_subtle)
		return // No visual effects in subtle mode or when inside someone
	
	for(var/i in 1 to rand(1, 3))
		if(!user.cmode) // Combat mode
			new /obj/effect/temp_visual/heart/sex_effects(get_turf(user))
		else
			new /obj/effect/temp_visual/heart/sex_effects/red_heart(get_turf(user))

