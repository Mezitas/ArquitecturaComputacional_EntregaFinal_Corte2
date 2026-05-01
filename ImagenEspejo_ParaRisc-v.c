#include <stdio.h>

#define FILAS 5
#define COLS 5

int main() {
	int imagen[5][5] = {
		{0,1,0,0,0},
	{0,1,1,0,0},
		{1,1,1,1,0},
	{0,1,1,0,0},
		{0,1,0,0,0}
	};
	
	// Algoritmo espejo (dos punteros)
	for (int i = 0; i < FILAS; i++) {
		
		int izq = 0;
		int der = COLS - 1;
		
		while (izq < der) {
			
			int temp = imagen[i][izq];
			imagen[i][izq] = imagen[i][der];
			imagen[i][der] = temp;
			
			izq++;
			der--;
		}
	}
	
	return 0;
}
