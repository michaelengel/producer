#include "Producer.h"
= ArgumentList:Node CATEGORIES()
	{ id argumentType, argumentName; }
+ type:aType name:aName {
	self = [super new];
	argumentType = aType;
	argumentName = aName;
	return self;
}
- argumentType
	{ return argumentType; }
- argumentName
	{ return argumentName; }
