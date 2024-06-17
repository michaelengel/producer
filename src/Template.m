#include "Producer.h"
#define MAXSELECTOR 5000
= Template : ByteArray CATEGORIES() 
	{ id receiverType, selector; }
+ receiverType:aType selector:aSelector {
	char strBuf[MAXSELECTOR];
	id s = aSelector; strBuf[0] = 0;
	for (s = aSelector; s;  s = [s successor]) strcat(strBuf, [s str]);
	self = [super str:strBuf];
	receiverType = aType;
	selector = aSelector;
	return self;
}
- receiverType
	{ return receiverType; }
- selector
	{ return selector; }
