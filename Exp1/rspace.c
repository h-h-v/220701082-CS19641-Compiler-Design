#include<stdio.h>
#include<string.h>

int main(){
	char s[100];
	printf("Enter String: ");
	fgets(s,100,stdin);
	for(int i=0;i<strlen(s);i++){
		if(s[i]!=' '){
			printf("%c",s[i]);
		}
	}
	return 0;
	}
