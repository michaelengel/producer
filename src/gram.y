%{
/* Grammar for Smalltalk-80
 *		3 shift/reduce, 0 reduce/reduce conflicts
 */
#include <stdio.h>
#include "objc.h"
#include "Producer.h"
= CATEGORIES()
	USE Block, Expr, List, Array, Type, StArray, Msg, Method, Return,
		Selector, Stmt, Identifier, IdentifierTranslation, StringTranslation,
		FunctionTranslation, NumberConstant, SelectorConstant, CharConstant, 
		StringConstant, MsgTranslation, Template, ArgumentList, Class, Comment;
	EXPORT BOOL printFlag,
		isFactory = NO;
	IMPORT id findSymbol();
	LOCAL id thisClass = nil;
	IMPORT id msgTranslator;
%}
%union	TYP { id O; char B; char *S; }
%type	<O> LocalVariables VarList PrimMarker Type Method MethodName Keyword
%type	<O> KwdMethodDecl StmtList Expr AssignmentList Primary 
%type	<O> UnaryObjDesc BinaryObjDesc SimpleMsgExpr UnaryExpr BinaryExpr
%type	<O> KeywordExpr KeywordArgList CascadedMsgExpr CascadedMsg
%type	<O> Literal ArrayMemberList ArrayMember Block BinarySelector
%type	<O> VariableName UnarySelector Template BlockVarList KeywordList
%type	<O> InferenceRule ObjcFunctionArgList ObjcFunctionPattern BlockVariables
%type	<O> ObjcKeywordPattern ObjcMsgPattern OptionalType
%type	<O> ParameterDesignator KeywordPattern PatternType TemplateType
%type	<O> CharacterConstant NumberConstant StringConstant Keyword
%type	<B> SpecialCharacter
%token	<S> IDENTIFIER DIGITS KEYWORD STRING CHARCON DOUBLESPECIAL
%token	<B> '%' '|' '&' '?' '#' '!' ',' '_'
%token	<B> '+' '-' '/' '\\' '*' '~' '<' '>' '=' '@' 

%left '_' 
%left IDENTIFIER STRING UnarySelector VariableIdentifier
%right KEYWORD BinarySelector
%start ChunkList
%%
ChunkList:
	| ChunkList Chunk { USE Comment; [Comment gen]; }
	;
Chunk: VariableName KEYWORD '#' VariableName
		KEYWORD StringConstant KEYWORD StringConstant 
		KEYWORD StringConstant KEYWORD StringConstant '!' {
			[Comment gen];
			if (thisClass) { [thisClass gen]; [thisClass free]; }
			thisClass = [Class name:findSymbol($4)];
			[thisClass superclass:findSymbol($1)];
			[thisClass instanceVariableNames:$6];
			[thisClass classVariableNames:$8];
			[thisClass poolDictionaries:$10];
			[thisClass category:$12];
			[thisClass gen];
		}
	| VariableName KEYWORD STRING '!' 
		{isFactory=NO;} Methods Sep
	| VariableName VariableName KEYWORD STRING '!' 
		{isFactory=YES;} Methods Sep
	| '{' InferenceRule '}' 
		{ [Comment free]; }
	| '{' error '}' 
	| error '!'
	;
Sep: '!'
	| Sep '!'
	;
Methods: 
	| Methods Method '!' 
		{ [Comment gen]; [$2 gen]; [$2 free]; }
	| Methods error '!' 
		{ [Comment gen]; }
	;
/* Declare a new method */
Method: MethodName LocalVariables 
			{ [$$=$1 variables:$2]; }
		PrimMarker StmtList 
			{ [$$ primitive:$4]; [$$ statements:$5]; }
	;
MethodName: UnarySelector
		{ $$ = [Method selector:$1 asFactory:isFactory]; }
	| BinarySelector VariableName
		{ $$ = [Method selector:[$1 argument:$2] asFactory:isFactory]; }
	| KwdMethodDecl 
		{ $$ = [Method selector:$1 asFactory:isFactory]; }
	;
PrimMarker: { $$ = nil; }
	| '<' KEYWORD NumberConstant '>'
		{ $$ = [NumberConstant sprintf:"primitive(%s);", [$3 str]]; [$3 free]; }
	;
LocalVariables: { $$ = nil; }
	| '|' VarList '|' 
		{ $$ = $2; }
	;
VarList: { $$ = nil; }
	| VarList VariableName 
		{ $$ = $1 ? $1 : [List new]; [$$ add:$2]; }
	;
KwdMethodDecl: Keyword VariableName 
	{ [$$=$1 argument:$2]; }
	| KwdMethodDecl Keyword VariableName 
		{ [$$=$1 add:[$2 argument:$3]]; }
	;
/* Statements and expressions */
StmtList: '^' Expr 
	{ $$ = [Return expr:$2]; }
	| Expr 
		{ $$ = [Stmt expr:$1]; }
	| Expr '.' 
		{ $$ = [Stmt expr:$1]; }
	| Expr '.' StmtList 
		{ [$$=[Stmt expr:$1] successor:$3]; }
	| error '.' 
		{ wer("erroneous statement ignored"); $$=nil; }
	;
Expr: AssignmentList Primary 
	{ $$ = [Expr assign:$1 value:$2]; }
	| AssignmentList SimpleMsgExpr 
		{ $$ = [Expr assign:$1 value:$2]; }
	| AssignmentList SimpleMsgExpr CascadedMsgExpr
		{ [$$ = [Expr assign:$1 value:$2] cascade:$3]; }
	;
AssignmentList: { $$ = nil; }
	| AssignmentList VariableName '_'
		{ $$ = $1 ? $1 : [List new]; [$$ add:findSymbol($2)]; }
	;
CascadedMsgExpr: CascadedMsg 
	{ $$=[Expr assign:nil value:$1]; }
	| CascadedMsgExpr CascadedMsg 
		{ [$$=$1 add:[Expr assign:nil value:$2]]; }
	;
CascadedMsg: ';' UnarySelector 
	{ $$ = [Msg selector:$2]; }
	| ';' BinarySelector UnaryObjDesc 
		{ $$ = [Msg selector:[$2 argument:$3]]; }
	| ';' KeywordArgList 
		{ $$ = [Msg selector:$2]; }
	;
Primary: VariableName 
	{ $$ = findSymbol($1); }
	| Literal | Block | '(' Expr ')' 
		{ $$ = $2; }
	;
SimpleMsgExpr: UnaryExpr | BinaryExpr | KeywordExpr ;
UnaryObjDesc: Primary | UnaryExpr ;
UnaryExpr: UnaryObjDesc UnarySelector 
	{ $$ = [Msg receiver:$1 selector:$2]; } ;
BinaryObjDesc: UnaryObjDesc | BinaryExpr ;
BinaryExpr: BinaryObjDesc BinarySelector UnaryObjDesc
		{ $$ = [Msg receiver:$1 selector:[$2 argument:$3]]; } ;
KeywordExpr: BinaryObjDesc KeywordArgList
		{ $$ = [Msg receiver:$1 selector:$2]; }
	;
KeywordArgList: Keyword BinaryObjDesc	
	{ [$$=$1 argument:$2]; }
	| KeywordArgList Keyword BinaryObjDesc 
		{ [$$=$1 add:[$2 argument:$3]]; }
	;
Literal: CharacterConstant | StringConstant | NumberConstant
	| '#' '(' ArrayMemberList ')' 
		{ $$ = $3; }
	| '#' UnarySelector 
		{ $$=[SelectorConstant name:$2]; [$2 free]; }
	| '#' BinarySelector 
		{ $$=[SelectorConstant name:$2]; [$2 free]; }
	| '#' KeywordList 
		{ $$=[SelectorConstant name:$2]; [$2 free]; }
	;
ArrayMemberList: { $$ = nil; }
	| ArrayMemberList ArrayMember 
		{ [$$ = $1 ? $1 : [StArray new] add:$2]; }
	;
ArrayMember: CharacterConstant | StringConstant | NumberConstant 
	| UnarySelector | BinarySelector | KeywordList 
	| '(' ArrayMemberList ')' 
		{ $$ = $2; }
	;
Block: '[' BlockVariables StmtList ']' 
	{ $$ = [$2 statements:$3]; }
	| '[' BlockVariables ']' 
		{ $$ = $2; }
	;
BlockVariables: 
	{ $$ = [Block new]; }
	| BlockVarList '|' 
		{ $$ = [[Block new] variables:$1]; }
	;
BlockVarList: ':' VariableName 
	{ [$$ = [List new] add:$2]; }
	| BlockVarList ':' VariableName 
		{ [$$=$1 add:$3]; }
	;
/* Type inferencing rules */
InferenceRule: '#' PatternType '[' ObjcMsgPattern ']'
		{ [msgTranslator install:[Template receiverType:[$4 receiverType]
			selector:[$4 selector]] translation:[$4 type:$2]]; }
	| Template '#' PatternType '[' ObjcMsgPattern ']'
		{ [msgTranslator install:$1 translation:[$5 type:$3]]; }
	| Template '#' PatternType ObjcFunctionPattern
		{ [msgTranslator install:$1 translation:[$4 type:$3]]; }
	| Template '#' PatternType StringConstant 
		{ [msgTranslator install:$1
			translation:[StringTranslation type:$3 translation:$4]]; }
	| '#' VariableName PatternType VariableName
		{ [IdentifierTranslation sourceName:$2 targetType:$3 targetName:$4]; }
	;
Template: TemplateType UnarySelector
		{ $$ = [Template receiverType:$1 selector:$2]; }
	| TemplateType BinarySelector TemplateType
		{ $$ = [Template receiverType:$1 selector:[$2 type:$3]]; }
	| TemplateType KeywordPattern
		{ $$ = [Template receiverType:$1 selector:$2]; }
	;
KeywordPattern: Keyword PatternType 
	{ [$$=$1 type:$2]; }
	| KeywordPattern Keyword PatternType
		{ [$$=$1 add:$2]; [$2 type:$3]; }
	;
ObjcFunctionPattern: VariableName '(' ObjcFunctionArgList ')'
		{ $$ = [FunctionTranslation name:$1 args:$3]; }
	| VariableName '(' ')'
		{ $$ = [FunctionTranslation name:$1 args:0]; }
	;
ObjcFunctionArgList: PatternType ParameterDesignator
		{ $$ = [ArgumentList type:$1 name:$2]; }
	| ObjcFunctionArgList ',' PatternType ParameterDesignator
		{ [$$=$1 add:[ArgumentList type:$3 name:$4]]; }
	;
ObjcMsgPattern: PatternType UnarySelector
		{ $$ = [MsgTranslation receiverType:$1 selector:$2]; }
	| PatternType ObjcKeywordPattern
		{ $$ = [MsgTranslation receiverType:$1 selector:$2]; }
	;
ObjcKeywordPattern: Keyword PatternType ParameterDesignator
		{ [$1 type:$2]; [$$=$1 argument:$3]; }
	| ObjcKeywordPattern Keyword PatternType ParameterDesignator
		{ [$$=$1 add:$2]; [$2 type:$3]; [$2 argument:$3]; }
	;
ParameterDesignator: VariableName
	| '%' DIGITS { $$=[NumberConstant sprintf:"%%%s", $2]; }
	;
/* Token Packaging */
KeywordList: KEYWORD { $$ = [Selector str:$1]; }
	| KeywordList KEYWORD { $$ = [$1 concatenateSTRAndFreeReceiver:$2]; }
	;
BinarySelector: '-' { $$ = [Selector str:"-"]; }
	| SpecialCharacter 
		{ char b[2]; b[0]=$1; b[1]=0; $$ = [Selector str:b]; }
	| DOUBLESPECIAL { $$ = [Selector str:$1]; }
	;
SpecialCharacter: '+' | '/' | '\\' | '*' | '~' | '<'
	| '>' | '=' | '@' | '%' | '&' | '?' | ',' | '|'
	;
PatternType: OptionalType { $$ = $1 ? $1 : types.ID; };
TemplateType: OptionalType { $$ = $1 ? $1 : types.ANY; };
OptionalType: { $$ = 0; } | '(' Type ')' { $$ = $2; };
Type: IDENTIFIER { $$=[Type str:$1]; };
VariableName: IDENTIFIER { $$=[Identifier str:$1]; };
UnarySelector: IDENTIFIER { $$ = [Selector str:$1]; };
CharacterConstant: CHARCON { $$ = [CharConstant str:$1]; };
NumberConstant: DIGITS { $$ = [NumberConstant str:$1]; }
	| '-' DIGITS %prec KEYWORD { $$ = [NumberConstant sprintf:"-%s", $2]; }
	;
StringConstant: STRING { $$ = [StringConstant str:$1]; };
Keyword: KEYWORD { $$ = [Selector str:$1]; };
%%

