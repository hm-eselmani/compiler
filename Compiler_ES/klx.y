

%{
#include <stdio.h>
#include "symtab.h"

extern int yylineno;
extern int yylex(void);
int yyerror(char *msg)
{ fprintf(stderr, "ERROR %d: %s\n", yylineno,msg); 
  return 0;
}


%}


%token BOAT
%token LINE
%token SQUARE
%token CIRCLE 
%token SEMICOLON 
%token COLON
%token AT 
%token PLUS
%token TIMES
%token OPEN
%token CLOSE
%token MINUS
%token DIV
%token <i> NUMBER 
%token SQRT
%token VAR
%token <n> SYMBOL 
%token ASSIGN
%token COMMA
%union {int i; double d; node *n;}
%token WHILE
%token DO
%token LESS
%token OPENBR
%token CLOSEBR
%token LESSEQ
%token GREATER 
%token GREATEREQ
%token  IF
%token IFELSE
%token PROC
%token RED
%token WHITE
%token GREEN
%token BLUE
%token YELLOW
%token SKYBLUE
%token YELLOWSUN
%token BROWN
%token IN
%token SIGNATURE

%%
program: head decllist statementlist tail;

head: {printf("%%!PS\n\n");} ;

decllist: ;
decllist: decllist decl;

decl: VAR SYMBOL SEMICOLON { printf("/klx%s 0 def\n", $2->name); $2->defined=1;};
decl: VAR SYMBOL ASSIGN expr SEMICOLON {printf("/klx%s 0 def\n", $2->name); $2->defined=1;};

decl: PROC SYMBOL {printf("/klx%s {\n", $2->name);} scopeopen OPEN arglist CLOSE statement scopeclose {printf("} def\n");};


arglist: ;
arglist: symbollist;
symbollist: SYMBOL {printf("/klx%s exch def\n", $1->name); $1->defined=1;};
symbollist: SYMBOL COMMA symbollist {printf("/klx%s exch def\n", $1->name); $1->defined=1;};




statementlist: ;
statementlist: statementlist statement;

position: AT expr COMMA expr { printf("/y exch def /x exch def\n"); };
position: { printf("/x 0 def /y 0 def\n"); };

statement: SQUARE position SEMICOLON
    { printf("x y moveto 0 100 rlineto 100 0 rlineto 0 -100 rlineto -100 0 rlineto closepath gsave 0.5 1 0.5 setrgbcolor fill grestore 1 0 0 setrgbcolor 4 setlinewidth stroke\n");}

statement: LINE position color SEMICOLON {printf("30 setlinewidth newpath x y moveto 650 y lineto stroke\n");};

statement: BOAT position color SEMICOLON {printf("7 setlinewidth 1 setlinecap x y newpath moveto 385 240 lineto 460 240 lineto 495 270 lineto x y closepath fill stroke\n422 270 newpath moveto 422 350 lineto stroke\n" );};

statement: SIGNATURE COLON NUMBER position color SEMICOLON 
{printf("/Baskerville %d selectfont x y moveto (Etike Selmani IF4A) show showpage\n", $3);};

statement: CIRCLE position color SEMICOLON
    { printf("newpath x y 50 0 360 arc fill\n");}


statement: SYMBOL ASSIGN expr SEMICOLON
           { if ($1->defined) printf("/klx%s exch store\n" , $1->name); 

             else yyerror("Undefined variable\n");
           };


dummyWhile: { printf("{ ");};
openIf: { printf("\n{\n");};
closeBracket: { printf("}\n");};
openBracket: { printf("{\n");};
closeIf: { printf("}\nifelse\n");};

statement: WHILE dummyWhile bool DO { printf("not {exit} if\n");} statement { printf("} loop\n");};
statement: IF bool openIf statement closeBracket openBracket statement closeIf IFELSE;

statement: OPENBR 
           scopeopen
           decllist
           statementlist 
           CLOSEBR
           scopeclose;


statement: SYMBOL OPEN paramlist CLOSE SEMICOLON { printf("klx%s " , $1->name); };

paramlist: ;
paramlist: exprlist;
exprlist: expr;
exprlist: exprlist COMMA expr;

scopeopen: { scope_open(); printf("4 dict begin\n");};
scopeclose: { scope_close(); printf("end\n");}; 

color: {printf("0 0 0 setrgbcolor\n");};
color: IN RED {printf("1 0 0 setrgbcolor\n");};
color: IN BLUE {printf("0.392 0.584 0.929 setrgbcolor\n");};
color: IN SKYBLUE {printf("0.69 0.886 1 setrgbcolor\n");};
color: IN WHITE {printf("1 1 1 setrgbcolor\n");};
color: IN GREEN {printf("0 1 0 setrgbcolor\n");};
color: IN YELLOW {printf("0.953 0.898 0.67 setrgbcolor\n");};
color: IN YELLOWSUN {printf("1 0.913 0 setrgbcolor\n");};
color: IN BROWN {printf("0.545 0.27 0.074 setrgbcolor\n");};

expr: expr PLUS prod {printf("add ");};
expr: expr MINUS prod {printf("sub ");};
expr: prod;

prod: prod TIMES atomic {printf("mul ");};
prod: prod DIV atomic {printf("div ");};
prod: atomic;
prod: MINUS atomic {printf("neg ");};
prod: SQRT atomic {printf("sqrt ");} ;

atomic: NUMBER  {printf("%d ", $1);};
atomic: OPEN expr CLOSE;
atomic: SYMBOL { printf("klx%s " , $1->name); }

bool: expr LESS expr {printf("lt ");} ;
bool: expr LESS ASSIGN expr {printf("le ");} ;
bool: expr GREATER expr {printf("gt ");} ;
bool: expr GREATER ASSIGN expr {printf("ge ");} ;

tail: ;


%%

int main(void) {
    yyparse();
    return 0;
}





