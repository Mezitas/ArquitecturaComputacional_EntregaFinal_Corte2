#include <stdio.h>
#include <stdlib.h>

#define FILAS 320
#define COLUMNAS 313
#define TAMANIO (FILAS * COLUMNAS)

int main() {
	
	int (*matriz)[COLUMNAS] = malloc(FILAS * sizeof(*matriz));
	if (!matriz) return 1;
	
	for (int i = 0; i < FILAS; i++) {
		for (int j = 0; j < COLUMNAS; j++) {
			matriz[i][j] = i * COLUMNAS + j;
		}
	}

	for (int i = 0; i < FILAS; i++) {
		int izquierda = 0;
		int derecha = COLUMNAS - 1;
		
		while (izquierda < derecha) {
			int temp = matriz[i][izquierda];
			matriz[i][izquierda] = matriz[i][derecha];
			matriz[i][derecha] = temp;
			izquierda++;
			derecha--;
		}
	}
	free(matriz);
	return 0;
}
