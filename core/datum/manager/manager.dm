
//**************************************************************
// Manager Datum
//**************************************************************

/datum/manager

/datum/manager/New()
	if(setupStatus TEST SETUP_MANAGERS) src.init()
	else subGlobal(src,"SetupManagers","init")
	RETURN

/datum/manager/Del()
	RETURN

/datum/manager/delSoft()
	RETURN

/datum/manager/deInit()
	RETURN
