.data
imagen:
    .word 0,1,0,0,0
    .word 0,1,1,0,0
    .word 1,1,1,1,0
    .word 0,1,1,0,0
    .word 0,1,0,0,0

espacio: .asciiz " "
salto:   .asciiz "\n"

.text
.globl main

main:
    la t0, imagen      # base de la matriz
    li t1, 0           # i = 0

# -------- ESPEJO --------
for_filas:
    li t2, 5
    bge t1, t2, imprimir

    li t3, 0           # izq
    li t4, 4           # der

while_loop:
    bge t3, t4, siguiente_fila

    li t5, 5
    mul t6, t1, t5
    add t6, t6, t3
    slli t6, t6, 2
    add t6, t0, t6

    mul a0, t1, t5
    add a0, a0, t4
    slli a0, a0, 2
    add a0, t0, a0

    lw a1, 0(t6)
    lw a2, 0(a0)

    sw a2, 0(t6)
    sw a1, 0(a0)

    addi t3, t3, 1
    addi t4, t4, -1

    j while_loop

siguiente_fila:
    addi t1, t1, 1
    j for_filas

# -------- IMPRESION --------
imprimir:
    li t1, 0           # i = 0

print_filas:
    li t2, 5
    bge t1, t2, fin

    li t3, 0           # j = 0

print_cols:
    li t4, 5
    bge t3, t4, salto_linea

    li t5, 5
    mul t6, t1, t5
    add t6, t6, t3
    slli t6, t6, 2
    add t6, t0, t6

    lw a0, 0(t6)       # cargar valor

    li a7, 1           # print int
    ecall

    la a0, espacio     # imprimir espacio
    li a7, 4
    ecall

    addi t3, t3, 1
    j print_cols

salto_linea:
    la a0, salto
    li a7, 4
    ecall

    addi t1, t1, 1
    j print_filas

fin:
    li a7, 10
    ecall