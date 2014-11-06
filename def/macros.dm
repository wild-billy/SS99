
//**************************************************************
//
// Macros
// --------
// Simple pseudo-functions to make code simpler, clearer, and
// easier to write.
//
//**************************************************************

// Initialization //////////////////////////////////////////////

#define INIT_OR_SUBSCRIBE(X)              \
	setupStatus TEST SETUP_CACHES       ? \
	src.init()                          : \
	subGlobal(src,"SetupCaches","init") ;

// Object Validation ///////////////////////////////////////////
// These names are a little unwieldy

#define isRealObject(X)  (X AND istype(X,/datum))
#define isValidObject(X) (X AND X.initialized)

// Iteration ///////////////////////////////////////////////////
// These need better names

#define removeIn(X,L)   while(X in L){L -= X}
#define	removeNulls(L)  removeIn(null,L)
