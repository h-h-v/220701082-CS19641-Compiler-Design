%{
#include "y.tab.h"  // Include tokens from Yacc
%}
%option noyywrap

%%
[a-zA-Z][a-zA-Z0-9]*   { return IDENTIFIER; }
[ \t\n]+               { /* Ignore whitespace */ }
.                      { return yytext[0]; }
