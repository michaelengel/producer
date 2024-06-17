/*{ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ByteArray.m
	Do not be misled by the superficial resemblance between this class
	and the BytArray class in functionality, method names, implementation, 
	and usage. They are totally different.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ }*/
#include <stdio.h>	/* @retain */
#include "Producer.h"
#include "vectors.h"	/* @retain */
#define badIndex(offset) ((unsigned)(offset) >= (unsigned)capacity)
#define goodIndex(offset) (!badIndex(offset))
	LOCAL char typeStr[]="\"";
	IMPORT int strlen(), atoi();
	IMPORT long atol();
	IMPORT double atof();
	IMPORT STR strcpy(), strcat();
	IMPORT unsigned _strhash();

= ByteArray:Array CATEGORIES() { }

// Indexed variable typing
+ (unsigned)ndxVarSize { return sizeof(char); }
+ (STR)ndxVarType { return typeStr; }
- (STR)describe { return typeStr; }

// Instance creation: Note that capacity records the capacity actually
//	available for characters. This is one more than the number requested
//	to guarantee that a null terminator will exist.
+ new { return [self new:0]; }
+ new:(unsigned)nExtra { self = (*_alloc)(self, nExtra+1);
	capacity = nExtra + 1; return self; 
}
+ str:(STR)aStr { unsigned n; if (aStr == 0) aStr = "";
	n = strlen(aStr); self = (*_alloc)(self, n+1);
	strcpy(IV(self), aStr); capacity = n+1; return self;
}
#define VA_TYPE int
+ sprintf:(STR)fmt; VA_TYPE va_alist; { char buf[BUFSIZ];
#ifdef BOOTSTRAP	/* @retain */
typedef int FILE;
#endif
#include "varargs.h"	/* @retain */
#ifdef BOOTSTRAP	/* @retain */
typedef char *va_list;
#endif
#ifdef _IOSTRG		/* @retain */
	{
	va_list ap;
	FILE iod;
	iod._cnt = sizeof(buf); iod._base = iod._ptr = buf;
	iod._flag = _IOWRT+_IOSTRG; va_start(ap);
	_prn(fmt, ap, &iod); va_end(ap);
	*iod._ptr = '\0';
	}
#else
# define INT int
	{
	va_list ap;
	int ilist[10]; register int *ip = ilist, i;
	va_start (ap);
	for (i = 0; i < 10; i++)
		*ip++ = va_arg(ap, INT);
	va_end (ap);
	ip = ilist;
	sprintf (buf, fmt, ip[0], ip[1], ip[2], ip[3], ip[4], ip[5],
		 ip[6], ip[7], ip[8], ip[9]);
	}
#endif
	return [self str:buf];
}
// Convert to indicated type
- (int)asInt { return atoi(IV(self)); } 
- (long)asLong { return atol(IV(self)); }
- (double)asFloat { return atof(IV(self)); }

// Accessing
- (STR)str { return IV(self); }
- str:(STR)aStr { strncpy(IV(self), aStr, capacity-1);
	IV(self)[capacity-1] = '\0'; return self; }
- (char)charAt:(unsigned)anOffset { return goodIndex(anOffset) ? 
	IV(self)[anOffset] : (char)[self boundsViolation:anOffset];
}
- (char)charAt:(unsigned)anOffset put:(char)aChar { STR p = IV(self)+anOffset;
	if goodIndex(anOffset) { char tmp= *p; *p=aChar; return tmp; }
	else return (char)[self boundsViolation:anOffset];
}
	LOCAL int cmp(a, b) char *a, *b; { return *a-*b; }
- sort { qsort(IV(self), capacity-1, sizeof(char), cmp); return self; }

#ifdef OBSOLETE
// Concatenate aStr to self. Reply 0 if truncation occurred.
- concat:aStr { return [self concatSTR:[aStr str]]; }
- concatSTR:(STR)aCString { unsigned me, l; if (aCString == 0) return 0;
	me = strlen(IV(self)); l = capacity-1;
	if (l > me) strncpy(IV(self)+me, aCString, l-me); 
	IV(self)[capacity-1] = '\0';
	return (l > me + strlen(aCString)) ? self : nil;
}
#endif
- concatenateAndFreeReceiver:aByteArray 
	{ return [self concatenateSTRAndFreeReceiver:[aByteArray str]]; }
- concatenateSTRAndFreeReceiver:(STR)aString 
	{ id tmp = [self concatenate:aString]; [self free]; return tmp; }
- concatenateSTR:(STR)aString 
	{ return [isa sprintf:"%s%s", [self str], aString]; }
- concatenate:aByteArray
	{ return [self concatenateSTR:[aByteArray str]]; }

// Comparing and hashing: hash must correlate with isEqual:
LOCAL int arycmp(obj, str) id obj; register STR str; {
	register unsigned siz = obj->capacity; register STR p = IV(obj);
	for (; siz--; p++, str++) if (*p != *str) return *p - *str;
	return 0;
}
- (int)compare:aStr { return aStr ? arycmp(self, [aStr str]) : NO; }
- (int)compareSTR:(STR)aStr { return aStr ? arycmp(self, aStr) : NO; }
- (BOOL)isEqual:aStr { return aStr ? arycmp(self, [aStr str]) == 0 : NO; }
- (BOOL)isEqualSTR:(STR)aStr { return aStr ? arycmp(self, aStr) == 0 : NO; }
- (BOOL)isCopyOf:anObject {
	return [super isCopyOf:anObject]
		&& (arycmp(self, IV(anObject)) == 0);
}
- (unsigned)hash 
	{ return _strhash(IV(self)); }
=:
