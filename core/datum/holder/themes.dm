
//**************************************************************
//
// Color/Style Themes
// -----------------------
// These are used to build graphics.
// Changing them will be possible in-game, but that will mean
// lag since a large amount of graphics will have to be rebuilt.
//
//**************************************************************

/var/global/list/themes = newlist(typesof(/datum/holder/theme))

////////////////////////////////////////////////////////////////

/datum/holder/theme
	var/name = "Default Dark"
	var/colorBG   = "#202020FF"
	var/colorText = "#C0C0C0FF"

/datum/holder/theme/init()
	themes -= src
	themes[src.name] = src
	return ..()

////////////////////////////////////////////////////////////////

/datum/holder/theme/light
	name = "Default Light"
	colorBG   = "#C0C0C0FF"
	colorText = "#202020FF"
