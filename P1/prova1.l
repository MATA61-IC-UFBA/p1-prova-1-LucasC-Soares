%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%

/* copiar E2 e fazer as extensões */

[0-9]+\.[0-9]+     { return NUM; }
[0-9]+              { return NUM; }
\(                  { return LPAREN; }
\)                  { return RPAREN; }
\+                  { return PLUS; }
\-                  { return MINUS; }
\*                  { return TIMES; }
\/                  { return DIV; }
\n                  { return EOL; }
[ \t]               { }
.            { return ERROR; }

%%
