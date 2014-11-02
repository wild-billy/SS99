
//**************************************************************
//
// Global Events
// ===============
// It would have been really nice to have an object handling
// this, but alas due to several BYOND problems it couldn't
// handle everything.
//
// Throw global events like this (args optional):
//   ----------------------------------------------
//   eventGlobal("ExampleEvent",arg1,arg2,arg3,...)
//   ----------------------------------------------
// 
// Subscribe/unsubscribe to them like this (proc name optional):
//   ----------------------------------------------------
//   subGlobal(subscriber,"ExampleEvent","exampleProc")
//   unsubGlobal(subscriber,"ExampleEvent","exampleProc")
//   unsubGlobalAll(subscriber)
//   ----------------------------------------------------
//
//**************************************************************

/var/list/global/eventsGlobal = list()

// Throwing ////////////////////////////////////////////////////

/proc/eventGlobal(event) //variable args after event
	if(eventsGlobal[event])
		for(var/subRef in eventsGlobal[event])
			. = locate(subRef)
			if(.) call(.,eventsGlobal[event][subRef])(arglist(args-event))
			else  async unsubGlobalAll(.)
	RETURN

// Note that this is different from calling the whole proc async
// We use this when we care that the message gets sent properly,
// but not about who got it or what they do with it.
/proc/eventGlobalAsync(event) //variable args after event
	if(eventsGlobal[event])
		for(var/subRef in eventsGlobal[event])
			. = locate(subRef)
			if(.) async call(.,eventsGlobal[event][subRef])(arglist(args-event))
			else  async unsubGlobalAll(.)
	RETURN

// Sub/Unsub ///////////////////////////////////////////////////

/datum/proc/subGlobal(subscriber,event,procName)
	if(!procName) procName = "on[event]"
	if(!istext(subscriber)) subscriber = "\ref[subscriber]"
	if(!(event in eventsGlobal)) eventsGlobal[event] = list()
	eventsGlobal[event][subscriber] = procName
	RETURN

/datum/proc/unsubGlobal(subscriber,event,procName)
	if(!procName) procName = "on[event]"
	if(!istext(subscriber)) subscriber = "\ref[subscriber]"
	for(. in eventsGlobal[event])
		if((. == subscriber) AND (eventsGlobal[event][.] == procName))
			eventsGlobal[event] -= .
	if(!length(eventsGlobal[event])) eventsGlobal -= event	
	RETURN
	
/datum/proc/unsubGlobalAll(subscriber)
	if(!istext(subscriber)) subscriber = "\ref[subscriber]"
	for(. in eventsGlobal)
		removeIn(subscriber,eventsGlobal[.])
		if(!length(.)) eventsGlobal -= .
	RETURN
