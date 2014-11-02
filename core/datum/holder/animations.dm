
//**************************************************************
//
// Animation Sets
// ---------------------
// These are used by GUI elements and whatever else needs them.
//
//**************************************************************

/var/global/list/animSets = list(
	"Default Fades" = new/datum/holder/anims,
	"Flicker Fades" = new/datum/holder/anims/flicker,
	)

////////////////////////////////////////////////////////////////

/datum/holder/anims
	var/name = "Default Fades"
	var/simpleIn = list(
		"alpha"  = 255,
		"time"   = 5,
		"loop"   = FALSE,
		"easing" = CIRCULAR_EASING,
		)
	var/simpleOut = list(
		"alpha"  = 0,
		"time"   = 5,
		"loop"   = FALSE,
		"easing" = CIRCULAR_EASING,
		)

/datum/holder/anims/flicker
	name = "Flicker Fades"
	simpleIn = list(
		"alpha"  = 255,
		"time"   = 5,
		"loop"   = FALSE,
		"easing" = ELASTIC_EASING,
		)
	simpleOut = list(
		"alpha"  = 0,
		"time"   = 5,
		"loop"   = FALSE,
		"easing" = ELASTIC_EASING,
		)
