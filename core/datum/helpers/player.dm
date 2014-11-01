
//**************************************************************
//
// Player Datum
// ------------------
// Holds player data. Independent of mob.
//
//**************************************************************

/datum/player
	var/client/client
	var/mob/lastMob
	var/key
	var/ckey
	var/nick

/datum/player/proc/login(client/C)
	src.client = C
	src.key = C.key
	src.ckey = C.ckey
	src.nick = C.key
	C << "You have connected for the first time."
	C << "Your ckey is [src.ckey]."
	C << "Your key is [src.key]."
	C << "Your nick is \"[src.nick]\"."
	src.lastMob = new MOB_TYPE_NEW
	src.lastMob.ckey = src.ckey
	RETURN

/datum/player/proc/connect(client/C)
	src.client = C
	if(src.lastMob)
		if(src.lastMob.ckey)
			C << "Someone jacked your mob. Here's a new one."
			src.lastMob = new MOB_TYPE_NEW
		else C << "Welcome back."
		src.lastMob.ckey = src.ckey
	else src.ghost()
	RETURN

/datum/player/proc/disconnect()
	src.client = null
	RETURN
	
/datum/player/proc/ghost()
	src.client << "You got deleted!"
	src.lastMob = new MOB_TYPE_NEW
	src.lastMob.ckey = src.ckey
	return
	