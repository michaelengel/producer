// type inferencing template
#include "Producer.h"
#include "assert.h"
	USE Set, IntArray, Msg;
	IMPORT id identifierTranslator, globalSymbols;
= IdentifierTranslation:ByteArray CATEGORIES() 
	{ id type, targetIdentifier; }
+ sourceName:sourceIdentifier targetType:aType targetName:anIdentifier {
	id result;
	self = [super str:[sourceIdentifier str]]; [sourceIdentifier free];
	targetIdentifier = anIdentifier;
	if (aType == 0 || aType == types.UNKNOWN) type = types.ID;
	else type = aType;
	[targetIdentifier type:type rule:"explicit rule"];
#ifndef COXLIB
	if ([identifierTranslator addNTest:self]) result = self;
	else result = [identifierTranslator find:self];
#else
	result = [identifierTranslator add:self];
#endif
	if (result && result != self && result->type != type) {
		dbg("result=%x result->type=%x\n", result, result->type);
		wer("incompatible translations for identifier %s. Using %s, ignoring %s",
			[self str], [type str], [result->type str]);
	}
	[globalSymbols add:self];
	return self;
}
- type
	{ return type; }
- type:aType rule:(STR)aString { 
	info("IdentifierTranslation %s ignored type change from %s to %s",
		[self str], [type str], [aType str]);
	return self; 
}
- gen 
	{ gs([targetIdentifier str]); return self; }
- genDeclaration { 
	[type gen]; gc(' '); gs([targetIdentifier str]); gc(';');
	return self;
}
- targetIdentifier
	{ return targetIdentifier; }
- free
	{ return nil; }
- asTypedByteArray 
	{ return [ByteArray sprintf:"(%s)%s", [type str], [self str]]; }
=:
