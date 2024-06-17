%{
#include "Producer.h"
#include "y.tab.h"
	USE Comment;
	LOCAL STR collect();
	EXPORT BOOL lexFlag = NO;
	IMPORT BOOL stripCommentsFlag;
#ifndef OBJC_COX
= CATEGORIES()
#endif
/* Intrudes between lexer and parser for token-level debugging */
EXPORT int yylex() { STR typeStr, tokenValue; LOCAL char b[2]={0};
	int type = rawlexer();
	switch(type) {
	case DIGITS: typeStr="DIGITS"; tokenValue = yylval.S; break;
	case KEYWORD: typeStr="KEYWORD"; tokenValue = yylval.S; break;
	case IDENTIFIER: typeStr="IDENTIFIER"; tokenValue = yylval.S; break;
	case STRING: typeStr="STRING"; tokenValue = yylval.S; break;
	case CHARCON: typeStr="CHARCON"; tokenValue = yylval.S; break;
	default: b[0] = yylval.B; typeStr = tokenValue = b; break;
	}
	stockToken(tokenValue);
	if (lexFlag) printf("::%3d=%10s: %s\n", type, typeStr, tokenValue);
	return type;
}
LOCAL STR bitsToHex(s) STR s; { LOCAL char buf[80];
	LOCAL char charToHex[]="0123456789abcdef";
	unsigned short out = 0; STR p; int shiftBy;
	p = buf; *p++ = '0'; *p++ = 'x';
	for (shiftBy = 3; *s; shiftBy--,s++) {
		out |= (unsigned)(*s != '0') << shiftBy;
		if (shiftBy == 0) {
			*p++ = charToHex[out];
			out = 0;
			shiftBy = 3;
		}
	}
	*p = 0; return buf;
}
GETC(iod) IOD iod; { LOCAL char buf[BUFSIZ] = {0}; LOCAL STR p = buf;
	if (*p == 0) { p = buf; *p = 0;
		if (fgets(buf, sizeof(buf), iod) == NULL) { 
			STR q = &buf[strlen(buf)];
			*q++ = EOF; *q = 0;
		}
		if (!stripCommentsFlag) [Comment str:buf];
	}
	return *p++;
}
#      undef input
#      define input() (((yytchar=yysptr>yysbuf?U(*--yysptr):GETC(yyin))==10?\
	(yylineno++,yytchar):yytchar)==EOF?0:yytchar)
#      define yylex rawlexer
%}
%%
[ \t\n\f\r]+ { ; }
"\"" { yylval.S = collect(yyleng); }
"'" { yylval.S = collect(yyleng); return STRING; }
[A-Za-z][A-Za-z0-9]* { yylval.S = yytext; return IDENTIFIER; }
[A-Za-z][A-Za-z0-9]*: { yylval.S = yytext; return KEYWORD; }
[+/\\*~<>=@%|&?][+/\\*~<>=@%|&?] { yylval.S = yytext; return DOUBLESPECIAL; }
[0-9]+ |
[0-9]*\.[0-9]+ { yylval.S = yytext; return DIGITS; }
2r[0-1]+ { yylval.S = bitsToHex(&yytext[2]); return DIGITS; }
\$.  { yylval.S = &yytext[1]; return CHARCON; }
\$!! { yylval.S = "!"; return CHARCON; }
.  { return yylval.B = *yytext; }
%%
/* Collect a "String" 'CharacterConstant', #command or comment
 *	The item to be collected is identified (in `what') from the
 *	first character in yytext.
 *
 *	To save copying time, we collect as much as will fit directly in yytext[].
 *	An instance of String is then created to hold any overflows. The str
 *	returned from here will locate the result, whether held
 *	in yytext or aString.
 */
LOCAL STR collect(len)
	register short len;
{
	USE ByteArray; register short c;
	LOCAL id overflow = 0; char what = *yytext;
	if (overflow) overflow = [overflow free]; /* from last time around */
	for(;;) {
		if (len >= YYLMAX - 1) {
			yytext[len] = 0; len = 0;
			if (overflow) overflow = [overflow concatenateSTR:yytext];
			else overflow = [ByteArray str:yytext];
		}
		switch(yytext[len++] = c = input()) {
		case '\'': if (what == '\'') {
				if ((c = input()) == '\'') { yytext[len++] = c; continue; }
				else { unput(c); break; }
			} else continue;
		case '"': if (what == '"') break; else continue;
		case '*': if (what != '/') continue;
			if ((c = input()) == '/') { yytext[len++] = c; break; }
			unput(c); continue;
		case '\\': yytext[len++] = input(); continue;
		case '\n': continue;
		case 0: wer("Unterminated string or charconst"); break;
		default: continue;
		}
		yytext[len] = 0;
		return overflow
			? [(overflow = [overflow concatenateSTR:yytext]) str]
			: yytext;
	}
}
