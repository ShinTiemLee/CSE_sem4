#include<stdio.h>
#include<stdlib.h>

void main(){
	int n,i,j,temp,upcount=0;
	printf("Enter the no. of elements:");
	scanf("%d",&n);
	int *arr=(int*)calloc(n,sizeof(int));
	printf("Enter the elements:");
	for(i=0;i<n;i++)
		scanf("%d",&arr[i]);
	for(i=0;i<n-1;i++){
		for(j=i;j<n-1;j++){
			upcount++;
			if(arr[j]>arr[j+1]){
				temp=arr[j];
				arr[j]=arr[j+1];
				arr[j+1]=temp;
			}
		}
	}
	printf("upcount:%d\nThe sorted array is:",upcount);
	for(i=0;i<n;i++)
		printf("%d",arr[i]);
}