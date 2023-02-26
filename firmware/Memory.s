.global memset: /* (base: a0, size: a1, value: a2) */
    sb a2, 0(a0)
    addi a0, a0, 1
    addi a1, a1, -1
    bltu zero, a1, memset /* a1 > zero */
    blr zero, ra

.global memset16: /* (base: a0, size: a1, value: a2) */
    sh a2, 0(a0)
    addi a0, a0, 2
    addi a1, a1, -2
    bltu zero, a1, memset16 /* a1 > zero */
    blr zero, ra

.global memcpy: /* (dest: a0, src: a1, len: a2) */
    lb t0, 0(a1)
    addi a1, a1, 1
    sb t0, 0(a0)
    addi a0, a0, 1
    addi a2, a2, -1
    bne a2, zero, memcpy
.ret:
    blr zero, ra

.global memcpy32: /* (dest: a0, src: a1, len: a2) */
    lw t0, 0(a1)
    addi a1, a1, 4
    sw t0, 0(a0)
    addi a0, a0, 4
    addi a2, a2, -4
    bne a2, zero, memcpy32
.ret:
    blr zero, ra