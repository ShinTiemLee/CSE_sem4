#include <stdio.h>
#include <stdlib.h>

int main(){
	int a,b,flag,opcount=0;
	printf("Enter two numbers: ");
	scanf("%d%d",&a,&b);
	printf("m+n=%d",a+b);
	int prod=1,c;
	while(a!=1 || b!=1){
		c=2;
		do{
			flag=0;
			if(a%c==0 && b%c==0)
				prod=prod*c;
			if(a%c==0){
				flag=1;
				a=a/c;
			}
			if(b%c==0){
				flag=1;
				b=b/c;
			}
			c++;
			opcount++;
		}while(flag==0);
	}
	printf("The gcd is %d",prod);
	printf("\ncount=%d",opcount);

	return 0;
	
}