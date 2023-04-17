#include<stdio.h>
#include<stdlib.h>
int opcount=0;


void insert(int arr[],int ele,int m){
    if(arr[ele%m]==-1){
        arr[ele%m]=ele;
        printf("Insertion successful");
    }
    else{
        int temp=ele%m;
        int i=1;
        while(arr[(ele+i)%m]!=-1 || (ele+i)%m!=temp){
            if(arr[(ele+i)%m]==-1){
                arr[(ele+i)%m]=ele;
                printf("Insertion successful");
                return;
            }
            else{
                i++;
            }
        }
        printf("Hash table full");

    }
}

void find(int ele,int arr[],int m){
    opcount++;
    if(arr[ele%m]==ele){
        printf("Key found after %d comparisons",opcount);
    }
    if(arr[ele%m]==-1)
        printf("Key not found,%d comparisons",opcount);
    else{
        int temp=ele%m;
        int i=1;
        while(arr[(ele+i)%m]!=-1 && (ele+i)%m!=temp){
            opcount++;
            if(arr[(ele+i)%m]==ele){
        printf("Key found after %d comparisons",opcount);
        exit(0);
    }
            if(arr[(ele+i)%m]==-1){
                printf("Key not found,%d comparisons",opcount);
                exit(0);
            }
            else{
                i++;
            }
        }
    }
    printf("Key not found,%d comparisons",opcount);
}

int main(){
    int n,m,i,j;
    printf("Enter the value of n and m");
    scanf("%d%d",&n,&m);
    int arr[m];
    for(i=0;i<m;i++)
        arr[i]=-1;
    printf("Enter inputs:");
    for(i=0;i<n;i++){
        scanf("%d",&j);
        insert(arr,j,m);
    }
    printf("hash table");
     for(i=0;i<m;i++){
        printf("\t%d",arr[i]);
     }
    printf("Enter key to find:");
    scanf("%d",&j);
    find(j,arr,m);
}