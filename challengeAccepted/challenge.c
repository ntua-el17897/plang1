#include <stdlib.h>
#include <stdio.h>
#define n 3

struct node{
	int *key;
	struct node *children[n];
} typedef node;

node* newNode(int key, node *children[]) {
	node *ptr = (node*) malloc(sizeof(node));
	ptr->key = (int*) malloc(sizeof(int));

	*(ptr->key) = key;
	for (int i = 0; i < n; i++){
		ptr->children[i] = children[i];
	}
	return ptr;
}

int main(){
	// node *test = (node*) malloc(sizeof(node));
	node *nullTest[n];
	for (int i = 0; i < n; ++i) {
		nullTest[i] = NULL;
	}
	node *test = newNode(4, nullTest);
	//int *t = (int*) malloc(sizeof(int));
	//*t =4;
	// test->key=(int*) malloc(sizeof(int));
	// *(test->key)=4;

	printf("*(test->key)=%d\n", *(test->key));
	printf("test->key=%p\n",test->key);
	for (int i = 0; i < n; ++i) {
		test->children[i]=(node*) malloc(sizeof(node));
		// printf("%d\n", i);
		test->children[i]->key = (int *)malloc(sizeof(int));
		*(test->children[i]->key)=n*i*i;
	}

	for (int i = 0; i < n; ++i) {
		printf("*(test->children[%d]->key = %d)\n", i, *(test->children[i]->key));
	}

	return 0;
}
