#include <stdio.h>
#include <stdlib.h>

const int cons = 29;

int main() {
	printf("main is at %p\n", &main);
	int numb = 13;
	printf("numb is at %p\n", &numb);
	void *aptr = malloc(sizeof(int));
	printf("cons is at %p\n", &cons);
	printf("aptr is at %p\n", aptr);
	free(aptr);
}

