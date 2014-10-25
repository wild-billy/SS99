
//**************************************************************
// Tracker
//**************************************************************

/var/global/datum/manager/tracker/tracker = new

////////////////////////////////////////////////////////////////

/datum/manager/tracker
	var/list/players = list()
	var/list/mobs = list()

/datum/manager/tracker/init()
	evm.subscribe(src,"MobCreation")
	evm.subscribe(src,"MobDeletion")
	evm.subscribe(src,"Login")
	evm.subscribe(src,"Logout")
	src.initialized = TRUE
	return

/datum/manager/tracker/proc/onMobCreation(mob/created)
	src.mobs |= created
	RETURN

/datum/manager/tracker/proc/onMobDeletion(mob/deleted)
	src.mobs -= deleted
	RETURN

/datum/manager/tracker/proc/onLogin(client/loggedIn)
	src.players |= loggedIn
	RETURN

/datum/manager/tracker/proc/onLogout(client/loggedOut)
	src.players -= loggedOut
	RETURN
