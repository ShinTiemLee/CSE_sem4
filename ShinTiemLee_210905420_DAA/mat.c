#include<stdio.h>
#include<stdlib.h>

void main(){
    printf("Enter the dimensions of mat1 and mat2:");
    int p1,q1,p2,q2;
    int opcount=0;
    scanf("%d%d%d%d",&p1,&q1,&p2,&q2);
    if(p2!=q1)
        printf("Cannot multiply");
    else{
    int **mat1=(int**)malloc(p1*sizeof(int*));
    int **mat2=(int**)malloc(p2*sizeof(int*)); 
    int **res=(int**)calloc(p1,sizeof(int*));
    for(int i=0;i<p1;i++){
         mat1[i]=(int*)malloc(q1*sizeof(int));
    }
    for(int i=0;i<p2;i++){
         mat2[i]=(int*)malloc(q2*sizeof(int));
    }
    for(int i=0;i<p1;i++){
         res[i]=(int*)malloc(q2*sizeof(int));
    }
    for(int i=0;i<p1;i++){
        for(int j=0;j<q1;j++){
            printf("\nEnter mat1[%d][%d]=",i,j);
            scanf("%d",&mat1[i][j]);
        }
    }
    for(int i=0;i<p2;i++){
        for(int j=0;j<q2;j++){
            printf("\nEnter mat2[%d][%d]=",i,j);
            scanf("%d",&mat2[i][j]);
        }
    }
    for(int i=0;i<p1;i++){
        for(int j=0;j<q2;j++){
            for(int k=0;k<p1;k++){
                opcount++;
                res[i][j]+=mat1[k][j]*mat2[k][i];
            }
        }
    }
    printf("The result is:\n");
    for(int i=0;i<p2;i++){
        for(int j=0;j<q2;j++){
            printf("\t%d",res[i][j]);
        }
        printf("\n");
    }

    
    printf("\nOpcount:%d",opcount);
    }
    }


