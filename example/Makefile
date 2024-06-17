O= BounceInBoxNode.o 
M= BounceInBoxNode.m 
S= BounceInBoxNode.st 
.SUFFIXES:
.SUFFIXES: .m .st .o .i
P=../src/producer -c
R=../rules/generic.ru animation.ru
X=objcc -c -I/u/cox/ui
all: rm src
rm:					; rm -f $M
src: $M
obj: $O
stvd.a:	$O			; ar ruv stvd.a $*
.st.o:				; $P $R $< >$*.m && $X $*.m
.st.m:				; -$P $R $< >$*.m
.st.i:				; $P -i $R $< >$*.i 2>&1
.m.o:				; $X $*.m
wc:					; wc $S
clean:				; rm -f *.[mcoi] log core
