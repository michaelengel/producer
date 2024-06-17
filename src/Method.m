#include "Producer.h"
	IMPORT id symbolScope;
	USE Set, Identifier;
	EXPORT id temporaryVariablePool = nil;
= Method:Object CATEGORIES() {
	id selector, comment, primitive, statements; 
	id argumentVariables, localVariables;
	id type, concatenatedSelector;
	BOOL isFactory; 
	id translation;
}
+ selector:aSelector asFactory:(BOOL)aBoolean { id sel, arg;
	self = [super new]; selector = aSelector; isFactory = aBoolean;
	concatenatedSelector = [aSelector asByteArray];
	argumentVariables = [Set new]; type = types.UNKNOWN;
	[argumentVariables add:[[Identifier str:"self"] 
		type:types.ID rule:"hardwired"]];
	for (sel = aSelector; sel && (arg = [sel argument]); sel = [sel successor])
		[argumentVariables add:arg];
	[symbolScope add:argumentVariables];
	temporaryVariablePool = localVariables = [Set new];
	return self;
}
- receiverType
	{ return types.ID; }
- comment:aString { comment = aString; return self; }
- variables:aVarList { 
	[aVarList addContentsTo:localVariables];
	[symbolScope add:localVariables];
	return self;
}
- selector
	{ return selector; }
- statements:aStmtList 
	{ statements = aStmtList; return self; }
- primitive:aToken 
	{ primitive = aToken; return self; }
- gen { USE Return;
dbg("//=======================Method gen==================================\n");
	[self type];	// this triggers the type inferencing machinery
dbg("//-----------------------Method gen----------------------------------\n");
	gn(); gc(isFactory ? '+' : '-'); gc(' ');
	if (type != types.ID) { gc('('); [type gen]; gc(')'); }
	[selector genDeclaration]; gs(" {");
#ifndef COXLIB
	[localVariables elementsPerform:@selector(genDeclaration)];
#else
	[localVariables eachElementPerform:@selector(genDeclaration)];
#endif
	[primitive gen]; [statements gen]; 
	if (![[statements lastElement] isKindOf:Return]) gs("return self;");
	gc('}'); return self;
}
- type { IMPORT id msgTranslator; id t; STR failReason = "name not found";
	id key, sourceStr, msgTranslation, stmt, s; 
	if (translation) return [translation type];
	[statements type]; [selector type];
	key = [selector asByteArray]; sourceStr = [selector asTypedByteArray];
	if (msgTranslation = [msgTranslator find:key]) { unsigned i, n; 
		dbg("translation for method %s\n", [sourceStr str]);
		if (![selector isUnary]) { id s;
			for (s = selector; s; s = [s successor]) { id st = [s type];
				if (st == types.UNKNOWN) [s type:types.ID rule:"method arg"];
			}
		}
		for (n = [msgTranslation size], i = 0; i < n; i++) { 
			id s, p, targetPattern = [msgTranslation at:i], targetStr;
			failReason = "types didn't match";
			if (![selector isUnary]) { unsigned offset = 1;
				for (s = selector; s; s = [s successor]) {
					id rt = [s type], pt = [targetPattern at:offset++];
					dbg("	actualArgType=%s patternArgType=%s\n",
						[rt str], [pt str]);
					if ((pt != types.ANY) && (rt != pt))
						goto tryAgain;	// break out to try next pattern
				}
			}
			translation = [targetPattern translation];
			type = [translation type];
			targetStr = [translation asTypedByteArray];
			info("method %s translated to (%s)%s (type match)\n", 
				[sourceStr str], [type str], [targetStr str]);
			[targetStr free];
			[translation assignTypesTo:selector];
			goto succeed;
tryAgain:;
		}
	}
	info("method %s translated literally (%s)\n",
		[sourceStr str], failReason);
succeed:
	if (!type) {
		for (stmt = statements; stmt; stmt = [stmt successor]) {
			if ([stmt isKindOf:Return])
				[self type:[stmt type] rule:"used type from return stmt"];
		}
	}
	if (type == types.UNKNOWN) [self type:types.ID rule:"default method type"];
	[key free]; [sourceStr free];
	return type;
}
- type:aType rule:(STR)aString {
	if (aType == nil) return [self error:"nil type"]; 
	if (type != types.UNKNOWN && aType != type) {
		wer("attempt to change type of method %s from %s to %s ignored (%s)",
			[self str], [type str], [aType str], aString);
	} else { id s = [selector asByteArray];
		info("type of method %s set to (%s) (%s)\n", 
			[s str], [aType str], aString);
		[s free]; type = aType;
	}
	return self;
}
- free { 
	[symbolScope remove:argumentVariables];
	[symbolScope remove:localVariables];
	[primitive free]; [selector free]; [comment free];
	[argumentVariables freeContents]; [argumentVariables free];
	[localVariables freeContents]; [localVariables free];
	[concatenatedSelector free];
	[statements free]; return [super free]; 
}
=:
