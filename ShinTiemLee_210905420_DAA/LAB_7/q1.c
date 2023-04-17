#include<stdio.h>
#include<stdlib.h>

typedef struct node
{
int info;
struct node *left,*right;
}NODE;

NODE* create(NODE *bnode,int x)
{
NODE *getnode;
if(bnode==NULL)
{
bnode=(NODE*) malloc(sizeof(NODE));
bnode->info=x;
bnode->left=bnode->right=NULL;
}
else if(x>bnode->info)
bnode->right=create(bnode->right,x);
else if(x<bnode->info)
bnode->left=create(bnode->left,x);
else
{
printf("Duplicate node\n");
exit(0);
}
return(bnode);
}

void inorder(NODE *ptr)
{
if(ptr!=NULL)
{
inorder(ptr->left);
printf("%5d",ptr->info);
inorder(ptr->right);
}
}

void postorder(NODE *ptr)
{
if(ptr!=NULL)
{
postorder(ptr->left);
postorder(ptr->right);
printf("%5d",ptr->info);
}
}

void preorder(NODE *ptr)
{
if(ptr!=NULL)
{
printf("%5d",ptr->info);
preorder(ptr->left);
preorder(ptr->right);
}
}

int max(int a,int b){
	return a<b?b:a;
}


int bal(NODE* bnode){
	//printf("%d",(bnode->info));
	if(bnode!=NULL){
		printf("%d",(bnode->info));
		return 1+max(bal(bnode->left),bal(bnode->right));
	}
	return 0;
}

NODE* find(int x,NODE* bnode){
	int l,r;
	printf("%d",(bnode->info));
	if(x==bnode->info){
		printf("%d",bnode->info);
		l=bal(bnode->left);
	r=bal(bnode->right);
	printf("%d %d",l,r);
	printf("balace factor is %d",l-r);
		return bnode;
	}
else if(x<bnode->info){
	if(bnode->left==NULL)
		return NULL;
	return find(x,bnode->left);
}

else{
	if(bnode->right==NULL)
		return NULL;
	return find(x,bnode->right);
}

}

void main()
{
int n,x,ch,i,xx,l,r;
NODE *root;
NODE *temp;
root=NULL;
while(1)
{
printf("********************Output********************\n\n");
printf("-----------Menu-----------\n");
printf(" 1. Insert\n 2. All traversals\n 3.	find balance factor\n 4. Exit\n");
printf("Enter your choice:");
scanf("%d",&ch);
switch(ch)
{
case 1: printf("Enter node (do not enter duplicate nodes):\n");
scanf("%d",&x);
root=create(root,x);
break;
case 2: printf("\nInorder traversal:\n");
inorder(root);
printf("\nPreorder traversal:\n");
preorder(root);
printf("\nPostorder traversal:\n");
postorder(root);
printf("\n\n*********************************************");
break;
case 3: printf("Enter the node value :");
	scanf("%d",&xx);
	temp=find(x,root);
	printf("%d",temp->info);
	l=bal(temp->left);
	r=bal(temp->right);
	printf("%d %d",l,r);
	printf("balace factor is %d",l-r);
	break;
case 4: exit(0);
}
}
}