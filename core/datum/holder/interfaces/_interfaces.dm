
//**************************************************************
//
// Interfaces
// --------------
// Also see core/datum.dm.
// 
//**************************************************************

/var/global/list/interfaces = newlist(typesof(/datum/holder/interface))

////////////////////////////////////////////////////////////////

/datum/holder/interface
	var/name = "default"

/datum/holder/interface/init()
	interfaces -= src
	interfaces[src.name] = src
	return ..()
