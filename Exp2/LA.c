#include<stdio.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>
struct lexeme{
    char* value;
    int type;
    struct lexeme* next;
};
typedef struct lexeme lexeme;

int findtype(char line[]){
	if(line[0]=='{' || line[0] == '[' || line[0]== '(' || line[0]=='}' || line[0]==')' || line[0]==']' || line[0] == ','){
		return 2;
	}
    if(isdigit(line[0])){
		if(strlen(line) > 1){
			int i = 1;
			while(i<strlen(line)){
				if(isdigit(line[i])){
					i++;
					continue;
				}
				else{
					return 0;
				}
				}
			}
			else{
				return 7;
			}
    }
    else if(strcmp(line,"if")==0 || strcmp(line,"else")==0 || strcmp(line,"begin")==0 || strcmp(line,"for")==0){
        return 1;
    }
    else if(isalpha(line[0])){
		if(strlen(line) > 1){
			int i = 1;
			while(i<strlen(line)){
				if(isalnum(line[i])){
					i++;
					continue;
				}
				else{
					return 0;
				}
				}
			}
			else{
				return 6;
			}
		}
	else if((strlen(line) == 1) && (line[0]=='+' || line[0]=='-' || line[0]=='=' )){
        return 8;
	}
	return 0;
}

void lexemiser(char *line, lexeme **table) {
    lexeme *head = NULL, *tail = NULL;

    while (*line != '\n' && *line != ';') {
        char lex[50];
        int i = 0;
        
        while (*line != ' ' && *line != '\n' && *line != '\0' && *line != ';') {
            lex[i++] = *line++;
        }
        lex[i] = '\0'; // Null-terminate
        if (*line == ' ') line++; // Skip space

        lexeme *newNode = malloc(sizeof(lexeme));
        newNode->value = malloc(strlen(lex) + 1);
        strcpy(newNode->value, lex);
        newNode->type = findtype(lex);
        newNode->next = NULL;

        if (head == NULL) {
            head = newNode;
        } else {
            tail->next = newNode;
        }
        tail = newNode;
    }

    *table = head;
}


int main(){
	lexeme  *table = malloc(sizeof(lexeme));
	FILE* f =  fopen("code","r");
	char line[50];
	int lc = 0;
	printf(" __    ____  _    _\n|  |  |  __|| |  | |\n|  |  | |__  \\ \\/ /\n|  |  |  __|  |  |\n|  |_ | |__  / /\\ \\\n|____||____||_|  |_|\n");
	printf("\n\033[4mSymbol Table\033[0m\n");
	printf("1 -> Keyword\n2 -> Special Symbols\n6 -> Identifier\n7 -> Number\n8 -> Operator\nDelimitters are omitted\n");

	while(fgets(line, 50,f)!= NULL){
		lc++;
		lexemiser(line, &table);
		printf("\n\033[4mLine %d\033[0m\n",lc);
		while(table != NULL){
		printf("~> %s %d\n",table->value,table->type);
		table = table->next;
		}
	}
	fclose(f);
	return 0;
}