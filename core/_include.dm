
//**************************************************************
// Included Files - Core
//**************************************************************

#include "client.dm"
#include "setup.dm"
#include "stylesheet.dm"
#include "world.dm"

#include "global\constant_lists.dm"
#include "global\text.dm"

#include "datum\datum.dm"

#include "datum\atom\atom.dm"
#include "datum\atom\area\area.dm"
#include "datum\atom\turf\turf.dm"
#include "datum\atom\movable\atom_movable.dm"
#include "datum\atom\movable\mob\mob.dm"
#include "datum\atom\movable\mob\mob_graphics.dm"
#include "datum\atom\movable\mob\mob_input.dm"
#include "datum\atom\movable\mob\mob_movement.dm"
#include "datum\atom\movable\mob\mob_transfers.dm"
#include "datum\atom\movable\obj\obj.dm"
#include "datum\atom\movable\obj\map\map_objects.dm"
#include "datum\atom\movable\obj\map\spawnpoint.dm"
#include "datum\atom\movable\obj\structure\floor.dm"
#include "datum\atom\movable\obj\structure\structure.dm"
#include "datum\atom\movable\obj\structure\wall.dm"

#include "datum\manager\events.dm"
#include "datum\manager\manager.dm"
#include "datum\manager\tracker.dm"
#include "datum\manager\universe.dm"
#include "datum\manager\ticker\garbage.dm"
#include "datum\manager\ticker\ticker.dm"
