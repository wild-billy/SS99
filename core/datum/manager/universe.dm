
//**************************************************************
//
// Universe Datum
// -----------------
// Holds global data and does useful stuff.
//
//**************************************************************

/var/global/datum/manager/universe/universe = new

////////////////////////////////////////////////////////////////

/datum/manager/universe
	var/name
	var/log = FILE_LOG

	var/day		= 1
	var/month	= 9
	var/year	= 2525

/datum/manager/universe/init()
	subGlobal(src,"WorldSetup")
	subGlobal(src,"WorldShutdown")
	src.initialized = TRUE
	src.name = config.worldName
	RETURN

/datum/manager/universe/proc/onWorldSetup()
	DESYNC
	src.log << LOG_START
	src.Log("New universe initialized.")
	RETURN

/datum/manager/universe/proc/onWorldShutdown()
	DESYNC
	src.Log("Universe destroyed.")
	src.log << LOG_END
	RETURN

// Helper Procs ////////////////////////////////////////////////

/datum/manager/universe/proc/getTime()
	return time2text(world.timeofday,"hh:mm:ss")

/datum/manager/universe/proc/getDate()
	return date2text(src.day,src.month,src.year)

// Logging /////////////////////////////////////////////////////

/datum/manager/universe/proc/Log() //variable args
	DESYNC
	for(var/msg in args)
		src.log << "[TIME]: [msg]"
		world.log << msg
	RETURN
