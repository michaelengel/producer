// Translate message to string
#include "Producer.h"
#include "ctype.h"
= StringTranslation:AbstractTranslation  CATEGORIES() 
	{ id translation; }
+ type:aType translation:aByteArray 
	{ return [[self type:aType] translation:aByteArray]; }
- translation:aByteArray
	{ translation = aByteArray; return self; }
- (STR)str
	{ return [translation str]; }
- genReceiver:aReceiver selector:aSelector {
	STR rindex(), q, p;
	p = [translation str];
	for (; *p; p++) {
		if (*p == '\\') {
			gc(*p++); gc(*p); continue;
		} else if (*p == '%') {
			unsigned index = atoi(++p);
			if (index == 0) [aReceiver gen];
			else if (--index >= [aSelector size])
				wer("bad rule", index+1);
			else [[[aSelector at:index] argument] gen];
			while (isdigit(*p)) p++; p--;
		} else if (*p == '\n') {
			while(isspace(*p)) p++; p--;
		} else gc(*p);
	}
	return self;
}
- asTypedByteArray 
	{ return [translation asByteArray]; }
=:
static verifyArgCount(targetString, sourcePattern)
	STR targetString; id sourcePattern; 
{
	STR p;
	for (p = targetString; *p; p++) {
		if (*p == '\\') {
			*p++; continue;
		} else if (*p == '%') {
			unsigned index = atoi(++p);
			if (index != 0 && --index >= [sourcePattern size])
				wer("no such argument");
			while (isdigit(*p)) p++; p--;
		}
	}
}
