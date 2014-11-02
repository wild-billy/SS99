
//**************************************************************
//
// Client
// --------
//
// BYOND built-in base type. 
// Yes, BYOND made a client object that doesn't even handle
// logging in and out. Thanks, guys. Really helpful.
// 
// We're going to avoid using this.
// See core/datum/helper/player.dm
//
//**************************************************************

/client
	show_popup_menus = FALSE //We want RMB for interaction
	show_verb_panel = FALSE
	control_freak = CONTROL_FREAK_ALL

//Shitty built-in proc, we're overriding it so it does nothing.
//This is even suggested in the fucking language reference!
//The sleep apparently tells BYOND not to call it again.
/client/Stat()
	sleep(A_LONG_TIME)
	RETURN

/client/New() //Called by BYOND on login.
	src.buildInput()
	evm.event("Login",src)
	return ..()

/client/Del() //Called by BYOND on logout.
	src.inputKeys = 0		//Need to clear these refs
	src.inputHandlers = 0	//Need to clear these refs
	evm.event("Logout",src)
	return ..()
	
	