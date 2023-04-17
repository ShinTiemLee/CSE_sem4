#include<stdio.h>
#include<stdlib.h>
int opcount=0;

typedef struct NODE* node;
struct NODE{
	int val;
	struct NODE* lchild;
	struct NODE* rchild;
};

node create_node(int val){
	node Node=(node)malloc(sizeof(struct NODE));
	Node->val=val;
	Node->lchild=Node->rchild=NULL;
	return Node;
}


int count_node(node root){
	opcount+=1;
	if(root!=NULL)
		return 1+count_node(root->lchild)+count_node(root->rchild);
	return 0;
}

void main(){
	node root=create_node(0);
	node temp1=create_node(1);
	node temp2=create_node(2);
	node temp3=create_node(3);
	node temp4=create_node(4);
	node temp5=create_node(5);
	root->lchild=temp1;
	root->rchild=temp2;
	temp1->lchild=temp3;
	temp1->rchild=temp4;
	temp2->lchild=temp5;
	printf("Node count: %d\n",count_node(root));
	printf("opcount: %d",opcount);

}