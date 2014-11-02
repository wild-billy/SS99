
//**************************************************************
//
// Client Input
// ----------------------------------
// This code is strange due to optimizations and BYOND.
//
// See __defines/input.dm for the list positions.
//
//**************************************************************

// We use these two lists to determine which proc to call on
// what object when a key is pressed.

/client/var/inputKeys[INPUT_MAX]		//KEY:procName
/client/var/inputHandlers[INPUT_HMAX]	//GROUP:handlerRef

////////////////////////////////////////////////////////////////

/client/proc/buildInput()

	src.inputHandlers[INPUT_MAIN]	= src
	src.inputHandlers[INPUT_ALT]	= src
	src.inputHandlers[INPUT_NUM]	= src

	src.inputKeys[INPUT_W_DOWN]		= "moveStart"
	src.inputKeys[INPUT_A_DOWN]		= "moveStart"
	src.inputKeys[INPUT_S_DOWN]		= "moveStart"
	src.inputKeys[INPUT_D_DOWN]		= "moveStart"
	src.inputKeys[INPUT_W_UP]		= "moveStop"
	src.inputKeys[INPUT_A_UP]		= "moveStop"
	src.inputKeys[INPUT_S_UP]		= "moveStop"
	src.inputKeys[INPUT_D_UP]		= "moveStop"
	
	src.inputKeys[INPUT_CONSOLE]	= "console"

	src.inputKeys[INPUT_EXIT]		= "exit"

	RETURN

// Client Verbs ////////////////////////////////////////////////
// Tons of boilerplate (we're just like real GUI programmers!)

/client/verb/wDown()
	set name = ".wDown"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_MAIN],src.mob.inputKeys[INPUT_W_DOWN])(NORTH)
	RETURN

/client/verb/aDown()
	set name = ".aDown"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_MAIN],src.mob.inputKeys[INPUT_A_DOWN])(WEST)
	RETURN

/client/verb/sDown()
	set name = ".sDown"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_MAIN],src.mob.inputKeys[INPUT_S_DOWN])(SOUTH)
	RETURN

/client/verb/dDown()
	set name = ".dDown"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_MAIN],src.mob.inputKeys[INPUT_D_DOWN])(EAST)
	RETURN

////////////////

/client/verb/wUp()
	set name = ".wDown"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_MAIN],src.mob.inputKeys[INPUT_W_UP])(NORTH)
	RETURN

/client/verb/aUp()
	set name = ".aDown"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_MAIN],src.mob.inputKeys[INPUT_A_UP])(WEST)
	RETURN

/client/verb/sUp()
	set name = ".sDown"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_MAIN],src.mob.inputKeys[INPUT_S_UP])(SOUTH)
	RETURN

/client/verb/dUp()
	set name = ".dDown"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_MAIN],src.mob.inputKeys[INPUT_D_UP])(EAST)
	RETURN
	
////////////////

/client/verb/exit()
	set name = ".exit"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_GAME],src.mob.inputKeys[INPUT_EXIT])()
	RETURN

////////////////

/client/verb/console()
	set name = ".console"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_GFX],src.mob.inputKeys[INPUT_CONSOLE])()
	RETURN

/client/verb/consoleWindow()
	set name = ".consoleWindow"
	set instant = TRUE
	call(src.mob.inputHandlers[INPUT_GFX],src.mob.inputKeys[INPUT_CONSOLE])(TRUE)
	RETURN
	