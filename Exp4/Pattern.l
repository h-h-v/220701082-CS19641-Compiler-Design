%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
int|for|main|else|if|while|do|main|struct {printf("KEYWORD ");}
[0-9]+ {printf("CONSTANTS ");}
[a-zA-z][A-Za-z0-9]* {printf("IDENTIFIER ");}
"//"[a-zA-Z0-9]* {printf("SINGLE LINE COMMENT ");}
"/*"[a-zA-Z0-9]*"*/" {printf("MULTILINE COMMENT ");}
[+|-|=|!=|*|%|/] {printf("OPERATOR ");}
[{};(),] {printf("SPECIAL SYMBOLS ");}
%%
int yywrap(void){}

int main(){
	yylex();
	return 0;
	}
