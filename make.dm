
//**************************************************************
//
// SS99 Main Makefile
// =====================
// This file includes compilation instructions for the BYOND DM
// compiler (currently the only DM compiler).
//
// Its main job is to #include other DM makefiles. These are 
// called _index.dm (better name ideas welcome).
//
// Feel free to #include files more than once: the DM compiler
// won't waste time processing them again.
//
//
// Explanation of debug options:
// --------------------------------
// DEBUG 
//   This one just makes sure
//
//
//**************************************************************

// Options /////////////////////////////////////////////////////

#define DEBUG TRUE
#define DEBUG_BYOND TRUE
#define DEBUG_COMPILATION TRUE

// Compilation /////////////////////////////////////////////////

#warn [INFO]: Compiling with BYOND version DM_VERSION ...

#if(DM_VERSION < 507)

	#error Sorry, must be 507 or taller to ride.

#else /* Because there's no "give up" command */

	#include "def/stddef.dm"



	#include "def/_make.dm"

	#include "core/_make.dm"
	#include "map/_make.dm"

#endif
