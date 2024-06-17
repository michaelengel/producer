#include "Producer.h"
= Constant:Symbol CATEGORIES()
- gen 
	{ gs([self str]); return self; }
- type
	{ return [self subclassResponsibility]; }
- asByteArray
	{ return self; }
