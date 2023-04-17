#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void table(char *subs,int m,int arr[]){
	int i,j;

	for(i=0;i<127;i++)
		arr[i]=m;
	for(i=0;i<m-1;i++)
		arr[(int)subs[i]]=m-1-i;
    for(i=0;i<m;i++)
        printf(" %d",arr[(int)subs[i]]);    
}

int main(){
	char* str="i like icecream";
	char* subs="cream";
	int n=strlen(str);
	int m=strlen(subs);
	int arr[127];
    table(subs,m,arr);
	int flag=0,opcount=0,i=m-1,j=0;
	while(i<=n && flag==0){
		for(j=m-1;j>=0;j--){
			opcount++;
			if(subs[j]!=str[i]){
				i=i+m-1-j+arr[(int)subs[j]];
				flag=0;
				break;
			}
			else{
				i--;
				flag=1;
			}
		}
		if(flag==1){
			printf("key found after %d comparisons",opcount);
			break;
		}
	}
    if(flag==0)
	    printf("Key not found,%d comparisons",opcount);
	return 1;
}