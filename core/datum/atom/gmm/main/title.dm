
//**************************************************************
// GUI Module - Title Screen
//**************************************************************

/atom/gmm/title
	caching = CACHE_DYN_ENTRY
	elements = list(
		"title",
		"subtitle",
		)

/atom/gmm/title/reInit()
	RETURN

/atom/gmm/title/show()
	src.showElement


/atom/gmm/title/hide()
	src
	RETURN

/atom/gmm/title/buildElements()
	src.elements["title"]    = gemCache.getElement("title")
	src.elements["subtitle"] = gemCache.getElement("subtitle")
	RETURN

