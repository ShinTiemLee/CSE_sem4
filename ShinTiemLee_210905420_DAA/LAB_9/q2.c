#include<stdio.h>
#include<stdlib.h>
int opcount=0;
typedef struct linklist* link;
struct linklist{
    int key;
    link next;
};

void insert(link arr[],int ele,int m){
    link newlink=(link)malloc(sizeof(struct linklist));
    newlink->key=ele;
    newlink->next=NULL;
    link temp=arr[ele%m];
    while(temp->next!=NULL)
        temp=temp->next;
    temp->next=newlink;
}

void disp(link a){
    if(a!=NULL){
        printf(" %d",a->key);
        disp(a->next);
    }
}

void find(int ele,link arr[],int m){
    link temp=arr[ele%m];
    while(temp!=NULL){
        if(temp->key==ele){
            printf("Key found after %d comparisons",opcount);
            exit(0);
        }
        opcount++;
        temp=temp->next;
    }
    printf("Key not found,%d comparisons",opcount);
}

int main(){
    int n,m,i,j;
    printf("Enter the value of n and m");
    scanf("%d%d",&n,&m);
    link arr[m];
    for(i=0;i<m;i++){
       arr[i]=(link)malloc(sizeof(struct linklist));
       (arr[i])->key=-1;
       (arr[i])->next=NULL;
    }
    printf("Enter inputs:");
    for(i=0;i<n;i++){
        scanf("%d",&j);
        insert(arr,j,m);
    }
    printf("hash table");
     for(i=0;i<m;i++){
        disp(arr[i]);
        printf("\n");
     }
    printf("Enter key to find:");
    scanf("%d",&j);
    find(j,arr,m);
}