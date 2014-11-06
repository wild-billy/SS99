
//**************************************************************
//
// Core Documentation - Miscellaneous
// -------------------------------------
// Contents:
//     1 WHY core IS SEPARATE LIKE THIS
//     2 HOW THIS IS ORGANIZED
//     3 WHY WE USE *Map LISTS
//     4 HOW OBJECTS ARE INITIALIZED
//     5 WHY WE AVOID BYOND INTERNAL TYPES
//     6 WHY 50 FPS
//
//**************************************************************
/*// BEGIN Doc /////////////////////////////////////////////////


1  WHY core IS SEPARATE LIKE THIS
   -------------------------------------------------------------
   The core code isn't really specific to the game, since it's
   essentially extension code that turns the BYOND platform
   into a usable game engine.
   Maintaining and storing it separately makes it much easier
   to coordinate community projects and maintain this code.
  --------------------------------------------------------------


2  HOW THIS IS ORGANIZED
   -------------------------------------------------------------
   The file structure of _core mostly reflects the object tree.
   
   One exception is the "interface" folder, since that code is
   already hellishly complex to read through and it's easier if
   it's all together like that.
   Another is the "debug" folder, which includes a variety of
   performance and other tests.
   
   The sprites used as demos/fallbacks are also with their code.
   -------------------------------------------------------------


3  WHY WE USE *Map LISTS
   -------------------------------------------------------------
   Some built-in BYOND lists don't support the operators we
   need, and most of them can't be used as arrays.
   We have to work around this somehow, and the best method
   I can think of is to just define and use a real list.
   They're named as *Map to distinguish them.
   -------------------------------------------------------------


4  HOW OBJECTS ARE INITIALIZED
   -------------------------------------------------------------
   All (non-built-in) objects are initialized in their init().
   They're de-initialized in their deInit() procs.
   These procs are called by New() and Del(), or upon events.
   
   These avoid calling their parent procs due to performance
   concerns: it's too easy to end up with a huge call chain.
   -------------------------------------------------------------


5  WHY WE AVOID BYOND INTERNAL TYPES
   -------------------------------------------------------------
   Because they're invariably dog shit. There's no better term
   for them, unless you consider horse shit a better term. Long
   story short they're terrible, their inheritance structure is
   extremely iffy, maintaining them is impossible, they have all
   sorts of bugs, they're poorly-designed, and often they're
   actually impossible to use, since their functionality is hard
   coded in the engine binaries (in C not DM). So we avoid them.
   -------------------------------------------------------------
   
5  WHY 50 FPS
   -------------------------------------------------------------
   It's as high as we can go before BYOND gets flaky on us.
   If I find out it's because 10/X is non-terminating for
   relevant values of x over 50 and byond is getting into some
   complex math with possible subnormals, I will be very sad.
   -------------------------------------------------------------

6  WHY WE USE THE X=TRUE LISTS
   -------------------------------------------------------------
   BYOND stores lists in 2 formats, as simple arrays and (for
   associations) as red-black trees. This means that it can be
   much, much faster to find an associated value in an array
   than the index, since the "in" operator uses a simple array
   search and X[Y] uses the tree. So lists that are made to be
   searched for specific elements will use this for performance.
   
   They'll look something like this:
   
       var/L = list(
	       "example1" = TRUE
		   "example2" = TRUE
		   "example3" = TRUE
	       )
   
   To check whether L contains example2, you'd do this:
   
       if(L["example2"])
   
   -------------------------------------------------------------

*//////////////////////////////////////////////////// END Doc //
