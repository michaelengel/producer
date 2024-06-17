#include "Producer.h"
= CharConstant : Constant CATEGORIES() {}
- type
	{ return types.CHAR; }
- gen
	{ gf("'%s'", [self str]); return self; }
