
//**************************************************************
// Movable Atoms
//**************************************************************

/atom/movable
	step_size = 1

	var/sprites = list() //See _def

/atom/movable/delSoft()
	src.loc = null
	return PARENT_CALL

/atom/movable/turf()
	var/turf/T = src.loc
	while(T AND NOT(istype(T))) T = T.loc
	return T
