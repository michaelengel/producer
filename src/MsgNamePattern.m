// Each message may have several translations depending on the type of
//	the receiver and the message's arguments. MsgNamePattern holds the
//	name of the message (concatenated selector in selectorByteArray)
//	and an ordered collection of MsgArgPatterns. These are IdArrays
//	holding the type of the receiver followed by the types of the arguments.
//	Each MsgArgPattern also holds the translation for the messages that
//	match in name and argument type.
#include "Producer.h"
= MsgNamePattern : OrdCltn CATEGORIES()
	{ id selectorByteArray; }
+ name:aByteArray
	{ self = [super new]; selectorByteArray = aByteArray; return self; }
- (unsigned)hash
	{ return [selectorByteArray hash]; }
- (BOOL)isEqual:aMsgNamePattern
	{ return [selectorByteArray isEqual:aMsgNamePattern]; }
- (STR)str
	{ return [selectorByteArray str]; }
