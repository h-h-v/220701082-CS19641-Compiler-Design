#include<stdio.h>
#include<string.h>
int main(){
	char s[100];
	int ascii[256];
	printf("Enter the string: ");
	fgets(s,100,stdin);
	for(int i=0;i<strlen(s);i++){
		int x = s[i];
		ascii[x-1]++;	
	}
	for(int i=0;i<256;i++){
	if(ascii[i]>0){
		printf("%c -> %d\n",i+1,ascii[i]);
		}
	}
	return 0;
}
