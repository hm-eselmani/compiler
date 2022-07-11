%{
    #include "symtab.h"
    #include "klx.tab.h"
%}

%option yylineno

%%
Signature   return SIGNATURE;
Circle      return CIRCLE;
Line        return LINE;
Square      return SQUARE;
Boat        return BOAT;
white       return WHITE;
red         return RED;
blue        return BLUE;
skyblue     return SKYBLUE;
green       return GREEN;
yellow      return YELLOW;
yellowsun   return YELLOWSUN;
brown       return BROWN;
in          return IN;
if          return IF;
ifelse      return IFELSE;
while       return WHILE;
do          return DO;
\>          return GREATER;
\<          return LESS;
\{          return OPENBR;
\}          return CLOSEBR;
,           return COMMA;
:           return COLON;
;           return SEMICOLON;
at          return AT;
\+          return PLUS;
\*          return TIMES;
\(          return OPEN;
\)          return CLOSE;
\-          return MINUS;
\/          return DIV;
√           return SQRT;
=           return ASSIGN;
var         return VAR;
proc        return PROC;
[a-z]+      {yylval.n = lookup(yytext);
            if (yylval.n == NULL) yylval.n = insert(yytext);
            return SYMBOL;
            } 
[0-9]+      yylval.i=atoi(yytext); return NUMBER;
\/\/.*              ;
[[:space:]]         ;
.           fprintf(stderr, "Error - unknown character %s\n", yytext);
%%
