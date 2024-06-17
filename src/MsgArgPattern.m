#include "Producer.h"
= MsgArgPattern : IdArray CATEGORIES() 
	{ id translation; }
+ template:aTemplate translation:aTranslation { id s; unsigned i = 0;
	self = [self new:[aTemplate size]+1];
	[self at:i++ put:[aTemplate receiverType]];
	for (s = [aTemplate selector]; s; s = [s successor]) {
		id t = [s type];
		if (t == 0 || t == types.UNKNOWN) t = types.ANY;
		[self at:i++ put:t];
	}
	return [self translation:aTranslation];
}
- type
	{ return [translation type]; }
- translation:aTranslation
	{ translation = aTranslation; return self; }
- translation
	{ return translation; }
