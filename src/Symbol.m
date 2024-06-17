/*{ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Symbol
	My instances in only a single copy, allowing them to be tested for
	equality via == instead of isEqual:

bjc: A prototype; not tested under load. The hash and isEqual: methods
	have broken since I was here last (library incompatibilities?)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ }*/
#include "Producer.h"
	USE Set;
= Symbol:ByteArray CATEGORIES() { }
	LOCAL id symbolTable;

+ initialize
	{ if (!symbolTable) symbolTable = [Set new]; }
+ symbolTable
	{ return symbolTable; }
+ str:(STR)aStr 
	{ return [symbolTable filter:[super str:aStr]]; }
+ name:aByteArray 
	{ return [self str:[aByteArray str]]; }
- free 
	{ return nil; }
- str:(STR)aStr 
	{ return [self cannotModifyError]; }
- (char)charAt:(unsigned)anOffset put:(char)aChar 
	{ return (char)[self cannotModifyError]; }
- sort 
	{ return [self cannotModifyError]; }
- concat:aStr 
	{ return [self cannotModifyError]; }
- concatSTR:(STR)aCString
	{ return [self cannotModifyError]; }
- concatenateAndFreeReceiver:aByteArray 
	{ return [self cannotModifyError]; }
- concatenateSTRAndFreeReceiver:(STR)aString 
	{ return [self cannotModifyError]; }
- concatenateSTR:(STR)aString 
	{ return [self cannotModifyError]; }
- concatenate:aByteArray
	{ return [self cannotModifyError]; }
- cannotModifyError
	{ return [self error:"the bytes in a %s are invarient", [self name]]; }
#ifdef NOTWORKING
- (unsigned)hash 
	{ return (unsigned)self; }
- (BOOL)isEqual:anObject
	{ return self == anObject; }
#endif
=:

