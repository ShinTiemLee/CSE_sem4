#include<stdio.h>
#include<stdlib.h>

int fib(int t1,int t2,int n,int *opcount){
    if(n==1){
        (*opcount)++;
        return t1;
    }
    else if (n==2){
        (*opcount)++;
        return t2;
    }
    else{
        (*opcount)++;
        fib(t2,t1+t2,n-1,opcount);
    }
}

void main(){
    printf("Enter the nth term in fibonacci series to be found:");
    int n;
    int opcount=0;
    scanf("%d",&n);
    printf("\n%d th term is:%d",n,fib(1,1,n,&opcount));
    printf("\nOpcount:%d",opcount);
}

