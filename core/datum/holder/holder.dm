
//**************************************************************
//
// Holder Datums
// ----------------------
// These hold all sorts of data. They're initialized manually
// in setup() before most other stuff.
//
//**************************************************************

/datum/holder

/datum/holder/New()
	if(setupStatus TEST SETUP_BASIC) src.init()
	else subGlobal(src,"SetupBasic","init")
	RETURN
