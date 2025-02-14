#include<stdio.h>
#include<string.h>
int main(){
	char s1[100];
	char s2[100];
	printf("Enter String 1: ");
	scanf("%s",s1);	
	printf("Enter String 2: ");
	scanf("%s",s2);
	printf("%s",strcat(s1,s2));
	return 0;
}
