#include "stdio.h"
#include "Producer.h"
= CATEGORIES()
	LOCAL BOOL showMsgTranslationFlag, showIdTranslationFlag;
STR *parseArguments(argc, argv) STR *argv; { unsigned i; USE Object;
	IMPORT BOOL dbgFlag, msgFlag, allocFlag, printFlag, lexFlag, infoFlag,
		autoFileFlag, stripCommentsFlag, infoFlag;
	IMPORT IOD dbgIOD;
	// settrap();	// trap interrupts
	[Object self];	// trigger initializes now
	dbgIOD = stderr;
	for (i = 1; i < argc; i++) { STR arg = argv[i];
		static char usage[]="usage: %s [-(dmaplgsci)] files ..";
		if (*arg == '-') 
			switch (*++arg) {
			case 'd': dbgFlag = YES; break;
			case 'm': msgFlag = YES; break;
			case 'a': allocFlag = YES; break;
			case 'p': printFlag = YES; break;
			case 'l': lexFlag = YES; break;
			case 'g': autoFileFlag = YES; break;
			case 's': stripCommentsFlag = YES; break;
			case 'c': stripCommentsFlag = NO; break;
			case 'i': infoFlag = YES; break;
			case 'M': showMsgTranslationFlag = YES; break;
			case 'I': showIdTranslationFlag = YES; break;
			default: fprintf(stderr, usage, argv[0]); bye(-2);
			}
		else return &argv[i];
	}
	return 0;
}
main(argc, argv) STR *argv; { USE Comment;
	IMPORT unsigned errorCount;
	STR *file = parseArguments(argc, argv);
	if (file) for (; *file; file++) {
			if (yyopen(*file, "r", stdin)) yyparse();
			else wer("cannot open %s\n", *file);
		}
	else yyparse(); 
	bye(errorCount != 0);
}
// Exit here.
bye(n) { static BOOL beenHere = 0; 
	IMPORT id msgTranslator, identifierTranslator;
	if (beenHere++) exit(n);
	if (showMsgTranslationFlag) {
		printf("msgTranslator============================\n");
		[msgTranslator show];
	}
	if (showIdTranslationFlag) {
		printf("identifierTranslator============================\n");
		[identifierTranslator show];
	}
	exit(n); 
}
@class(String, Block, ByteArray, Return, Selector, Comment, Stmt, AsciiFiler,
	Expr, Msg, StArray, Method, List, IdArray, Sequence, Cltn,
	Set, IntArray, Class, Identifier, MsgArgPattern, MsgNamePattern, 
	MsgTranslator, AbstractTranslation, FunctionTranslation, 
	MsgTranslation, StringTranslation, IdentifierTranslation,
	CharConstant, Constant, NumberConstant, SelectorConstant, StringConstant,
	Template, Type, ArgumentList, Scope)
@phyla CATEGORIES()
