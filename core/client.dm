
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

//Shitty built-in proc, we're overriding it so it does nothing.
//This is even suggested in the fucking language reference!
//The sleep apparently tells BYOND not to call it again.
/client/Stat()
	sleep(A_LONG_TIME)
	RETURN

/client/New() //Called by BYOND on login.
	evm.event("Login",src)
	return ..()

/client/Del() //Called by BYOND on logout.
	evm.event("Logout",src)
	return ..()
	
	