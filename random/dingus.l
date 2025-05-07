%{
#include <string.h>
#include <stdio.h>
int x = 0;
%}

%%
([a-zA-Z0-9])+    { x++; }
\n                { printf("%d\n", x); x = 0; }
[ \t]+            { /* ignore spaces and tabs */ }
%%

int yywrap(void) {
    return 1;
}

int main() {
    yylex();
    return 0;
}

