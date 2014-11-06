
//**************************************************************
//
// GUI Module Manager
// ---------------------
// TODO: Document this
//
//**************************************************************

/atom/gmm
	var/list/elements
	var/datum/holder/theme/theme

/atom/gmm/init()
	src.theme = themes[THEME_DEFAULT]
	src.buildElements()
	src.initialized = TRUE
	RETURN

/atom/gmm/proc/buildElements()
	RETURN

// Caching /////////////////////////////////////////////////////

/atom/gmm/proc/swapToCached(elemID)
	var/gem/gui/elem = gemCache.getElement(elemID)
	return elem


/atom/gmm/proc/swapToCustom(elemID)
	return elem


// Show/Hide ///////////////////////////////////////////////////
	
/atom/gmm/proc/showElements() //variable args, elemID's
	var/gem/elem
	for(var/elemID in args)
		elem = src.elements[elemID]
		if(elem.cached AND (elem.caching TEST CACHE_DYN_ENTRY))
			elem = swapToCustom(elemID)
			elem.show()
			spawn(elem.animSet.simpleIn["time"]+5)
				elem = swapToCached(elemID)
		else elem.show()
	RETURN

/atom/gmm/proc/hideElements() //variable args, elemID's
	var/gem/elem
	for(. in args)
		elem = src.elements[elemID]
		if(elem.cache)
			elem = swapToCached(elemID)
			spawn(elem.animSet.simpleOut["time"]+5)
				
		else elem.show()
	RETURN

