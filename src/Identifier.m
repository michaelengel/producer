#include "Producer.h"
	USE Set, OrdCltn;
	IMPORT id identifierTranslator;
= Identifier:ByteArray CATEGORIES() 
	{ id translation, type; }
+ name:aByteArray 
	{ return [self str:[aByteArray str]]; }
+ str:(STR)aString { 
	self = [super str:aString];
	type = types.UNKNOWN;
	translation = [identifierTranslator find:self];
	return self;
}
+ uniqueIdentifier:(STR)aString { static int uniqueness = 0;
	return [self sprintf:"%s%d", aString, uniqueness++];
}
- gen {
	if (translation) [translation gen];
	else gs([self str]); 
	return self; 
}
- genDeclaration {
	if (translation) [translation genDeclaration];
	else {
		if (type == nil) gs("<nil>"); else [type gen];
		gc(' '); gs([self str]); gc(';');
	}
	return self;
}
- type { 
	if (translation) return type = [translation type];
	// dbg("%s: (%s)%s\n", NAMEOF(self), [type str], [self str]);
	// if (type == types.UNKNOWN) [self type:types.ID rule:"default: first use"];
	return type; 
}
- type:aType rule:(STR)aString {
	if (translation && type != aType) {
		info("attempt to change type of translated symbol %s ignored (%s)",
			[self str], aString);
		return self;
	}
	if (aType == nil)
		return [self error:"nil type"]; 
	if (type != types.UNKNOWN && aType != type) {
		wer("%s %s; tried to change type from %s to %s ignored (%s)",
			NAMEOF(self), [self str], [type str], [aType str], aString);
	} else {
		info("type of %s is (%s) (%s)\n", [self str], [aType str], aString);
		type = aType;
	}
	return self;
}
- free { return nil; }
=:
