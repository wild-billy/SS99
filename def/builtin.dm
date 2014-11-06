
//**************************************************************
//
// BYOND Built-In Defines
// --------------------------
// For performance (many of these would otherwise be vars).
// Also convenience, don't have to dig in a .dll for them now.
//
//**************************************************************

// Graphics ////////////////////////////////////////////////////

#define LINEAR_EASING		0
#define SINE_EASING			1
#define CIRCULAR_EASING		2
#define CUBIC_EASING		3
#define BOUNCE_EASING		4
#define ELASTIC_EASING		5
#define BACK_EASING			6
#define EASE_IN				64
#define EASE_OUT			128

#define BLEND_DEFAULT		0
#define BLEND_OVERLAY		1
#define BLEND_ADD			2
#define BLEND_SUBTRACT		3
#define BLEND_MULTIPLY		4

#define MATRIX_COPY			0
#define MATRIX_MULTIPLY		1
#define MATRIX_ADD			2
#define MATRIX_SUBTRACT		3
#define MATRIX_INVERT		4
#define MATRIX_ROTATE		5
#define MATRIX_SCALE		6
#define MATRIX_TRANSLATE	7
#define MATRIX_INTERPOLATE	8
#define MATRIX_MODIFY		128
    
#define ICON_ADD			0
#define ICON_SUBTRACT		1
#define ICON_MULTIPLY		2
#define ICON_OVERLAY		3
#define ICON_AND			4
#define ICON_OR				5
#define ICON_UNDERLAY		6

//Do not use: see __defines/layers.dmm
#define FLOAT_LAYER			-1
#define AREA_LAYER			1
#define TURF_LAYER			2
#define OBJ_LAYER			3
#define MOB_LAYER			4
#define FLY_LAYER			5
#define EFFECTS_LAYER		5000
#define TOPDOWN_LAYER		10000
#define BACKGROUND_LAYER	20000
  
// Sound ///////////////////////////////////////////////////////

#define SOUND_MUTE		1
#define SOUND_PAUSED	2
#define SOUND_STREAM	4
#define SOUND_UPDATE	16

// Directions //////////////////////////////////////////////////

#define NORTH		1
#define SOUTH		2
#define EAST		4
#define WEST		8
#define NORTHEAST	5
#define NORTHWEST	9
#define SOUTHEAST	6
#define SOUTHWEST	10
#define UP			16
#define DOWN		32

// Vision //////////////////////////////////////////////////////

#define BLIND		1
#define SEE_MOBS	4
#define SEE_OBJS	8
#define SEE_TURFS	16
#define SEE_SELF	32
#define SEE_INFRA	64
#define SEE_PIXELS	256
#define SEEINVIS	2
#define SEEMOBS		4
#define SEEOBJS		8
#define SEETURFS	16

#define MOB_PERSPECTIVE		0
#define EYE_PERSPECTIVE		1
#define EDGE_PERSPECTIVE	2

// Input ///////////////////////////////////////////////////////

#define MOUSE_INACTIVE_POINTER		0
#define MOUSE_ACTIVE_POINTER		1
#define MOUSE_DRAG_POINTER			3
#define MOUSE_DROP_POINTER			4
#define MOUSE_ARROW_POINTER			5
#define MOUSE_CROSSHAIRS_POINTER	6
#define MOUSE_HAND_POINTER			7

#define MOUSE_LEFT_BUTTON			1
#define MOUSE_RIGHT_BUTTON			2
#define MOUSE_MIDDLE_BUTTON			4
#define MOUSE_CTRL_KEY				8
#define MOUSE_SHIFT_KEY				16
#define MOUSE_ALT_KEY				32

// Miscellaneous ///////////////////////////////////////////////
	
#define TOPDOWN_MAP		0
#define ISOMETRIC_MAP	1
#define SIDE_MAP		2
#define TILED_ICON_MAP	32768

#define NO_STEPS		0
#define FORWARD_STEPS	1
#define SLIDE_STEPS		2
#define SYNC_STEPS		3

#define MALE	"male"
#define FEMALE	"female"
#define NEUTER	"neuter"
#define PLURAL	"plural"
