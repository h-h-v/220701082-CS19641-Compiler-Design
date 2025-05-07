%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
int|for|main|else|if|while|do|struct         { printf("KEYWORD "); }
[0-9]+                                       { printf("CONSTANT "); }
[a-zA-Z_][a-zA-Z0-9_]*                       { printf("IDENTIFIER "); }
"//".*                                       { printf("SINGLE LINE COMMENT "); }
"/*"([^*]|\*+[^*/])*\*+"/"                   { printf("MULTILINE COMMENT "); }
(\+|\-|\=|\!\=|\*|\/|\%|==|<=|>=|<|>)         { printf("OPERATOR "); }
[{};(),]                                     { printf("SPECIAL SYMBOL "); }
[ \t\n]+                                     { /* Ignore whitespace */ }
.                                            { printf("UNKNOWN "); }
%%

int yywrap(void) {
    return 1;
}

int main() {
    yylex();
    return 0;
}

