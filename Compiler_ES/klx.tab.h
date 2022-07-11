/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     BOAT = 258,
     LINE = 259,
     SQUARE = 260,
     CIRCLE = 261,
     SEMICOLON = 262,
     COLON = 263,
     AT = 264,
     PLUS = 265,
     TIMES = 266,
     OPEN = 267,
     CLOSE = 268,
     MINUS = 269,
     DIV = 270,
     NUMBER = 271,
     SQRT = 272,
     VAR = 273,
     SYMBOL = 274,
     ASSIGN = 275,
     COMMA = 276,
     WHILE = 277,
     DO = 278,
     LESS = 279,
     OPENBR = 280,
     CLOSEBR = 281,
     LESSEQ = 282,
     GREATER = 283,
     GREATEREQ = 284,
     IF = 285,
     IFELSE = 286,
     PROC = 287,
     RED = 288,
     WHITE = 289,
     GREEN = 290,
     BLUE = 291,
     YELLOW = 292,
     SKYBLUE = 293,
     YELLOWSUN = 294,
     BROWN = 295,
     IN = 296,
     SIGNATURE = 297
   };
#endif
/* Tokens.  */
#define BOAT 258
#define LINE 259
#define SQUARE 260
#define CIRCLE 261
#define SEMICOLON 262
#define COLON 263
#define AT 264
#define PLUS 265
#define TIMES 266
#define OPEN 267
#define CLOSE 268
#define MINUS 269
#define DIV 270
#define NUMBER 271
#define SQRT 272
#define VAR 273
#define SYMBOL 274
#define ASSIGN 275
#define COMMA 276
#define WHILE 277
#define DO 278
#define LESS 279
#define OPENBR 280
#define CLOSEBR 281
#define LESSEQ 282
#define GREATER 283
#define GREATEREQ 284
#define IF 285
#define IFELSE 286
#define PROC 287
#define RED 288
#define WHITE 289
#define GREEN 290
#define BLUE 291
#define YELLOW 292
#define SKYBLUE 293
#define YELLOWSUN 294
#define BROWN 295
#define IN 296
#define SIGNATURE 297




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 37 "klx.y"
{int i; double d; node *n;}
/* Line 1529 of yacc.c.  */
#line 135 "klx.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

