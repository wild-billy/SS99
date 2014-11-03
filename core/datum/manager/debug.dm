
//**************************************************************
//
// Debug Manager
// ---------------
// Does useful stuff.
//
//**************************************************************

/var/global/datum/manager/debug/debug = new

////////////////////////////////////////////////////////////////

/datum/manager/debug
	var/log = FILE_LOG_DEBUG

/datum/manager/universe/init()
	evm.subscribe(src,"WorldSetup")
	evm.subscribe(src,"WorldShutdown")
	src.initialized = TRUE
	RETURN

/datum/manager/universe/proc/onWorldSetup()
	src.log << LOG_START
	src.Log("New universe initialized.")
	RETURN

/datum/manager/universe/proc/onWorldShutdown()
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
	set waitfor = FALSE
	for(var/msg in args)
		src.log << "[TIME]: [msg]"
		world.log << msg
	RETURN