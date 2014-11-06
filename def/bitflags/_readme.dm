
//**************************************************************
//
// Bitflag Defines
// ===================
// These work by creating a var, setting it to a number, and
// setting various bits in it by using binary arithmetic with
// the powers of 2.
//
//**************************************************************

        NO BITS          0     // 0000 0000 0000 0000
/////////////////////////////////////////////////////
#define EXAMPLE_ALPHA    1     // 0000 0000 0000 0001
#define EXAMPLE_BRAVO    2     // 0000 0000 0000 0010
#define EXAMPLE_CHARLIE  4     // 0000 0000 0000 0100
#define EXAMPLE_DELTA    8     // 0000 0000 0000 1000
#define EXAMPLE_ECHO     16    // 0000 0000 0001 0000
#define EXAMPLE_FOXTROT  32    // 0000 0000 0010 0000
#define EXAMPLE_GOLF     64    // 0000 0000 0100 0000
#define EXAMPLE_HOTEL    128   // 0000 0000 1000 0000
#define EXAMPLE_INDIA    256   // 0000 0001 0000 0000
#define EXAMPLE_JULIET   512   // 0000 0010 0000 0000
#define EXAMPLE_KILO     1024  // 0000 0100 0000 0000
#define EXAMPLE_LIMA     2048  // 0000 1000 0000 0000
#define EXAMPLE_MIKE     4096  // 0001 0000 0000 0000
#define EXAMPLE_NOVEMBER 8192  // 0010 0000 0000 0000
#define EXAMPLE_OSCAR    16384 // 0100 0000 0000 0000
#define EXAMPLE_PAPA     32768 // 1000 0000 0000 0000
/////////////////////////////////////////////////////
        ALL BITS         65535 // 1111 1111 1111 1111
