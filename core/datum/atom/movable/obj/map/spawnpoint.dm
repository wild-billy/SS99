
//**************************************************************
// Spawn-points
//**************************************************************

/var/global/list/spawnPoints = list(
	"default"	= list()
	)

////////////////////////////////////////////////////////////////

/obj/map/spawnPoint

/obj/map/spawnPoint/init()
	spawnPoints[src.name] PLUS src
	src.initialized = TRUE
	return

/obj/map/spawnPoint/deInit()
	spawnPoints[src.name] MINUS src
	return PARENT_CALL
