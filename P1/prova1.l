%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

STRING  ["][^\"]*
COMMENT "//"[^\n]*
IDENT   [a-zA-Z][a-zA-Z0-9_]*
%%

/* copiar E2 e fazer as extensões */

{COMMENT}              { return COMMENT; }
{STRING}            { return STRING; }
[0-9]+\.[0-9]+     { return NUM; }
[0-9]+              { return NUM; }
{IDENT}             { return IDENT; }
"="                 { return ASSIGN; }
","                 { return COMMA; }
"print"             { return PRINT; }
"length"             { return LENGTH; }
"concat"             { return CONCAT; }
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
