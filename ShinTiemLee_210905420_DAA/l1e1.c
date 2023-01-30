#include<stdio.h>
#include<stdlib.h>

typedef struct Node* node;
 
typedef struct Node{
	int val;
	node lchild,rchild;
}Node;

node getnode(){
	node temp=(node)malloc(sizeof(struct Node));
	temp->lchild=temp->rchild=NULL;
	return temp;
}

void inorder(node root){
	if(root){
	inorder(root->lchild);
	printf("%d ",root->val);
	inorder(root->rchild);
	}
}

void preorder(node root){
	if(root){
	printf("%d ",root->val);
	preorder(root->lchild);
	preorder(root->rchild);
	}
}

void postorder(node root){
	if(root){
	postorder(root->lchild);
	postorder(root->rchild);
	printf("%d ",root->val);
	}
}

void insert(node* root,int num){
	node walk=*root;
	node prev;
	int flag=1;
	while(walk!=NULL){
		prev=walk;
		 flag=1;
			if(num < walk->val){
				walk=walk->lchild;
			}
			else if(num > walk->val){
				walk=walk->rchild;	
			}
			else{
				printf("The element is found.\n");
				flag=0;
				break;
			}

		}
		if(flag==1){
		printf("Element not found");
		walk=getnode();
		walk->val=num;
		if(num < prev->val){
				prev->lchild=walk;
			}
			else if(num > prev->val){
				prev->rchild=walk;	
			}

	}

}


int main(){
	int num;
	printf("Enter the root\n");
	scanf("%d",&num);
	node root=getnode();
	root->val=num;
	printf("Enter the values, -1 to exit");
	do{
		node temp=root;
		node walk;
		printf("Enter the data\n");
		scanf("%d",&num);
		if(num==-1)
			break;
		else{
			insert(&root,num);
		}
	}while(1);

	printf("The inorder traversal is:\n");
	inorder(root);
	printf("\nThe preorder traversal is:\n");
	preorder(root);
	printf("\nThe postorder traversal is:\n");
	postorder(root);

	return 1;
}