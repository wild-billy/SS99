
//**************************************************************
//
// Player Datum
// ------------------
// Holds player data. Interfaces with mob and client.
//
//**************************************************************

/datum/player
	var/client/client
	var/mob/mob
	var/key
	var/ckey
	var/nick

/datum/player/proc/login(client/C)
	src.client = C
	src.key = C.key
	src.ckey = C.ckey
	src.nick = C.key
	src.mob = new MOB_TYPE_NEW
	src.mob.ckey = src.ckey
	src.client.inputHandlers[INPUT_GAME] = src
	C << "You have connected for the first time."
	C << "Your ckey is [src.ckey]."
	C << "Your key is [src.key]."
	C << "Your nick is \"[src.nick]\"."
	RETURN

/datum/player/proc/connect(client/C)
	src.client = C
	src.client.inputHandlers[INPUT_GAME] = src
	if(src.mob)
		if(src.mob.ckey)
			C << "Someone jacked your mob. Here's a new one."
			src.mob = new MOB_TYPE_NEW
		else C << "Welcome back."
		src.mob.ckey = src.ckey
	else src.ghost()
	RETURN

/datum/player/proc/disconnect()
	src.client = null
	RETURN
	
/datum/player/proc/ghost()
	src.client << "You got deleted!"
	src.mob = new MOB_TYPE_NEW
	src.mob.ckey = src.ckey
	return
	