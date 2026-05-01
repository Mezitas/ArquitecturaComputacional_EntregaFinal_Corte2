#include <stdio.h>

#define FILAS 5
#define COLAS 5

int LlenarImagen(int imagen[FILAS][COLAS]);
void imagenEspejo(int imagen[FILAS][COLAS]);
void imprimir(int imagen[FILAS][COLAS]);
int main(int argc, char *argv[]) {
	imagenEspejo();
	return 0;
}
void LlenarImagen(int imagen[FILAS][COLAS]){
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
			(" %d ",imagen[i][j]);
		}
		printf("\n");
	}
}
void imagenEspejo(int imagen[FILAS][COLAS]){
	for(int i = 0; i < FILAS; i++) {
		int izq = 0;
		int der = COLAS - 1;
		
		while(izq < der) {
			int temp = img[i][izq];
			img[i][izq] = img[i][der];
			img[i][der] = temp;
			
			izq++;
			der--;
		}
	}
}

