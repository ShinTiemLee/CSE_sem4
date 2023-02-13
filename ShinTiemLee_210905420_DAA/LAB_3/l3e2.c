#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void main(){
	int i,j,k,upcount=0,flag;
	char* str=(char*)calloc(50,sizeof(char));
	char* substr=(char*)calloc(20,sizeof(char));
	printf("Enter the string:");
	gets(str);
	printf("Enter the substring:");
	gets(substr);
	for(i=0;i<=strlen(str)-strlen(substr);i++){
		j=i;
		flag=0;
		for(k=0;k<strlen(substr);k++,j++){
			upcount++;
			if(str[j]!=substr[k]){
				flag=1;
				break;
			}
		}
		if(flag==0){
			printf("Substring matched at %d position",i+1);
			break;
		}
	}
	if(flag==1)
		printf("Substring not matched");
	printf("upcount:%d",upcount);
}