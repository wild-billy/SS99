
//**************************************************************
//
// Standard Defines
// -------------------
// Contains essential defines used throughout the code.
//
// Some of these are "cosmetic" defines for clarity and such.
// That's what this language is made for, so might as well.
//
//**************************************************************

// Boolean /////////////////////////////////////////////////////

#define TRUE	1
#define FALSE	0

// Numbers/Math ////////////////////////////////////////////////
// See doc/external/dm/math.txt

#define BIN_MAX	65535
#define INT_MAX	16777215
#define NUM_MAX	(3.4*10**38)

// Language ////////////////////////////////////////////////////

#define AND		&&
#define OR		||
#define NOT		!

#define SET		|=
#define CLEAR	&= ~
#define TOGGLE	^=
#define isSET	&

#define async	spawn()
#define RETURN	//This is because of byond's manual-return cost
