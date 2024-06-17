#include "Producer.h"
= AbstractTranslation : Object CATEGORIES()
	{ id type; }
+ type:aType 
	{ return [[self new] type:aType]; }
- type 
	{ return type; }
- type:aType
	{ type = aType; return self; }
- (STR)str
	{ return (STR)[self subclassResponsibility]; }
- asTypedByteArray
	{ return (id)[self subclassResponsibility]; }
- assignTypesTo:aSelector {
	id s = [aSelector asByteArray];
	info("%s ignoring type assignment of %s\n", NAMEOF(self), [s str]);
	[s free]; return self;
}
