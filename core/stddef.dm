
//**************************************************************
//
// Standard Defines
// ======================
//
// These are defines universal to DM code.
//
// Some of these are "cosmetic" defines for clarity and human-
// readability. They're quite helpful in the long term for 
// maintaining a large, open-source project, so please use them.
//
// NOTE: This will be split off and maintained as part of the DM
//       standard library at some point, with the rest of /core.
// 
// -------------------------------------------------------------
//
// About the logical operators, we have a problem: In DM &&, ||,
// and ! are normal booleans. And &, ~, |, and ^ are bitwise 
// operators. But then we have the boolean list ops: &, ^, and
// |. And on top of that, these triple as the matrix operators
// and quadruple as the icon blend operators!
// A nice mess you've gotten us into, BYOND.
// 
// The upside of this is that they map quite nicely to different
// cases of their names: the normal combination and negation to
// modern-style "and", "or", and "not", and all the strange shit
// to the ALGOL-style "AND", "OR", "XOR", and "NOT". It's the
// best I could come up with, anyway.
//
//**************************************************************

// Boolean /////////////////////////////////////////////////////

#define TRUE  1
#define FALSE 0

#define and   &&
#define or    ||
#define not   !

// Binary and Special Boolean //////////////////////////////////

#define AND     &
#define OR      |
#define NOT     ~
#define XOR     ^

#define SET     |=
#define CLEAR   &= ~
#define TOGGLE  ^=
#define TEST    &

// Numbers/Math ////////////////////////////////////////////////

#define BIN_MAX 65535 /* BYOND uses 16-bit binary arithmetic */
#define INT_MAX 16777215 /* Largest consecutive single float */
#define NUM_MAX (3.4*10**38) /* Largest usable single float */

// Iteration ///////////////////////////////////////////////////

#define loop      while(TRUE)
#define until(X)  while(!(X))

// Synchronization /////////////////////////////////////////////

#define async   spawn() /* Hopefully a real keyword some day */
#define DESYNC  set waitfor = FALSE; sleep(); /* Good for i/o */
#define YIELD   sleep(-1); /* Let waiting procs go first */

// Miscellaneous ///////////////////////////////////////////////

#define RETURN  /* Because a real return adds extra overhead */

// Questionable ////////////////////////////////////////////////
// These aren't ALGOL or Lisp... but then again this isn't 1965.
// We need to do a community vote on these at some point.

#define is == /* Looks decent in similar languages. Thoughts? */
#define isnt != /* See above, also cf CoffeeScript*/
#define unless(X) if(!(X)) /* See above */
