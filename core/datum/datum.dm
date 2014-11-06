
//**************************************************************
// Datum
//**************************************************************

/datum
	var/initialized //Boolean
	var/list/events //"eventName"=list("subRef"="procToCall")

/datum/New()
	if(setupStatus TEST SETUP_GENERAL) src.init()
	else subGlobal(src,"SetupGeneral","init")
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
// Also see core/events.dm

/datum/proc/event(event) //variable args
	if(src.events AND src.events[event])
		for(var/subRef in src.events[event])
			. = locate(subRef)
			if(.) call(.,src.events[event][subRef])(arglist(args-event))
			else  async src.unsubAll(subRef)
	RETURN

// Note that this is different from calling the whole proc async
// We use this when we care that the message gets sent properly,
// but not about who got it or what they do with it.
/datum/proc/eventAsync(event) //variable args
	if(src.events AND src.events[event])
		for(var/subRef in src.events[event])
			. = locate(subRef)
			if(.) async call(.,src.events[event][subRef])(arglist(args-event))
			else  async src.unsubAll(subRef)
	RETURN

/datum/proc/subscribe(subscriber,event,procName)
	if(!procName) procName = "on[event]"
	if(!istext(subscriber)) subscriber = "\ref[subscriber]"
	if(!src.events)            src.events        = list()
	if(!(event in src.events)) src.events[event] = list()
	src.events[event][subscriber] = procName
	RETURN

/datum/proc/unsubscribe(subscriber,event,procName)
	if(!procName) procName = "on[event]"
	if(!istext(subscriber)) subscriber = "\ref[subscriber]"
	for(. in eventsGlobal[event])
		if((. == subscriber) AND (eventsGlobal[event][.] == procName))
			eventsGlobal[event] -= .
	if(!length(src.events[event])) src.events -= event			
	RETURN
	
/datum/proc/unsubAll(subscriber)
	if(!istext(subscriber)) subscriber = "\ref[subscriber]"
	for(. in src.events)
		removeIn(subscriber,src.events[.])
		if(!length(src.events[.])) src.events -= .
	RETURN
