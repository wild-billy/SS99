
//**************************************************************
//
// Interfaces
// ==============
//
// An "interface" is sort of like a club for objects.
///
// They use it by carrying a "membership card" in implements,
// which tells other objects that they're "in the club".
//
// Objects that only want to deal with members of a certain club
// can check if an object implements that interface: if it does,
// they can go ahead and deal with it like any other member.
//
// For example, if an object implements "wrench", that means
// it's a wrench (no matter what its type is), and whoever wants
// a wrench can use it like one without checking anything else. 
// By putting "wrench" in implements, it promises that  "I'm a 
// wrench and can do whatever any other wrench can, so nothing 
// bad will happen if you call me and use me like one".
//
// We use these because they help us deal with diverse objects
// more elegantly than special-snowflake code, more maintainably
// than massive abuse of typechecks, and more safely than just 
// assuming shit. Quite useful in a type system like DM's.
//
// -------------------------------------------------------------
//
// To implement an interface, see the individual files.
//
// -------------------------------------------------------------
//
// To check if an object implements "example" (both work):
//
//   -------------------------------
//     if(X.implements["example"])
//     if(X.implements("example")
//   -------------------------------
//
// To check if it implements "ex1", "ex2", "ex3", and "ex4":
//
//   ---------------------------------------------
//     if(X.implements("ex1","ex2","ex3","ex4"))
//   ---------------------------------------------
//
// To get all the interfaces it implements (both work):
// 
//   ------------------
//     X.implements
//     X.implements()
//   ------------------
//
//**************************************************************

/var/global/list/interfaces = list()

////////////////////////////////////////////////////////////////

/datum/holder/interface
/datum/holder/theme/init()
	themes[src.name] = src
	return ..()

////////////////////////////////////////////////////////////////

/datum
	var/list/implements //"name"=TRUE (see core/_readme.dm)

/datum/proc/implements(/*...*/)
	if(args.len)
		if((args & src.implements).len == args.len) return TRUE
	else return src.implements
