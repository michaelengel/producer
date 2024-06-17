// Expressions: a source (a message or primary) for a value and a list of 
//	targets (variables) to assign values to. Cascaded message expressions 
//	are handled by linking expressions through their successor fields.
//
// Rewrites cascaded expressions like 
//		Foo new bar gag extent:hack; bletch.
//	as 
//		cascadeReceiver = [[[Foo new] bar] gag].
//		[cascadeReceiver extent:hack];
//		[cascadeReceiver ...
#include "Producer.h"
	IMPORT id temporaryVariablePool;
	USE Msg, List, Identifier;
= Expr:Node CATEGORIES() {
	id assignmentList;
	id value;
}
+ assign:anAssignmentList value:aValue 
	{ return [[[super new] assign:anAssignmentList] value:aValue]; }
- assign:aList
	{ assignmentList = aList; return self; }
- value:aValue
	{ if (value) info("value of %s reassigned\n", NAMEOF(self));
	value = aValue; return self; }
- value
	{ return value; }
- gen { 
	if (assignmentList) { id s, v;
		for (s = [assignmentList eachElement]; v = [s next]; ) 
			{ [v gen]; gs(" = "); }
		[s free];
	}
	[value gen]; 
	if (successor) { gc(';'); [successor gen]; }
	return self; 
}
- type { id type = [value type]; 
	if (successor) [successor type];
#ifndef COXLIB
	if (assignmentList)
		[assignmentList elementsPerform:@selector(type:rule:)
			with:type with:"value assignment"];
#else
	if (assignmentList)
		[assignmentList eachElementPerform:@selector(type:rule:)
			with:type with:"value assignment"];
#endif
	return type;
}
- cascade:anExpr { 
	id newReceiver = [Identifier uniqueIdentifier:"tmp"];
	if ([value isKindOf:Msg]) { 
		id newValue = [Msg receiver:newReceiver selector:[value selector]];
		id newExpr = [Expr assign:assignmentList value:newValue];
		value = [value receiver];
		assignmentList = [List with:1, newReceiver];
		[self successor:newExpr]; [newExpr successor:anExpr];
		do { id msg = [newExpr value];
			if ([msg isKindOf:Msg]) [msg receiver:newReceiver]; 
		} while (newExpr = [newExpr successor]);
	} else {
		if (!assignmentList) assignmentList = [List new];
		[assignmentList add:newReceiver];
		[self successor:anExpr];
	}
	[temporaryVariablePool add:newReceiver];
	return self;
}
- free { [assignmentList free]; [value free]; return [super free]; }
