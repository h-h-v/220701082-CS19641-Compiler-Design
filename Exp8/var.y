%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);
int temp_counter = 1;  // Temporary variable counter for generating unique temp variables

#define YYSTYPE char*  // YYSTYPE for storing temporary variable names
%}

%token NUMBER IDENTIFIER
%token PLUS MINUS MUL DIV
%token LPAREN RPAREN

%left PLUS MINUS
%left MUL DIV

%start program

%%

program:
    statement
    | program statement
    ;

statement:
    expr ';' {
        printf("\t\t%s = %s\n", $3, $1);  // Print TAC: t1 = expr
    }
    ;

expr:
    expr PLUS term {
        char temp[10];
        sprintf(temp, "t%d", temp_counter++);
        printf("\t\t%s = %s + %s\n", temp, $1, $3);
        $$ = strdup(temp);  // Store the temporary variable name
    }
    | expr MINUS term {
        char temp[10];
        sprintf(temp, "t%d", temp_counter++);
        printf("\t\t%s = %s - %s\n", temp, $1, $3);
        $$ = strdup(temp);  // Store the temporary variable name
    }
    | term {
        $$ = $1;  // If just a term, use its value directly
    }
    ;

term:
    term MUL factor {
        char temp[10];
        sprintf(temp, "t%d", temp_counter++);
        printf("\t\t%s = %s * %s\n", temp, $1, $3);
        $$ = strdup(temp);  // Store the temporary variable name
    }
    | term DIV factor {
        char temp[10];
        sprintf(temp, "t%d", temp_counter++);
        printf("\t\t%s = %s / %s\n", temp, $1, $3);
        $$ = strdup(temp);  // Store the temporary variable name
    }
    | factor {
        $$ = $1;  // If just a factor, use its value directly
    }
    ;

factor:
    NUMBER {
        char temp[10];
        sprintf(temp, "%d", $1);  // Number is directly its value
        $$ = strdup(temp);  // Store the temporary variable name
    }
    | IDENTIFIER {
        $$ = $1;  // Identifier is its own value
    }
    | LPAREN expr RPAREN {
        $$ = $2;  // Parenthesized expression takes the value of expr
    }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter arithmetic expressions:\n");
    yyparse();
    return 0;
}
