#include<stdio.h>
#include<string.h>
#include<ctype.h>

int findtype(char line[]){
    if(isdigit(line[0])){
        return 7;
    }
    else if(strcmp(line,"if")==0 || strcmp(line,"else")==0){
        return 1;
    }
    else{
        return 6;
    }
}