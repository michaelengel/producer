#include "Producer.h"
#include "stdio.h"
#include "ctype.h"
= CATEGORIES()
	LOCAL unsigned indent = 0;
	LOCAL BOOL bol = YES;
	LOCAL IOD genFD = stdout;
	LOCAL STR yyfilename = "<stdin>";

// Debug option
EXPORT void po(o) id o; 
	{ [o show]; }
EXPORT void dbgo(o) id o; 
	{ IMPORT BOOL dbgFlag; if (dbgFlag) [o show]; }
EXPORT int yywrap() 
	{ IMPORT unsigned yylineno; yylineno = 1; return 1; }

// stockpile the last n tokens for printing in error messages
#define SIZ 30
	LOCAL char minPt[SIZ+10] = "";	// slop
	LOCAL STR inPt = &minPt[SIZ-1], maxPt = &minPt[SIZ-1];
EXPORT void stockToken(s) STR s; {
	if (!s) return;
	if (isalnum(*inPt) && isalnum(*s)) {
		if (inPt >= maxPt) inPt = minPt;
		*inPt++ = ' ';
	}
	while(*s) {
		if (inPt >= maxPt) inPt = minPt;
		*inPt++ = *s++;
	}
}
LOCAL printToken(iod) IOD iod; { STR outPt, stopPt;
	if (inPt >= maxPt)	{ outPt = minPt; stopPt = maxPt-1; }
	else 				{ outPt = inPt; stopPt = inPt-1; }
	for(;;) {
		if (outPt >= maxPt) outPt = minPt;
		putc(*outPt ? *outPt : ' ', iod);
		if (outPt++ == stopPt) break;
	}
}
EXPORT IOD yyopen(file, mode, iod) STR file, mode; IOD iod; {
	IMPORT IOD yyin; IMPORT unsigned yylineno;
	yylineno = 1; return freopen(yyfilename = file, mode, yyin=stdin);
}
	EXPORT int errorCount = 0;
EXPORT void wer(fmt, arg) STR fmt, arg; { IMPORT unsigned yylineno; 
	fflush(stdout); fflush(genFD); fflush(stderr);
	fprintf(stderr, "error: ");
	_doprnt(fmt, &arg, stderr); fprintf(stderr, "\n");
	fflush(stdout); fflush(genFD); fflush(stderr);
	errorCount++;
}
EXPORT void yyerror(fmt, arg) STR fmt, arg; { IMPORT unsigned yylineno; 
	fflush(stdout); fflush(genFD); fflush(stderr);
	fprintf(stderr, "error %3d:%s: ", yylineno, yyfilename);
	printToken(stderr); fprintf(stderr, " : ");
	_doprnt(fmt, &arg, stderr); fprintf(stderr, "\n");
	fflush(stdout); fflush(genFD); fflush(stderr);
	errorCount++;
}
	EXPORT BOOL infoFlag = NO;
EXPORT void info(fmt, arg) STR fmt, arg; { IMPORT unsigned yylineno; 
	if (!infoFlag) return;
	fflush(stdout); fflush(genFD); fflush(stderr);
	fprintf(stderr, "fyi   %3d:%s: ", yylineno, yyfilename);
	_doprnt(fmt, &arg, stderr); fflush(stderr);
}
// String copy
EXPORT STR strCopy(s) STR s; { return (STR)strcpy(malloc(strlen(s)+1), s); }

// fopen(genFD)
EXPORT void genOpen(className) STR className; {
	if (genFD != stdout) fclose(genFD);
	genFD = fopen(className, "w");
	indent = 0; bol = YES;
	if (!genFD) { fprintf(stderr, "cannot open %s for writing ", className);
		perror("");
		exit(-1);
	}
}
EXPORT void genReset() { indent = 0; bol = YES; }

// Generate: formatted, string, newline, char
EXPORT void gc(c) { BOOL eol = NO, discardSemi = NO;
	switch(c) { 
	case '\n': case '\r': case '\f': newline(); return;
	case '{': eol = YES; discardSemi = NO; break;
	case '}': indent--; eol = YES; discardSemi = YES; newline(); break;
	case '(': indent++; discardSemi = NO; break;
	case ')': indent--; discardSemi = NO; break;
	case ';': if (discardSemi) return; eol = YES; discardSemi = YES; break;
	default: discardSemi = NO; break;
	}
	if (bol) idn();
	putc(c, genFD); 
	if (eol) newline();
	if (c == '{'/*}*/) indent++;
}
EXPORT void gf(s, arg) STR s, arg; { _doprnt(s, &arg, genFD); }
EXPORT void gs(s) STR s; { while(*s) gc(*s++); }
EXPORT void gn() { bol = NO; newline(); }
LOCAL idn() { unsigned i;
	for (i = indent; i-- != 0; ) putc('\t', genFD);
	bol = NO;
}
LOCAL newline() {
	if (!bol) putc('\n', genFD);
	bol = YES;
}
