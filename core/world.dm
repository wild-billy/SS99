
//**************************************************************
//
// World
// ---------
// BYOND bullshit-type. Non-sane inheritance. Not safe in procs.
// Cannot add vars and procs to this, because lol BYOND.
// Avoid using whenever possible.
//
//**************************************************************

/world
	tick_lag = TICK_LAG_DF
	icon_size = "48x32"
	view = VIEW_RANGE_DF
	cache_lifespan = FALSE
	map_format = SIDE_MAP

/world/New()
	Setup()
	return ..()

/world/Del()
	Shutdown()
	return ..()
