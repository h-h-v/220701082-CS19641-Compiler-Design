%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
%}

%token NUMBER
%token PLUS

%%
expr:
    expr PLUS term   { $$ = $1 + $3; }
  | term             { $$ = $1; }
  ;

term:
    NUMBER           { $$ = $1; }
  ;

%%

int main() {
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}

int yywrap() {
    return 1;
}

