#include <stdio.h>

#define FILAS 5
#define COLAS 5

void llenarImagen(int imagen[FILAS][COLAS]);
void imagenEspejo(int imagen[FILAS][COLAS]);
void imprimir(int imagen[FILAS][COLAS]);
int main(int argc, char *argv[]) {
	int imagen[FILAS][COLAS];
	
	llenarImagen(imagen);
	printf("Original:\n");
	imprimir(imagen);
	
	imagenEspejo(imagen);
	printf("\nEspejo:\n");
	imprimir(imagen);
	
	return 0;
}
void llenarImagen(int imagen[FILAS][COLAS]){
	int img[FILAS][COLAS] = {
		{0,1,0,0,0},
		{0,1,1,0,0},
		{1,1,1,1,0},
		{0,1,1,0,0},
		{0,1,0,0,0}
	};
	for(int i=0;i<FILAS;i++){
		for(int j=0;j<COLAS;j++){
			imagen[i][j]= img[i][j];
		}
	}
}
void imprimir(int imagen[FILAS][COLAS]){
	for(int i=0;i<FILAS;i++){
		for(int j=0;j<COLAS;j++){
			printf(" %d ", imagen[i][j]);
		}
		printf("\n");
	}
}
void imagenEspejo(int imagen[FILAS][COLAS]){
	for(int i = 0; i < FILAS; i++) {
		int izq = 0;
		int der = COLAS - 1;
		
		while(izq < der) {
			int temp = imagen[i][izq];
			imagen[i][izq] = imagen[i][der];
			imagen[i][der] = temp;
			
			izq++;
			der--;
		}
	}
}

