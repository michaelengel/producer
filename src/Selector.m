#include "Producer.h"
#define strEq(p, q) (strcmp(p, q) == 0)
#define strHas(s, c) (index(s, c) != 0)
#define MAXSELECTOR 512
	STR strCopy(), xlate();
	USE ByteArray, IdArray; 

= Selector:Node CATEGORIES() 
	{ STR name; id argument; }
+ name:aString argument:anArgument 
	{ return [[self name:aString] argument:anArgument]; }
+ name:aString 
	{ return [self str:[aString str]]; }
+ str:(STR)aString { 
	self = [super new];
	name = strCopy(aString);
	if (strlen(name) < 1) return [self error:"nil selector"];
	return self; 
}
// Inherited deepCopy seems to not copy the name argument correctly
- deepCopy {
	id t = [[isa str:name] argument:argument]; 
	[t successor:[successor deepCopy]];
	return t;
}
- (BOOL)isUnary
	{ return argument == nil; }
- asByteArray { char strBuf[MAXSELECTOR]; strBuf[0] = 0;
	do { strcat(strBuf, name); } while (self = successor);
	return [ByteArray str:strBuf];
}
- asTypeArray { id typeArray;
	if ([self isUnary]) typeArray = [IdArray new:0];
	else { 
		typeArray = [IdArray new:[self size]];
		do { [typeArray add:[argument type]]; } while (self = successor);
	}
	return typeArray;
}
- asTypedByteArray { char strBuf[MAXSELECTOR]; strBuf[0] = 0;
	do { strcat(strBuf, name);
		if (argument)
			sprintf(strBuf+strlen(strBuf), "(%s) ", [[argument type] str]);;
	} while (self = successor);
	return [ByteArray str:strBuf];
}

// ByteArray emulation
- (STR)str 
	{ return name; }
- (unsigned)hash 
	{ return _strhash(name); }
- (BOOL)isEqual:anObject 
	{ return self == anObject || strcmp(name, [anObject str]) == 0; }
- (BOOL)isEqualSTR:(STR)aStr 
	{ return strcmp(name, aStr) == 0; }
- type {
	if (successor) [successor type];
	return [argument type];
}
- type:aType
	{ return [self type:aType rule:"force"]; }
- type:aType rule:(STR)aString 
	{ [argument type:aType rule:aString]; return self; }
- argument:anArgument 
	{ argument = anArgument; return self; }
- argument 
	{ return argument; }
- argumentType
	{ return [argument type]; }
- free 
	{ free(name); [argument free]; return [super free]; }
- gen {
	gs(xlate(name)); [argument gen]; 
	if (successor) { gc(' '); [successor gen]; }
	return self; 
}
- genDeclaration {
	gs(xlate(name));
	if (argument && [argument type] != types.ID) 
		{ gc('('); gs([[argument type] str]); gc(')'); }
	[argument gen];
	if (successor) { gc(' '); [successor genDeclaration]; }
	return self; 
}
=:
// Translate Smalltalk binary selectors to Objective-C keyword
static STR xlate(s) STR s; {
	static STR binarySelectorTbl= // parallel arrays!
			"+-/\\*~<>=@%&?!,|",
		objcSelectorStrings[]= { "plus", "minus", "slash", "backslash",
			"times", "tilde", "lesser", "greater", "equals", "point", "percent",
			"ampersand", "question", "bang", "comma", "or", "/*@*/", 0};
	STR i, index(); static char buf[MAXSELECTOR];
	*buf = 0;
	if (i = index(binarySelectorTbl, s[0])) {
		strcat(buf, objcSelectorStrings[i-binarySelectorTbl]);
		if (s[1]) {
			if (i = index(binarySelectorTbl, s[1]))
				strcat(buf, objcSelectorStrings[i-binarySelectorTbl]);
			else wer("bad char in binary selector <%c>", s[1]);
			if (s[2]) wer("binary selector more than 2 chars long <%s>", s);
		}
		strcat(buf, ":");
		return buf;
	}
	return s;
}
