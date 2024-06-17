#include "Producer.h"
= StringConstant : Constant CATEGORIES() {}
+ str:(STR)aString { STR rindex(), p;
	if (*aString == '\'' && (p = rindex(aString, '\''))) {
		char c = *p; *p = 0;
		self = [super str:aString+1];
		*p = c;
		return self;
	} else return [super str:aString];
}
- type 
	{ id t = types.CSTRING; return t; }
- gen
	{ gc('"'); [super gen]; gc('"'); return self; }
=:
