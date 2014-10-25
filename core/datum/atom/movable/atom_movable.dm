
//**************************************************************
// Movable Atoms
//**************************************************************

/atom/movable
	step_size = 1

/atom/movable/delSoft()
	src.loc = null
	return ..()

/atom/movable/turf()
	var/turf/T = src.loc
	while(T AND NOT(istype(T))) T = T.loc
	return T
