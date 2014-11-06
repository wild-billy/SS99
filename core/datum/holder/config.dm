
//**************************************************************
//
// Configuration Datum
// -----------------------
// Just what it says on the tin. This hold data that gets loaded
// at runtime from configuration files, or modified in-game. 
//
// Since we fully support all sorts of development strategies
// and even commercial activity off of this base, it's critical
// to ensure that the game can be run from binaries without
// crippling limitations.
//
// So this won't just be an afterthought.
//
//**************************************************************

/var/global/datum/holder/config/config = new

////////////////////////////////////////////////////////////////

/datum/holder/config

	var/worldName = "SS99"
	
	var/logUniversal = "log/universal.dm"
	var/logDebug     = "log/debug.dm"

	var/list/dates = list(
		"initial" = list(
			"day"   = 1,
			"month" = 9,
			"year"  = 2525,
			),
		)
