#include "Producer.h"
= FunctionTranslation : AbstractTranslation CATEGORIES() {
	id functionName;
	id functionArgumentList;
}
+ name:aFunctionName args:anArgumentList {
	self = [super new];
	functionName = aFunctionName;
	functionArgumentList = anArgumentList;
	return self;
}
- genReceiver:aReceiver selector:aSelector {
	id arg; unsigned argNumber = 0; USE Msg;
	[functionName gen]; gc('(');
	for (arg = functionArgumentList; arg; arg = [arg successor]) {
		STR name = [arg str]; 
		if (argNumber != 0) gc(',');
		if (*name == '%') {
			unsigned index = atoi(name+1);
			if (index == 0) [aReceiver gen];
			else if (index >= [aSelector size])
				wer("argument offset %d out of range", index);
			else [[[aSelector at:index-1] argument] gen];
		} else if (argNumber == 0) [aReceiver gen];
		else [[[aSelector at:argNumber-1] argument] gen];
		argNumber++;
	}
	gc(')'); return self;
}
- (STR)str { return [functionName str]; }
#define MAXARRAY 2048
- asTypedByteArray { char buf[MAXARRAY]; id arg; USE ByteArray;
	strcpy(buf, [functionName str]);
	for (arg = functionArgumentList; arg; arg = [arg successor]) {
		sprintf(buf+strlen(buf), "(%s)%s ", 
			[[arg argumentType] str], [[arg argumentName] str]);;
	}
	return [ByteArray str:buf];
}
