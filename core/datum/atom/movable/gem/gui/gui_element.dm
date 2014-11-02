
//**************************************************************
//
// GUI Element
// ---------------------
// Used by GUI managers
//
//**************************************************************

/gem/gui
	var/elemID
	var/datum/anims/animSet

/gem/gui/init()
	src.animSet = animSets[ANIMSET_DEFAULT]
	return ..()

/gem/gui/proc/show()
	src.mouse_opacity = TRUE
	animate(
		src,
		alpha  = src.animSet.simpleIn["alpha"],
		time   = src.animSet.simpleIn["time"],
		loop   = src.animSet.simpleIn["loop"],
		easing = src.animSet.simpleIn["easing"])
	RETURN

/gem/gui/proc/hide()
	src.mouse_opacity = FALSE
	animate(
		src,
		alpha  = src.animSet.simpleOut["alpha"],
		time   = src.animSet.simpleOut["time"],
		loop   = src.animSet.simpleOut["loop"],
		easing = src.animSet.simpleOut["easing"])
	RETURN
