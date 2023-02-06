#include <stdio.h>
#include <stdlib.h>

int main(){
	int a,b,t,flag,opcount=0;
	printf("Enter two numbers: ");
	scanf("%d%d",&a,&b);
	printf("m+n=%d",a+b);
	t=a<b?a:b;
	while(t!=0){
		opcount++;
	flag=0;
		if(a%t==0)
			flag=1;
		if(flag==1 && b%t==0){
			printf("The gcd of %d and %d is %d",a,b,t);
			printf("\ncount=%d",opcount);
			return t;
		}
		t--;
	}
	printf("The gcd of %d and %d is %d",a,b,t);
	printf("\ncount=%d",opcount);

	return 0;
}