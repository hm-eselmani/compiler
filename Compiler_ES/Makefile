
all: klx eins.ps

lex.yy.c : klx.l symtab.h
	flex klx.l

klx.tab.h klx.tab.c: klx.y symtab.h
	bison  -d  klx.y

klx : lex.yy.c klx.tab.c symtab.c symtab.h klx.tab.h
	gcc lex.yy.c klx.tab.c symtab.c -ll -o klx

eins.ps : eins.klx klx
	./klx < eins.klx > eins.ps


clean:
	rm -f lex.yy.c klx.tab.h klx.tab.c klx