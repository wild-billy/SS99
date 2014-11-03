
//**************************************************************
//
// GUI Element Cache
// -------------------------------
// Robustness first, optimization later.
//
//**************************************************************

/var/global/datum/cache/gui/guiCache = new

#define CACHE_SIZE_INIT  rand(8,16)
////////////////////////////////////////////////////////////////

/datum/cache
	var/list/poolsFree = list()
	var/list/poolsUsed = list()
	var/list/elements  = list(
		/gem/gui/title,
		/gem/gui/title/subtitle,
		)

/datum/cache/New()
	if(setupStatus TEST SETUP_CACHES) src.init()
	else subGlobal(src,"SetupCaches","init")
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
