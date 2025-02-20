#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "tokeniser.c"
struct lexeme{
    char* value;
    int type;
    struct lexeme* next;
};
typedef struct lexeme lexeme;

void lexemiser(char* line){
    lexeme  *table = malloc(sizeof(lexeme));
    while(*line !='\n'){
        char lexeme[50];
        int i = 0;
        while(*line != ' ' && *line != '\n'){
            lexeme[i] = *line;
            i++;
            line++;
        }
        line++;
        table->value = lexeme;
        table->type = findtype(line);
        table->next = malloc(sizeof(lexeme));
        table = table->next;
    }
    return ;
}
