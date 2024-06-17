// MsgTranslator: a set of MsgNamePatterns. These hold a string (the
//	concatenated selector characters) and a collection of MsgArgPatterns
//	describing one of the types (for receiver and arguments) for which
//	a translation is known
#include "Producer.h"
	EXPORT id msgTranslator = nil;
	USE MsgNamePattern, MsgArgPattern, Msg;
= MsgTranslator : Set CATEGORIES()
+ initialize 
	{ if (!msgTranslator) msgTranslator = [self new]; return self; }
- install:aTemplate translation:aTranslation {
	id name = [[aTemplate selector] asByteArray];
	id msgNamePattern = [self find:name];
	if (msgNamePattern) [name free];
	else [self add:msgNamePattern=[MsgNamePattern name:name]];
	[msgNamePattern add:[MsgArgPattern
		template:aTemplate translation:aTranslation]];
	return self;
}
