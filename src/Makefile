# Producer: The Smalltalk to ObjectiveC Translator
OCOBJ= Node.o List.o Block.o Comment.o \
	ByteArray.o \
		Symbol.o \
		Constant.o \
			Type.o \
			CharConstant.o \
			NumberConstant.o \
			SelectorConstant.o \
			StringConstant.o \
	Expr.o StArray.o Class.o \
	Msg.o Method.o Stmt.o Return.o \
	MsgArgPattern.o \
	MsgNamePattern.o \
	MsgTranslator.o \
	Template.o \
	Selector.o \
		ArgumentList.o \
	Identifier.o \
	IdentifierTranslation.o \
	AbstractTranslation.o \
		FunctionTranslation.o \
		MsgTranslation.o \
		StringTranslation.o \
	Scope.o
YACCOBJ=gram.o
LEXOBJ=lex.o
CCOBJ=gen.o main.o
OBJ=$(OCOBJ) $(YACCOBJ) $(LEXOBJ) $(CCOBJ)
LIBS=/u/ui/sb/Substrate.a
OBJC=objcc -q -g
MISC=main.m gram.y lex.l gen.m Producer.h 
SRC=README Makefile $(MISC) `_suffix .m $(OCOBJ) $(CCOBJ) | tr ' ' '\012' | sort`

.SUFFIXES:
.SUFFIXES: .y .l .m .o .c .me .i .f
all: METHODDECLS.o producer
producer: $(OBJ); $(OBJC) $(OBJ) && mv a.out producer
clean:		; rm -f *.o *.c [cpCP]_* log core gram.m lex.m
.y.o:		; yacc -dv $< && mv y.tab.c $*.m && $(OBJC) -c $*.m
.l.o:		; lex $< && mv lex.yy.c $*.m && $(OBJC) -c $*.m
.m.o:		; $(OBJC) -c -nRetain $<
.m.c:		; $(OBJC) -c $<
.me.i:		; me -i -t /u/cox/src/mac.me $<
.me.f:		; me -t /u/cox/src/mac.me $< >$$$$.f && mv $$$$.f $*.f
v.m: v.st	; -producer RULES/* v.st >v.m
v.o: v.m	; objc v.m -c -Retain -g -q -I../wg -I../ui $C
test:		; rm -f v.m; make v.o
wc:			; wc $(SRC)
