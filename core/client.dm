
//**************************************************************
//
// Client
// --------
//
// BYOND built-in base type. 
// Yes, BYOND made a client object that doesn't even handle
// logging in and out. Thanks, guys. Really helpful.
//
//**************************************************************

/client
	show_popup_menus = FALSE //We want RMB for interaction

//Shitty built-in proc, we're overriding it so it does nothing.
//This is even suggested in the fucking language reference!
//The sleep apparently tells BYOND not to call it again.
/client/Stat()
	sleep(A_LONG_TIME)
	return
