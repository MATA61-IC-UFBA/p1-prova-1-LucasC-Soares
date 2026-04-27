%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token ERROR

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr
;

expr
: term
| expr PLUS term
| expr MINUS term
;

term
: factor
| term TIMES factor
| term DIV factor
;

factor
: NUM
| LPAREN expr RPAREN
;
/* completar */

%%

