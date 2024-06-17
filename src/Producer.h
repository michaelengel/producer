#ifndef PRODUCER_H
#	include "Substrate.h"
#	undef CATEGORIES
#ifndef COXLIB
#	define CATEGORIES() (Producer, Collection, Primitive)
#else
#	define CATEGORIES() (Producer, Substrate, Primitive)
#endif
#	define ARYSIZ(x) (sizeof(x)/sizeof(*x))
#	define strEq(a, b) (strcmp(a, b) == 0)
	typedef struct _TYPES {
		id DEFAULT, ID, CHAR, SHORT, INT, LONG, FLOAT, DOUBLE;
		id CSTRING, POINT, RECTANGLE;
		id BLOCK, STMT;
		id SELECTOR, SHARED;
		id UNKNOWN, ANY;
	} TYPE;
	IMPORT TYPE types;

#	define AbstractTranslation prAbstractTranslation
#	define ArgumentList prArgumentList
#	define Block prBlock
#	define CharConstant prCharConstant
#	define Class prClass
#	define Comment prComment
#	define Constant prConstant
#	define Expr prExpr
#	define FunctionTranslation prFunctionTranslation
#	define Identifier prIdentifier
#	define IdentifierTranslation prIdentifierTranslation
#	define List prList
#	define Method prMethod
#	define Msg prMsg
#	define MsgArgPattern prMsgArgPattern
#	define MsgNamePattern prMsgNamePattern
#	define MsgTranslation prMsgTranslation
#	define MsgTranslator prMsgTranslator
#	define Node prNode
#	define NumberConstant prNumberConstant
#	define Return prReturn
#	define Scope prScope
#	define Selector prSelector
#	define SelectorConstant prSelectorConstant
#	define StArray prStArray
#	define Stmt prStmt
#	define StringConstant prStringConstant
#	define StringTranslation prStringTranslation
#	define Template prTemplate
#	define Type prType

#define PRODUCER_H
#endif
