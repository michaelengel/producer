#include "Producer.h"
	BOOL autoFileFlag;
	USE OrderedCollection, Identifier;
	IMPORT id symbolScope;
	IMPORT STR index();
	IMPORT id findSymbol();
= Class:Object CATEGORIES() {
	id name, superclass, instanceVariables, classVariables, pdn, category;
	id instanceVariableScope, classVariableScope;
}
+ name:aClass { self = [super new]; name = aClass; 
	if (autoFileFlag) { char buf[80];
		sprintf(buf, "%s.m", [name str]);
		genOpen(buf);
	}
	return self; 
}
- superclass:aClass { superclass = aClass; return self; }
- instanceVariableNames:aString { STR s = [aString str], end;
	if (!instanceVariables) instanceVariables = [OrderedCollection new];
	if (*s == '\'') s++;
	while(end = index(s, ' ')) { 
		while(*end == ' ') *end++ = 0;
		[instanceVariables add:findSymbol([Identifier str:s])];
		s = end;
	}
	if (end = index(s, '\'')) { *end = 0;
		[instanceVariables add:findSymbol([Identifier str:s])];
	}
	[symbolScope add:instanceVariableScope=[instanceVariables asSet]];
	return self; 
}
- classVariableNames:aString { STR s = [aString str], end;
	if (!classVariables) classVariables = [OrderedCollection new];
	if (*s == '\'') s++;
	while(end = index(s, ' ')) { 
		while(*end == ' ') *end++ = 0;
		[classVariables add:findSymbol([Identifier str:s])];
		s = end;
	}
	if (end = index(s, '\'')) { *end = 0;
		[instanceVariables add:findSymbol([Identifier str:s])];
	}
	[symbolScope add:classVariableScope=[classVariables asSet]];
	return self; 
}
- poolDictionaries:aString { pdn = aString; return self; }
- category:aString { category = aString; return self; }
- gen { STR start, end, index(); 
	gn(); gs("#include \"st80.h\"\n");
	gs("= "); [name gen]; gc(':'); [superclass gen]; gs(" CATEGORIES()");
	gc('{'/*}*/);
#ifndef COXLIB
	[instanceVariables elementsPerform:@selector(genDeclaration)];
	gc(/*{*/'}');
	if (classVariables) 
		[classVariables elementsPerform:@selector(genDeclaration)];
#else
	[instanceVariables eachElementPerform:@selector(genDeclaration)];
	gc(/*{*/'}');
	if (classVariables) 
		[classVariables eachElementPerform:@selector(genDeclaration)];
#endif
	return self;
}
- free {
	[symbolScope remove:instanceVariableScope];
	[symbolScope remove:classVariableScope];
	[classVariables freeContents]; [instanceVariables freeContents];
	[classVariables free]; [instanceVariables free];
	[name free];
	[superclass free];
	[pdn free];
	[category free];
	return [super free];
}
