#include "Producer.h"
	TYPE types = { 0 };
	LOCAL id knownTypes;
	USE Set;
= Type : Constant CATEGORIES()
+ initialize { static BOOL beenHere;
	if (!beenHere) { beenHere = YES;
		self = Type; knownTypes = [Set new];

		// C base types
		types.ID = [self str:"id"];
		types.CHAR = [self str:"char"];
		types.SHORT = [self str:"short"];
		types.INT = [self str:"int"];
		types.LONG = [self str:"long"];
		types.FLOAT = [self str:"float"];
		types.DOUBLE = [self str:"double"];

		// Common derived types
		types.CSTRING = [self str:"STR"];
		types.POINT = [self str:"PT"];
		types.RECTANGLE = [self str:"RT"];

		// Language types
		types.BLOCK = [self str:"BLOCK"];
		types.STMT = [self str:"STMT"];
		types.SELECTOR = [self str:"SEL"];
		types.SHARED = [self str:"SHR"];

		// Misc
		types.UNKNOWN = [self str:"unknown"];
		types.ANY = [self str:"any"];
	}
	return self;
}
- type
	{ return self; }
=:
