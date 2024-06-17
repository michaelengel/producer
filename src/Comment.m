#include "Producer.h"
	static id head = nil, tail = nil;
	BOOL stripCommentsFlag = YES;
= Comment:Node CATEGORIES() { STR text; }
+ str:(STR)aString { 
	if (!aString) return nil;
	self = [super new]; text = (STR)strCopy(aString);
	if (head == nil) head = self; else tail->successor = self;
	return tail = self;
}
+ gen { genReset(); [head gen];
	[head free]; head = tail = nil;
	return self; 
}
+ free 
	{ if (head) [head free]; head = tail = nil; return self; }
- (STR)str 
	{ return text; }
- free 
	{ free(text); return [super free]; }
- gen { 
	if (!stripCommentsFlag) { gf("// %s", text); [successor gen]; }
	return self; 
}
