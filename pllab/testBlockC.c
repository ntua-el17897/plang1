#include <stdio.h>
#include <stdlib.h>


int main(){
	int i = 4;
	int n = 0;
	printf("%d\n", n);

	while(i>0){
		int n = i;
		n *= i;
		printf("%d\n", n);
		i--;
	}

	for(int i=10; i>n; i--){
		printf("%d", i*i);
	}
}