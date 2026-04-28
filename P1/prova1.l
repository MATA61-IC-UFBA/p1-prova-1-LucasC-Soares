%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

STRING  \"[^\"]*\"
COMMENT "//"[^\n]*
IDENT   [a-zA-Z][a-zA-Z0-9_]*
NUM [0-9]+(\.[0-9]+)?
%%

{COMMENT}              { return COMMENT; }
{STRING}            { return STRING; }
{NUM}               { return NUM; }
"print"             { return PRINT; }
"length"             { return LENGTH; }
"concat"             { return CONCAT; }
{IDENT}             { return IDENT; }
"="                 { return ASSIGN; }
","                 { return COMMA; }
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
