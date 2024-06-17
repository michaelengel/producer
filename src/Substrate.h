/*{^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Substrate.h: Extensions to the Objective-C Primitive and Collection substrate
	The macros hide nonPortable `features' of some C compilers (e.g. VMS).
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^}*/
#ifndef SUBSTRATE_H
#define SUBSTRATE_H
#	include "objc.h"
#	include "assert.h"
#	undef CATEGORIES
#	define CATEGORIES() (Substrate, Primitive)

/*{ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Stylistic Conventions
	The IMPORT/EXPORT convention (EXPORT int foo=aValue to export foo,
	IMPORT int foo to import it) is used instead of of the usual C 
	conventions (int foo=aValue to export foo and extern int foo to 
	import it) to provides a distinctive marker on each global declaration
	that string search tools key off of to find all global declarations 
	reliably. The convention also provides a convenient way to overcome
	deficiencies in some C compilers; notably VMS C.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ }*/
#	define LOCAL static
#	define USE @requires
#ifdef VMS
#	define IMPORT globalref
#	define EXPORT globaldef
#else
#	define IMPORT extern
#	define EXPORT /*export*/
#endif
// Obsolete
#	define FACTORY USE

/*{ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Renaming
	Translate all occurrences of external names that appear in the Primitive
	or Collection categories to new names defined in the Substrate category.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ }*/
#define OrderedCollection OrdCltn

/*{ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Bit banging macros
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ }*/
#	define RBIT(bits, mask)	(bits &= ~mask)
#	define SBIT(bits, mask)	(bits |=  mask)
#	define TBIT(bits, mask) (bits &   mask)

	typedef int *WORD;			/* Amorphous typed machine word */
	typedef unsigned int WRD;	/* amorphous type; `word' */
	typedef char BYTE;
	unsigned _strhash();
	IMPORT void put();
#endif
