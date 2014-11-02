
//**************************************************************
// Title Screen Elements
//**************************************************************

/gem/title
	elemID = "title"
	icon = 'gfx/main/title.dmi'
	caching = TRUE

/gem/title/init()
	var/datum/theme/theme = themes[THEME_DEFAULT]
	src.color = theme.color
	return ..()

/gem/title/reInit()
	src.icon = initial(src.icon)
	var/datum/theme/theme = themes[THEME_DEFAULT]
	src.color = theme.color
	RETURN

/gem/title/subtitle
	elemID = "subtitle"
	icon = 'gfx/main/subtitle.dmi'
