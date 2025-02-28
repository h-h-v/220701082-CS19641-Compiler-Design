%{
#include<string.h>
#include<stdio.h>
int x=0;
%}
%%
([a-zA-Z0-9])* {x++;}
"\n" {printf("%d\n",x);x=0;}
%%
int yywrap(void){}

int main()
{
	yylex();
	return 0;
}

