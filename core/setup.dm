
//**************************************************************
// Setup/Shutdown
//**************************************************************

/var/global/setupComplete
/var/global/list/waitingForSetup = list(
	"critical"	= list(),
	"managers"	= list(),
	"general"	= list(),
	)

////////////////////////////////////////////////////////////////

/proc/Setup()
	var/datum/waiting
	for(. in waitingForSetup)
		for(waiting in .) waiting.init()
	setupComplete = TRUE
	evm.event("WorldSetup")
	RETURN
	
/proc/Shutdown()
	evm.event("WorldShutdown")
	RETURN
