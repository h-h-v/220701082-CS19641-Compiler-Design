#include<stdio.h>
#include<string.h>
int main(){
	char s1[100];
	char s2[100];
	printf("Enter the string1: ");
	scanf("%s",s1);
	printf("Enter the string2: ");
	scanf("%s",s2);
	int x=0;
	for(int i=0;i<strlen(s1);i++){
		if(s1[i]==s2[x]){
			x++;
			continue;
		}
		if(x==strlen(s2)){
			printf("Yes");
			return 0;
		}
		if(s1[i]!=s2[x]){
			x=0;
			continue;
		}
	}
	printf("No");
	return 0;
}
