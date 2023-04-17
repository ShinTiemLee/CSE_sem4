#include<stdio.h>
#include<stdlib.h>
int opcount=0;

void swap(int arr[],int i,int j){
	int temp=arr[i];
	arr[i]=arr[j];
	arr[j]=temp;
}

void quicksort(int arr[],int high,int low){
	opcount++;
	int pivot=low;
	int j=high;
	int i=low+1;
	while(low<high){
	j=high;
	i=low+1;
	while(arr[i]<=arr[pivot] && i<high)
		i++;
	while(arr[j]>=arr[pivot] && j>0)
		j--;
	if(j<i && j<=high && i>=0){
		swap(arr,j,pivot);
		quicksort(arr,j-1,low);
		quicksort(arr,high,j+1);
        break;
	}
	else{
		swap(arr,i,j);
	}}
}

void main(){
	int arr[10]={7,6,4,3,2,8,5,41,98,11};
	quicksort(arr,9,0);
	printf("opcount:%d\nSorted array:\n",opcount);
	for(int a=0;a<10;a++)
		printf("%d\t",arr[a]);

}