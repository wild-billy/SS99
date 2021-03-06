
//**************************************************************
//
// Caches
// ---------
// These load, manage, store, and serve objects.
// They're more complex than pools, and many of them will even
// have built-in pools.
//
//**************************************************************

/var/global/datum/cache/gui/guiCache = new

////////////////////////////////////////////////////////////////

/datum/cache
	var/list/elements  = list(/*
		name = path  //Before initialization
		name = ref   //After initialization
		*/)

/datum/cache/New() //Standard init-or-subscribe
	
	RETURN

/datum/cache/Del()
	RETURN

/datum/cache/delSoft()
	RETURN

/datum/cache/deInit()
	RETURN

// Building ////////////////////////////////////////////////////

/datum/cache/init()
	for(var/gem/gui/elem in src.elements)
		src.elements -= elem
		elem = new elem
		src.elements[elem.elemID] = elem
		if(elem.caching TEST CACHE_POOL)
			src.poolsFree[elem.elemID] = list()
			src.addCustom(element.path,CACHE_SIZE_INIT)
			src.poolsUsed[elem.elemID] = list()
		elem.cached = TRUE
		YIELD
	return ..()

/datum/cache/proc/addCustom(elemPath,amount)
	var/gem/gui/elem
	while(amount--)
		elem = new elemPath
		src.poolsFree[elem.elemID] += elem
		YIELD
	RETURN

// Element Serving /////////////////////////////////////////////

/datum/cache/proc/getElement(elemID)
	if(src.elements[elemID]) return src.elements[elemID]
	else                     return src.getCustom(elemID)

/datum/cache/proc/getCustom(elemID)
	if(length(src.poolsFree[elemID]))
		. = poolsFree[elemID][1]
		poolsFree[elemID] -= .
		poolsUsed[elemID] |= .
	else
		universe.Log(text(
			"Cache miss for []: all [] elements in use",
			elemID,
			length(src.poolsUsed[elemID])))
		var/gem/elem = src.poolsUsed[elemID][1]
		. = new elem.type
		src.poolsUsed[elem.elemID] += .
	return


/datum/cache/proc/returnCustom(gem/element)
	DESYNC
	element.reInit()
	src.poolsUsed[element.elemID] -= element
	src.poolsFree[element.elemID] |= element
	RETURN

////////////////////////////////////////////////////////////////
#undef CACHE_SIZE_INIT
