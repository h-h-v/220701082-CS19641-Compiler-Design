%{
#include "y.tab.h"
#include <stdlib.h>
extern int yylval;
void yyerror(const char *);
%}

%option noyywrap

%%
[0-9]+     { yylval = atoi(yytext); return NUMBER; }
"+"        { return '+'; }
"*"        { return '*'; }
"\n"       { return '\n'; }
[ \t]+     { /* ignore whitespace */ }
.          { yyerror("Invalid character"); }
