#include <stdio.h>
#include<stdlib.h>

int main(){
	int row,col;
	char let='A';
	printf("Enter the number of vertices\n");
	scanf("%d",&row);
	col=row;
	int mat[row][col];
	for(int i=0;i<row;i++){
		for(int j=0;j<col;j++){
			printf("Enter the adjacency of %c with %c:\n",let+i,let+j);
			scanf("%d",&mat[i][j]);
		}
	}
	for(int i=0;i<row;i++){
		printf("\n%c",let+i);
		for(int j=0;j<col;j++){
			if(mat[i][j]==1)
				printf("->%c",let+j);
		}
	}
	for(int i=0;i<row;i++){
		printf("\n");
		for(int j=0;j<col;j++){
			printf("%d",mat[i][j]);
		}
	}
	return 0;
}