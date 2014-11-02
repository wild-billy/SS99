
//**************************************************************
//
// Mob
// -----
// Built-in type. Player characters, basically.
//
//**************************************************************

/mob
	layer = LAYER_MOB
	dir = SOUTH
	density = TRUE
	var/atom/igm

// Initialization //////////////////////////////////////////////

/mob/init()
	src.igm = new/atom/igm(src)
	src.igm.init()
	evm.event("MobCreation",src)
	src.initialized = TRUE
	RETURN

/mob/deInit()
	src.initialized = FALSE
	evm.event("MobDeletion",src)
	RETURN

/mob/proc/login(datum/player)
	src.event("Login")
	RETURN

/mob/proc/logout(datum/player)
	src.event("Logout")
	RETURN
