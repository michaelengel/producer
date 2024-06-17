#include "Producer.h"
= Msg:Object CATEGORIES() {
	id receiver;
	id selector;
	id translation;
}
	IMPORT id msgTranslator;
	USE Template;
+ receiver:anObject 
	{ return [[self new] receiver:anObject]; }
+ receiver:anObject selector:aSelector
	{ return [[[self new] receiver:anObject] selector:aSelector]; }
+ selector:aSelector
	{ return [[self new] selector:aSelector]; }
- receiver 
	{ return receiver; }
- receiverType
	{ return [receiver type]; }
- receiver:anObject 
	{ receiver = anObject; return self; }
- selector 
	{ return selector; }
- selector:aSelector { 
	selector = aSelector;
	return self; 
}
- free {
	[receiver free];
	[selector free];
	return [super free]; 
}

// ByteArray Emulation
- (STR)str 
	{ return [selector str]; }
- (unsigned)hash 
	{ return _strhash([self str]); }
- (BOOL)isEqual:aStr	
	{ return strcmp([self str], [aStr str]) == 0; }
- (BOOL)isEqualSTR:(STR)aStr 
	{ return strcmp([self str], aStr) == 0; }
- type { id type;
	if (!translation) { unsigned i, n; STR failReason = 0;
		id s, key = [selector asByteArray];
		id msgTranslation, receiverType = [receiver type];
		id sourceStr = [selector asTypedByteArray];
		dbg("translating message [(%s) %s]\n",
			[[receiver type] str], [sourceStr str]);
		if (![selector isUnary]) {
			for (s = selector; s; s = [s successor]) {
				id st = [s argumentType];
				if (st == types.UNKNOWN) [s type:types.ID rule:"msg arg"];
			}
		}
		if (msgTranslation = [msgTranslator find:key]) {
			for (n = [msgTranslation size], i = 0; i < n; i++) {
				unsigned offset = 0; id s, targetStr;
				id targetPattern = [msgTranslation at:i];
				id patternReceiverType = [targetPattern at:offset++];
				dbg("	actualReceiverType=%s patternReceiver=%s\n",
				[receiverType str], [patternReceiverType str]);
				failReason = "receiver types didn't match";
				if (patternReceiverType == types.ANY 
					|| patternReceiverType == receiverType) {
					if (![selector isUnary]) { // if not unary selector
						failReason = "argument types didn't match";
						for (s = selector; s; s = [s successor]) {
							id rt = [s type], pt = [targetPattern at:offset++];
							dbg("	actualArgType=%s patternArgType=%s\n",
								[rt str], [pt str]);
							if ((pt != types.ANY) && (rt != pt))
								goto fail;	// break out to try next pattern
						}
					}
					translation = [targetPattern translation];
					targetStr = [translation asTypedByteArray];
					info("message [(%s)%s] translated to (%s)%s (type match)\n",
						[receiverType str], [sourceStr str],
						[[translation type] str], [targetStr str]);
					[targetStr free];
					goto succeed;
				}
fail:;
			}
		} else failReason = "name not found";
		info("message [(%s)%s] translated literally (%s)\n", 
			[receiverType str], [sourceStr str], failReason);
succeed:
		[key free]; [sourceStr free]; 
		if ([receiver type] == types.UNKNOWN)
			[receiver type:types.ID rule:"message receiver"];
	}
	type = translation ? [translation type] : types.ID;
	return type == types.UNKNOWN ? types.ID : type;
}
- gen {
	if (translation) [translation genReceiver:receiver selector:selector];
	else { 
		gc('['); [receiver gen]; gc(' '); [selector gen]; gc(']'); }
	return self; 
}
=:
