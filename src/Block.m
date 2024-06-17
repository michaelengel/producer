#include "Producer.h"
	IMPORT id symbolScope;
	USE Set;
= Block:Node CATEGORIES() { id blockVariables, statements; }
+ statements:aStatementList 
	{ return [[self new] statements:aStatementList]; }
- variables:aVarList { 
	if (!aVarList || [aVarList isEmpty]) return self;
	[aVarList addContentsTo:blockVariables = [Set new]];
	[symbolScope add:blockVariables];
	return self; 
}
- statements:aStatementList 
	{ statements = aStatementList; return self; }

- gen { BOOL needsCompound = blockVariables || [statements size] > 1;
	if (needsCompound) gc('{'/*}*/);
#ifndef COXLIB
	[blockVariables elementsPerform:@selector(genDeclaration)];
#else
	[blockVariables eachElementPerform:@selector(genDeclaration)];
#endif
	[statements genExpr];
	if (needsCompound) gc(/*{*/'}');
	return self; 
}
- free { 
	[symbolScope remove:blockVariables];
	[blockVariables freeContents]; [blockVariables free];
	[statements free];
	return [super free];
}
- type 
	{ [statements type]; return types.BLOCK; }
