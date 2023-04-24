#include<stdio.h>
#include<stdlib.h>
int opcount=0;

int max(int a,int b){
    return a<b?b:a;
}

int MFK(int i,int j,int** V,int *w,int *val){
    int value;
    if(V[i][j]<0 && i>=0 && j>=0){
        opcount++;
        if(j<w[i]){
            value=MFK(i-1,j,V,w,val);
        }
        else{
            value=max(MFK(i-1,j,V,w,val),val[i]+MFK(i-1,j-w[i],V,w,val));
        }
        V[i][j]=value;
    }
    
    
    return V[i][j];
}

void main(){
    int n,i,j,k,W;
    printf("Enter no of weights:");
    scanf("%d",&n);
    int* w=(int*)calloc(n+1,sizeof(int));
    for(i=1;i<=n;i++)
        scanf("%d",&w[i]);
    printf("Enter values of weights: ");
    int* val=(int*)calloc(n+1,sizeof(int));
    for(i=1;i<=n;i++)
        scanf("%d",&val[i]);
    printf("Enter capacity of knapsack:\n");
            scanf("%d",&W);
    int** V=(int**)calloc(n+1,sizeof(int*));
    for(i=0;i<=n;i++)
        V[i]=(int*)calloc(W+1,sizeof(int));
    
    for(i=0;i<=n;i++)
        for(j=0;j<=W;j++){
            if(i==0 ||j==0)
                V[i][j]=0;
            else
                V[i][j]=-1;
        }
    int optimalsol=MFK(n,W,V,w,val);   
    printf("max solution: %d",optimalsol);
    printf("Resultant mat:\n");
    for(i=0;i<=n;i++){
        for(j=0;j<=W;j++){
            printf(" %d",V[i][j]);
        }
        printf("\n");
    }

    printf("opcount: %d",opcount);
}