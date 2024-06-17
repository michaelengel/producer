// Symbol scoping
//	A scope is an ordered collection Sets of identifiers
#include "Producer.h"
	USE Set, IntArray, Msg;
	EXPORT id symbolScope  = nil,
		undefinedSymbols = nil,
		globalSymbols = nil,
		identifierTranslator = nil;
= Scope:OrderedCollection CATEGORIES() 
+ initialize { 
	if (!symbolScope) {
		symbolScope = [self new]; 
		undefinedSymbols = [Set new];
		globalSymbols = [Set new];
		[symbolScope add:globalSymbols];
		[symbolScope add:undefinedSymbols];
		identifierTranslator = [Set new];
	}
	return self;
}
=:
id findSymbol(aVariable) id aVariable; {
	int i, n = [symbolScope size];
	for (i = n-1; i >= 0; i--) { id hit;
		if (hit = [[symbolScope at:i] find:aVariable]) 
			return hit;
	}
	info("undefined %s %s\n", NAMEOF(aVariable), [aVariable str]);
	[undefinedSymbols add:aVariable]; return aVariable;
}
