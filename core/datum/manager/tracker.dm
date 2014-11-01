
//**************************************************************
// Tracker
//**************************************************************

/var/global/datum/manager/tracker/tracker = new

////////////////////////////////////////////////////////////////

/datum/manager/tracker
	var/list/players = list() //ckey and player datum reference
	var/list/playersOnline = list() //As above, but online-only
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
	src.mobs MINUS deleted
	RETURN

/datum/manager/tracker/proc/onLogin(client/loggedIn)
	var/datum/player/player
	if(loggedIn.ckey in src.players)
		player = src.players[loggedIn.ckey]
		player.connect(loggedIn)
	else
		player = new/datum/player
		player.login()
		src.players[player.ckey] = player
	src.playersOnline[player.ckey] = player
	RETURN

/datum/manager/tracker/proc/onLogout(client/loggedOut)
	var/datum/player/player = src.playersOnline[loggedOut.ckey]
	player.disconnect()
	src.playersOnline MINUS player.ckey
	RETURN
