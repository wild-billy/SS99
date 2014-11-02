
//**************************************************************
//
// Individual Graphics Manager (IGM)
// ------------------------------------
// Handles a shit-ton of stuff related to the player's GUI, HUD,
// screen overlays, widgets, etc.
// This is an atom so that it can hold shit.
//
// It interfaces with the player, client, and mob due to
// performance reasons. It could be abstracted, but input is
// already slow enough and this helps keep it responsive.
//
//**************************************************************

/atom/igm
	var/datum/player/player
	var/client/client
	var/mob/mob

/atom/igm/init(datum/player/playerNew,client/clientNew,mob/mobNew)
	if(playerNew)	src.player = playerNew
	if(clientNew)	src.client = clientNew
	if(mobNew)		src.mob = mobNew
	src.client.inputHandlers[INPUT_GUI] = src
	if(setupComplete)
		src.initialized = TRUE
		src.mainMenuShow()
		src.titleScreenShow()
	else waitingForSetup["general"] += src
	RETURN

// Title Screen ////////////////////////////////////////////////

/atom/igm/titleScreenShow()


/atom/igm/titleScreenHide()



// Main Menu ///////////////////////////////////////////////////

/atom/igm/mainMenuShow()
	winset(src.client,"full",     "visible=true")
	winset(src.client,"input",    "visible=false")
	winset(src.client,"map",      "visible=false")
	winset(src.client,"inventory","visible=false")
	winset(src.client,"buttons",  "visible=false")
	winset(src.client,"feedback", "visible=false")
	winset(src.client,"eye",      "visible=false")
	winset(src.client,"output",   "visible=false")
	RETURN

/atom/igm/mainMenuHide()
	winset(src.client,"input",    "visible=true")
	winset(src.client,"map",      "visible=true")
	winset(src.client,"inventory","visible=true")
	winset(src.client,"buttons",  "visible=true")
	winset(src.client,"feedback", "visible=true")
	winset(src.client,"eye",      "visible=true")
	winset(src.client,"output",   "visible=true")
	winset(src.client,"full",     "visible=false")
	RETURN

// Interaction /////////////////////////////////////////////////

/atom/igm/proc/console(window)
	if(window) //Only stand-alone window is implemented
		if(findtext(winget(player,null,"windows"),"consoleWindow"))
			winshow(src.client,"consoleWindow",FALSE)
		else winshow(src.client,"consoleWindow",TRUE)
	else MSG("debug",src.client,"That's not implemented yet.")
	RETURN
