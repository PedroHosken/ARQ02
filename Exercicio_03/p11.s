# considere x mapeado em s1
    .data
    x1:
    .word     15
    x2:
    .word     25
    x3:
    .word     13
    x4:
    .word     17
    .text
    .globl    _start
    _start:
    addi      s1, zero, 1              # x = 1
# Armazenar os valores do endereço e valor de x1
    la        t0, x1                   # carrega endereço de x1
    lw        t1, 0(t0)                # carrega valor de x1
# Armazenar os valores do endereço e valor de x2
    la        t0, x2                   # carrega endereço de x2
    lw        t2, 0(t0)                # carrega valor de x2
# Armazenar os valores do endereço e valor de x3
    la        t0, x3                   # carrega endereço de x3
    lw        t3, 0(t0)                # carrega valor de x3
# Armazenar os valores do endereço e valor de x4
    la        t0, x4                   # carrega endereço de x4
    lw        t4, 0(t0)                # carrega valor de x4
    nop
