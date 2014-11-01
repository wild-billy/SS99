
//**************************************************************
//
// Garbage Ticker
// -----------------------
// Very simple design for now.
// Works on the principle of allowing things to be deleted by
// the GC, and checking to make sure it's actually doing that.
//
//**************************************************************

/var/global/datum/manager/ticker/garbage/garbozo = new

////////////////////////////////////////////////////////////////

/datum/manager/ticker/garbage
	var/list/garbage = list()
	period = 5 SECONDS

/datum/manager/ticker/garbage/init()
	async src.ticker()
	src.initialized = TRUE
	evm.subscribe(src,"Deletion")
	RETURN

/datum/manager/ticker/garbage/proc/onDeletion(datum/deleted)
	src.garbage PLUS "\ref[deleted]"
	RETURN

/datum/manager/ticker/garbage/proc/ticker() //placeholder
	var/list/old	= list()
	var/list/older	= list()
	var/list/oldest	= list()
	var/datum/trash
	while(src.initialized)
		for(. in oldest)
			trash = locate(.)
			if(trash)
				del(trash)
				sleep()
			else src.garbage MINUS .
		oldest = older
		older = old
		old = src.garbage
		src.garbage.len = 0
		sleep(src.period)
	return
