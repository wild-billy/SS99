
//**************************************************************
// Graphical Element Cache
//**************************************************************

/var/global/datum/cache/gem/gemCache = new

////////////////////////////////////////////////////////////////

/datum/cache
	var/list/poolsFree
	var/list/poolsUsed
	var/list/elements = list(
		"title", 
		"subtitle",
		)

/datum/cache/New()
	if(setupStatus TEST SETUP_CACHES) src.init()
	else subGlobal(src,"SetupCaches","init")
	RETURN

/datum/cache/init()
	src.buildMain()
	return ..()

/datum/cache/Del()
	RETURN

/datum/cache/delSoft()
	RETURN

/datum/cache/deInit()
	RETURN

// Building ////////////////////////////////////////////////////

/datum/cache/proc/buildMain()
	var/gem/element = new/gem/title
	src.elements["title"] = element
	element.cached = TRUE
	element = new/gem/subtitle
	src.addCustom(element.path,10)
	src.elements["subtitle"] = element
	element.cached = TRUE
	src.addCustom(element.path,10)
	return

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

/datum/cache/proc/addCustom(elemPath,number)
	set waitfor = FALSE
	. = initial(elemPath.elemID)
	do src.poolsFree[.] += new elemPath while(number--)
	RETURN

/datum/cache/proc/returnCustom(gem/element)
	set waitfor = FALSE
	element.reInit()
	src.poolsUsed[element.elemID] -= element
	src.poolsFree[element.elemID] |= element
	RETURN
