#include<stdio.h>
#include<string.h>
int main(){
	char s[100];
	char r1[3];
	scanf("%s",s);
	scanf("%s",r1);
	for(int i=0;i<strlen(s);i++){
		if(s[i]==r1[0]){
			printf("%c",r1[2]);
		}
		else{
			printf("%c",s[i]);
		}
	}
	return 0;
}
