#include "Producer.h"
= StArray:OrdCltn  CATEGORIES() 
	{ id type; }
- gen { id s, m;
	gs("={"); 
	for (s = [self eachElement]; m = [s next]; )
		{ [m gen]; gs(", "); }
	[s free]; gc('}'); return self; 
}
- type { id s, m;
	if (type) return type;
	if ([self isEmpty]) return types.ID;
	type = [[self firstElement] type];
	for (s = [self eachElement]; m = [s next]; )
		if ([m type] != type) wer("this array holds diverse types");
	[s free];
	return type;
}
