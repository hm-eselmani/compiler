# Compiler

This compiler is written in with lex/flex and yacc/bison. Yacc is a Look Ahead Left-to-Right Rightmost Derivation (LALR) parser generator, generating a LALR parser. The compiler expects the user to write some lines in the inputfile "eins.klx".

If there aren't any matching rules to the input of the user, the program will give an error message. Otherwise the compiler will parse the input and as a result, the user will get a PostScript file.

Example:
Input User: Circle at x y in blue;
Output: A circle, generated with the language PostScript, at the coordinates x and y and in the color blue.


Files:
- eins.klx --> Inputfile
- eins.ps --> PostScript outputfile
- klx.l --> lex file where the accepted characters of the inputfile and tokens are defined.
- klx.y --> yacc file where the grammar rules are defined.
- Makefile --> compiles and executes the program.

Imported Files:
- klx.tab.c / klx.tab.h
- symtab.c / symtab.h
- lex.yy.c
- parser.tab.c
