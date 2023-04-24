#include<stdio.h>
#include<stdlib.h>
#define infinity 999
int opcount=0;

int min(int a,int b){
    return a<b?a:b;
}

int** floyd(int** r1,int** r2,int n){
    int i,j,k;
     for(i=0;i<n;i++)
        for(j=0;j<n;j++)
             for(k=0;k<n;k++){
               r2[i][j] = min (r1[i][j], r1[i][k] + r1[k][j]);
               opcount++;
             }
    return r2;
}

void main(){
    int n,i,j,k;
    printf("Enter size of mat:");
    scanf("%d",&n);
    int** adjmat=(int**)calloc(n,sizeof(int*));
    for(i=0;i<n;i++)
        adjmat[i]=(int*)calloc(n,sizeof(int));
    printf("Enter cost mat:\n");
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
            scanf("%d",&adjmat[i][j]);
    int** temp1=(int**)calloc(n,sizeof(int*));
    for(i=0;i<n;i++)
        temp1[i]=(int*)calloc(n,sizeof(int));
    int** temp2=(int**)calloc(n,sizeof(int*));
    for(i=0;i<n;i++)
        temp2[i]=(int*)calloc(n,sizeof(int));
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
            temp2[i][j]=infinity;
    for(i=0;i<n;i++){
        temp1=temp2;
        temp2=floyd(adjmat,temp2,n);
        adjmat=temp1;
    }
    printf("Resultant mat:\n");
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            printf(" %d",temp2[i][j]);
        }
        printf("\n");
    }

    printf("opcount: %d",opcount);
}