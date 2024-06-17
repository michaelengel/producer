#include "Producer.h"
= SelectorConstant : Constant CATEGORIES() {}
- type
	{ return types.SELECTOR; }
- gen
	{ id t = types.SELECTOR;  
	dbg("%s: (%s)%s\n", NAMEOF(self), [t str], [self str]);
	gs("@selector("); [super gen]; gc(')'); return self; }
=:
