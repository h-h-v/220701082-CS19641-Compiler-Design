%{
#include <stdio.h>
#include <stdlib.h>
extern char *yytext;
%}

%token IDENTIFIER

%%
stmt:
    IDENTIFIER { printf("Valid variable: %s\n", yytext); }
  ;

%%
void yyerror(const char *msg) {
    printf("Invalid variable\n");
}

int main() {
    printf("Enter a variable name: ");
    yyparse();
    return 0;
}
