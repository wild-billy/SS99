
//**************************************************************
// Global Event Manager
//**************************************************************

/var/global/datum/manager/event/evm = new

////////////////////////////////////////////////////////////////

/datum/manager/event
	events = list(
		"WorldSetup"	= list(),
		"WorldShutdown"	= list(),
		"MobCreation"	= list(),
		"MobDeletion"	= list(),
		"DeInit"		= list(),
		"Deletion"		= list(),
		"Login"			= list(),
		"Logout"		= list(),
		)

/datum/manager/event/New()
	if(setupComplete)	src.init()
	else				waitingForSetup["critical"] PLUS src
	RETURN
