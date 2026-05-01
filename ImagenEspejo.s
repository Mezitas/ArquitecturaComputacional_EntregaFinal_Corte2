.data
imagen:
    .word 0,1,0,0,0
    .word 0,1,1,0,0
    .word 1,1,1,1,0
    .word 0,1,1,0,0
    .word 0,1,0,0,0

.text
.globl main

main:
    la t0, imagen      # t0 = base de la matriz
    li t1, 0           # i = 0

for_filas:
    li t2, 5
    bge t1, t2, fin    # if i >= 5 -> salir

    li t3, 0           # izq = 0
    li t4, 4           # der = 4

while_loop:
    bge t3, t4, siguiente_fila   # while (izq < der)

    # -------- calcular direccion izq --------
    li t5, 5
    mul t6, t1, t5     # i * 5
    add t6, t6, t3     # i*5 + izq
    slli t6, t6, 2     # *4 (bytes)
    add t6, t0, t6     # direccion izq

    # -------- calcular direccion der --------
    mul t7, t1, t5     # i * 5
    add t7, t7, t4     # i*5 + der
    slli t7, t7, 2
    add t7, t0, t7     # direccion der

    # -------- swap --------
    lw t8, 0(t6)       # temp = img[i][izq]
    lw t9, 0(t7)       # valor der

    sw t9, 0(t6)       # img[i][izq] = der
    sw t8, 0(t7)       # img[i][der] = temp

    # -------- mover punteros --------
    addi t3, t3, 1     # izq++
    addi t4, t4, -1    # der--

    j while_loop

siguiente_fila:
    addi t1, t1, 1     # i++
    j for_filas

fin:
    li a7, 10          # exit
    ecall