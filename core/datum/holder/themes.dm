
//**************************************************************
//
// Color Theme Datums
// ---------------------
// These are used to build graphics.
// Changing them will be possible in-game, but that will mean
// lag since many graphics will have to be rebuilt.
//
//**************************************************************

/var/global/list/themes = list(
	"Default Dark"  = new/datum/holder/theme       ,
	"Default Light" = new/datum/holder/theme/light ,
	)

////////////////////////////////////////////////////////////////

/datum/holder/theme
	var/name = "Default Dark"
	var/colorBG     = "#202020FF"
	var/colorText   = "#C0C0C0FF"

/datum/holder/theme/light
	name = "Default Light"
	var/colorBG     = "#C0C0C0FF"
	var/colorText   = "#202020FF"
