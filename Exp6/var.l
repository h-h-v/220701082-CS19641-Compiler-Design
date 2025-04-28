%{
#include "y.tab.h"
extern int yylval;
%}

%%
[0-9]+    { yylval = atoi(yytext); return NUMBER; }
[+]       { return PLUS; }
[\n]      { return 0; }
[ \t]     ;   // ignore spaces
.         { /* ignore any other character */ }
%%

