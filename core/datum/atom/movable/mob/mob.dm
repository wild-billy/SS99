
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

// Initialization //////////////////////////////////////////////

/mob/init()
	evm.event("MobCreation",src)
	src.initialized = TRUE
	return

/mob/deInit()
	src.initialized = FALSE
	evm.event("MobDeletion",src)
	src.ejectPlayer()
	return

/mob/Login()
	src.loadPlayer()
	return

/mob/Logout()
	return
