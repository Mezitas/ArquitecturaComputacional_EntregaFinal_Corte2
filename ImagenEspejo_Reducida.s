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
    la   t0, imagen
    li   t1, 0
fila_loop:
    li   t2, 5
    bge  t1, t2, fin

    li   t3, 0
    li   t4, 4

    li   t5, 5
    mul  t6, t1, t5
    slli t6, t6, 2
    add  t6, t0, t6

while_loop:
    bge  t3, t4, next_fila

    slli t5, t3, 2
    add  a0, t6, t5

    slli t5, t4, 2
    add  a1, t6, t5

    # Intercambio
    lw   t5, 0(a0)
    lw   t2, 0(a1)
    sw   t2, 0(a0)
    sw   t5, 0(a1)

    addi t3, t3, 1
    addi t4, t4, -1
    j    while_loop

next_fila:
    addi t1, t1, 1
    j    fila_loop

fin:
    li   a7, 10
    ecall