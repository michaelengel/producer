#include "Producer.h"
= NumberConstant : Constant CATEGORIES() {}
- gen 
	{ gs([self str]); return self; }
+ str:(STR)aString
	{ return [super str:aString]; }
- type 
	{ return index([self str], '.') ? types.FLOAT : types.INT; }
