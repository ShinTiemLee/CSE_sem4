#include<stdio.h>
#include<stdlib.h>

void TOH(char aux,char des,char src,int n,int *opcount){
    if(n==1)
        printf("\nMove disk %d from %c to %c",n,src,des);
    else{
        TOH(des,aux,src,n-1,opcount);
        printf("\nMove disk %d from %c to %c",n,src,des);
        (*opcount)++;
        TOH(src,des,aux,n-1,opcount);
        (*opcount)++;
    }
}

void main(){
    printf("Enter the number of disks:");
    int n;
    int opcount=0;
    scanf("%d",&n);
    TOH('A','D','S',n,&opcount);
    printf("\nOpcount:%d",opcount);
}

