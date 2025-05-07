number [0-9]
numbers {number}+
Operator [-|+|*|/]+
Bracket [(|)]*
alpha [a-z]+
%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
{alpha}* {printf("invalid");}
{Bracket}{numbers}+({Operator}*{numbers}*)*{Bracket} {printf("Valid ");}
" " {}
%%
int yywrap(void){
return 1;
}
int main(){
	yylex();
	return 0;
	}
