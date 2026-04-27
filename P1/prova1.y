%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token ERROR
%token IDENT ASSIGN PRINT LPAREN RPAREN LENGTH STRING CONCAT COMMA PLUS MINUS TIMES DIV NUM
%token COMMENT EOL

%start program

%%

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
| LENGTH LPAREN IDENT RPAREN
| LENGTH LPAREN STRING RPAREN
| CONCAT LPAREN IDENT COMMA exprlist RPAREN
| CONCAT LPAREN STRING COMMA exprlist RPAREN
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


exprlist
: IDENT
| exprlist COMMA IDENT
| exprlist COMMA STRING
;

%%

