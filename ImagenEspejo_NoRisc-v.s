.LC1:
        .string "Original:"
.LC2:
        .string "\nEspejo:"
main:
        addi    sp,sp,-144
        sw      ra,140(sp)
        sw      s0,136(sp)
        addi    s0,sp,144
        sw      a0,-132(s0)
        sw      a1,-136(s0)
        addi    a5,s0,-116
        mv      a0,a5
        call    llenarImagen
        lla     a0,.LC1
        call    puts@plt
        addi    a5,s0,-116
        mv      a0,a5
        call    imprimir
        addi    a5,s0,-116
        mv      a0,a5
        call    imagenEspejo
        lla     a0,.LC2
        call    puts@plt
        addi    a5,s0,-116
        mv      a0,a5
        call    imprimir
        li      a5,0
        mv      a0,a5
        lw      ra,140(sp)
        lw      s0,136(sp)
        addi    sp,sp,144
        jr      ra
.LC0:
        .word   0
        .word   1
        .word   0
        .word   0
        .word   0
        .word   0
        .word   1
        .word   1
        .word   0
        .word   0
        .word   1
        .word   1
        .word   1
        .word   1
        .word   0
        .word   0
        .word   1
        .word   1
        .word   0
        .word   0
        .word   0
        .word   1
        .word   0
        .word   0
        .word   0
llenarImagen:
        addi    sp,sp,-144
        sw      ra,140(sp)
        sw      s0,136(sp)
        addi    s0,sp,144
        sw      a0,-132(s0)
        lla     a4,.LC0
        addi    a5,s0,-124
        mv      a3,a4
        li      a4,100
        mv      a2,a4
        mv      a1,a3
        mv      a0,a5
        call    memcpy@plt
        sw      zero,-20(s0)
        j       .L4
.L7:
        sw      zero,-24(s0)
        j       .L5
.L6:
        lw      a4,-20(s0)
        mv      a5,a4
        slli    a5,a5,2
        add     a5,a5,a4
        slli    a5,a5,2
        mv      a4,a5
        lw      a5,-132(s0)
        add     a3,a5,a4
        lw      a4,-20(s0)
        mv      a5,a4
        slli    a5,a5,2
        add     a5,a5,a4
        lw      a4,-24(s0)
        add     a4,a5,a4
        addi    a5,s0,-124
        slli    a4,a4,2
        add     a5,a4,a5
        lw      a4,0(a5)
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a3,a5
        sw      a4,0(a5)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
.L5:
        lw      a4,-24(s0)
        li      a5,4
        ble     a4,a5,.L6
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L4:
        lw      a4,-20(s0)
        li      a5,4
        ble     a4,a5,.L7
        nop
        nop
        lw      ra,140(sp)
        lw      s0,136(sp)
        addi    sp,sp,144
        jr      ra
.LC3:
        .string " %d "
imprimir:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      zero,-20(s0)
        j       .L9
.L12:
        sw      zero,-24(s0)
        j       .L10
.L11:
        lw      a4,-20(s0)
        mv      a5,a4
        slli    a5,a5,2
        add     a5,a5,a4
        slli    a5,a5,2
        mv      a4,a5
        lw      a5,-36(s0)
        add     a4,a5,a4
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        mv      a1,a5
        lla     a0,.LC3
        call    printf@plt
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
.L10:
        lw      a4,-24(s0)
        li      a5,4
        ble     a4,a5,.L11
        li      a0,10
        call    putchar@plt
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L9:
        lw      a4,-20(s0)
        li      a5,4
        ble     a4,a5,.L12
        nop
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
imagenEspejo:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      zero,-20(s0)
        j       .L14
.L17:
        sw      zero,-24(s0)
        li      a5,4
        sw      a5,-28(s0)
        j       .L15
.L16:
        lw      a4,-20(s0)
        mv      a5,a4
        slli    a5,a5,2
        add     a5,a5,a4
        slli    a5,a5,2
        mv      a4,a5
        lw      a5,-36(s0)
        add     a4,a5,a4
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        sw      a5,-32(s0)
        lw      a4,-20(s0)
        mv      a5,a4
        slli    a5,a5,2
        add     a5,a5,a4
        slli    a5,a5,2
        mv      a4,a5
        lw      a5,-36(s0)
        add     a2,a5,a4
        lw      a4,-20(s0)
        mv      a5,a4
        slli    a5,a5,2
        add     a5,a5,a4
        slli    a5,a5,2
        mv      a4,a5
        lw      a5,-36(s0)
        add     a3,a5,a4
        lw      a5,-28(s0)
        slli    a5,a5,2
        add     a5,a2,a5
        lw      a4,0(a5)
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a3,a5
        sw      a4,0(a5)
        lw      a4,-20(s0)
        mv      a5,a4
        slli    a5,a5,2
        add     a5,a5,a4
        slli    a5,a5,2
        mv      a4,a5
        lw      a5,-36(s0)
        add     a4,a5,a4
        lw      a5,-28(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a4,-32(s0)
        sw      a4,0(a5)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,-1
        sw      a5,-28(s0)
.L15:
        lw      a4,-24(s0)
        lw      a5,-28(s0)
        blt     a4,a5,.L16
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L14:
        lw      a4,-20(s0)
        li      a5,4
        ble     a4,a5,.L17
        nop
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra