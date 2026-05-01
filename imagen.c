#include <stdio.h>
#include <stdlib.h>

#define N 100000

int main() {
	int *imagen = malloc(N * sizeof(int));
	
	for (int i = 0; i < N; i++) {
		imagen[i] = i % 256;
	}
	
	int izq = 0;
	int der = N - 1;
	
	while (izq < der) {
		int temp = imagen[izq];
		imagen[izq] = imagen[der];
		imagen[der] = temp;
		
		izq++;
		der--;
	}
	
	free(imagen);
	return 0;
}
