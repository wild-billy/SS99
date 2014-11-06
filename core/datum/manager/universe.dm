
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

	var/day
	var/month
	var/year

/datum/manager/universe/init()
	subGlobal(src,"WorldSetup")
	subGlobal(src,"WorldShutdown")
	src.name = config.worldName
	src.log << LOG_START
	src.log << "[TIME]: New universe initialized."
	return ..()

/datum/manager/universe/proc/onWorldSetup()
	//NOTE: This is blocking to ensure it runs in proper order

	RETURN

/datum/manager/universe/proc/onWorldShutdown()
	src.log << "[TIME]: Universe destroyed.")
	src.log << LOG_END
	RETURN

// Helper Procs ////////////////////////////////////////////////

/datum/manager/universe/proc/getTime()
	return time2text(world.timeofday,"hh:mm:ss")

/datum/manager/universe/proc/getDate()
	return date2text(src.day,src.month,src.year)

// Logging /////////////////////////////////////////////////////

/datum/manager/universe/proc/Log(time=,/*...*/)
	DESYNC //Writing to logs is i/o so we want to desync
	for(. in args)
		logUniversal << "[TIME]: [msg]"
		world.log << msg //Tell DreamDaemon too
	RETURN
