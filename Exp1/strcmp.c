#include<stdio.h>
#include<string.h>
int main(){
	char s1[100];
	char s2[100];
	printf("Enter the string1: ");
	scanf("%s",s1);
	printf("Enter the string2: ");
	scanf("%s",s2);
	int x;
	x = strcmp(s1,s2);
	if(x==0){
		printf("Yes\n");
	}
	else{
		printf("No");
	}
	return 0;
}
