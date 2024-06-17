#include "Producer.h"
= MsgTranslation : AbstractTranslation CATEGORIES()
	{ id receiverType, selector; }
+ receiverType:aType selector:aSelector {
	self = [super type:types.ID];
	receiverType = aType ? aType : types.ANY;
	selector = aSelector;
	return self;
}
- selector
	{ return selector; }
- receiverType
	{ return receiverType; }
- (STR)str
	{ return [selector str]; }
- genReceiver:aReceiver selector:aSelector {
	USE Msg; unsigned argNumber = 0; id sel;
	gc('['); [aReceiver gen]; 
	for (sel = selector; sel; sel = [sel successor], argNumber++) {
		STR name = [sel str]; gc(' ');
		if (*name == '%') {
			unsigned index = atoi(&name[1]);
			if (index == 0)
				wer("%%0 not allowed in MsgPattern rules");
			else if (index >= [aSelector size]) {
				wer("argument offset %d out of range", index);
			} else {
				gs([[selector at:index-1] str]);
				[[[aSelector at:index-1] argument] gen];
			}
		} else { 
			gs([[selector at:argNumber] str]); 
			[[[aSelector at:argNumber] argument] gen];
		}
	}
	gc(']'); return self;
}
- asTypedByteArray 
	{ return [selector asTypedByteArray]; }
- free
	{ return nil; }
- assignTypesTo:aSelector {
	id s = aSelector, p = [self selector];
	while(s && p) { [s type:[p type]];
		s = [s successor]; p = [p successor];
	}
	return self;
}
