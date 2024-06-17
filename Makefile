DOC= README producer.f
.SUFFIXES: .me .i .f
all: README
README: readme.f	; mv readme.f README
.me.i:		; itroff -me mac.me $<
.me.f:		; nroff -me mac.me $< >$$$$.f && mv $$$$.f $*.f
