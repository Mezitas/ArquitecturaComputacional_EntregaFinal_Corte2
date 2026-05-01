#include <stdio.h>
#include <stdlib.h>

#define FILAS 320
#define COLUMNAS 313
#define GRUPO 4  

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
			
			int contador = (derecha - izquierda + 1) < GRUPO ? (derecha - izquierda + 1) : GRUPO;
			
			for (int k = 0; k < contador; k++) {
				int temp = matriz[i][izquierda + k];
				matriz[i][izquierda + k] = matriz[i][derecha - k];
				matriz[i][derecha - k] = temp;
			}
			
			izquierda += contador;
			derecha -= contador;
		}
	}
	free(matriz);
	return 0;
}
