
//**************************************************************
//
// Graphical Element
// ---------------------
// Purely graphical object.
// A child of /atom/movable, even though it would be the parent
// of /atom if DM's inheritance structure were sane or decent.
//
//**************************************************************

/gem
	parent_type = /atom/movable
	mouse_opacity = FALSE
	alpha = 0

/gem/init()
	src.verbs.len = 0 //Performance
	return ..()
