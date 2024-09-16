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
    nop
