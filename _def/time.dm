
//**************************************************************
// Time Defines
//**************************************************************

//For human-readability (BYOND uses deciseconds)
//TODO: Check if BYOND is actually evaling these at compile-time
#define SECONDS	*10
#define MINUTES	*600
#define HOURS	*36000

//For procs that have to sleep forever.
//Yes this is as dumb as it looks, blame BYOND.
#define A_LONG_TIME	(24 HOURS)
