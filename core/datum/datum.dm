
//**************************************************************
// Datum
//**************************************************************

/datum
	var/initialized
	var/list/events

/datum/New()
	if(setupComplete)	src.init()
	else				waitingForSetup["general"] += src
	RETURN

/datum/proc/init()
	src.initialized = TRUE
	RETURN

/datum/proc/deInit()
	src.initialized = FALSE
	RETURN
	
/datum/proc/delSoft()
	if(src.initialized) src.deInit()
	evm.event("Deletion",src)
	RETURN

/datum/Del()
	if(src.initialized) src.deInit()
	return ..()

// Events //////////////////////////////////////////////////////
// Simplest framework I could come up with. Prolly ok for now.

/datum/proc/event(event) //variable args
	if(src.events AND src.events[event])
		var/subscriber
		for(var/subRef in src.events[event])
			subscriber = locate(subRef)
			if(subscriber)
				for(. in src.events[event][subRef])
					call(subscriber,.)(arglist(args-event))
			else src.events[event] -= subRef
	RETURN

/datum/proc/subscribe(subscriber,event,procName)
	if(!procName) procName = "on[event]"
	subscriber = "\ref[subscriber]"
	if(!src.events)							src.events = list()
	if(!(event in src.events))				src.events[event] = list()
	if(!(subscriber in src.events[event]))	src.events[event][subscriber] = list()
	src.events[event][subscriber] += procName
	RETURN

/datum/proc/unsubscribe(subscriber,event,procName)
	if(!procName) procName = "on[event]"
	subscriber = "\ref[subscriber]"
	src.events[event[subscriber]] -= procName
	if(!length(src.events[event][subscriber]))	src.events[event] -= subscriber
	if(!length(src.events[event]))				src.events -= event
	if(!src.events.len)							src.events = null			
	RETURN
	
/datum/proc/unsubAll(subscriber)
	if(!(istext(subscriber))) subscriber = "\ref[subscriber]"
	for(. in src.events)
		. -= subscriber
		if(!(length(.))) src.events -= .
	if(!(src.events.len)) src.events = null
	RETURN

//Note that this is different from calling the whole proc async.
//We use this when we care that the message gets sent properly,
//but not about who got it or what they do with it.
/datum/proc/eventAsync(event) //variable args
	if(src.events AND src.events[event])
		var/subscriber
		for(var/subRef in src.events[event])
			subscriber = locate(subRef)
			if(subscriber)
				for(. in src.events[event][subRef])
					async call(subscriber,.)(arglist(args-event))
			else src.events[event] -= subRef
	RETURN
