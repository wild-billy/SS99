
//**************************************************************
//
// Setup/Shutdown
// ---------------------
// Setup is going to get immensely long and complex, so we're
// going to do things right from the start here. Initialization
// is strictly managed and controlled by the objects themselves
// where possible.
//
// Our goal is to make sure Setup() is called only when the 
// server starts, and after that the server should be able to
// run for a very long time without restarting. BYOND is very
// CPU-intensive and has severe problems with memory allocation
// and deallocation, so we'll compensate for that via aggressive
// caching, pooling, and re-use.
//
// Upon New(), objects add themselves to a list based on their
// scope and purpose: most will be regular objects, independent
// of each other, and thus add themselves to "general". However, 
// some are global objects and thus will need to be initialized 
// first, because the other objects depend on them.
//
//**************************************************************

/var/global/setupStatus = 0 //See _def/bitflags/setup.dm

// Setup ///////////////////////////////////////////////////////

/proc/Setup()
	var/list/setups = list( // Order by bit position
		"SetupBasic"     ,  // 0001
		"SetupManagers"  ,  // 0010
		"SetupCaches"    ,  // 0100
		"SetupGeneral"   ,  // 1000
		)
	for(.=1,.<=setups.len,.++)
		setupStatus SET (1<<(.-1))
		eventGlobal(setups[.])
		eventsGlobal -= setups[.]
	eventGlobal("SetupComplete")
	eventsGlobal -= "SetupComplete"
	RETURN

// Shutdown ////////////////////////////////////////////////////

/proc/Shutdown()
	eventGlobal(EVENT_SHUTDOWN)
	RETURN
