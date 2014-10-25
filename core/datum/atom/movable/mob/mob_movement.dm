
//**************************************************************
// Mob Movement
//**************************************************************

/mob/var/moving = 0 //bitflags

/mob/proc/moveStart(direction)
	src.moving SET direction
	walk(src,direction)
	return

/mob/proc/moveStop(direction)
	src.moving CLEAR direction
	walk(src,src.moving) //FIXME: 99% sure this doesn't work
	return





