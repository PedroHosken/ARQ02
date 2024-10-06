#### DADOS DO PROGRAMA ####
    .data
    A:
    .word     1, 3, 5, 7, 9
    B:
    .word     2, 4, 6, 8, 10

#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### ENDEREÇOS DE A E B ####
    la        s1, A                    # Carrega endereço de A
    la        s2, B                    # Carrega endereço de B
#### OPERAÇÃO 1 : A[0] = B[0] * 1 + A[0] ####
    lw        t0, 0(s1)                # A[0]
    lw        t1, 0(s2)                # B[0]
    li        t2, 1                    # 1
    mul       t3, t2, t1               # B[0] * 1
    add       t4, t3, t0               # B[0] * 1 + A[0]
    sw        t4, 0(s1)                # A[0] = B[0] * 1 + A[0]
#### OPERAÇÃO 2 : A[1] = B[1] * 2 + A[1] ####
    lw        t0, 4(s1)                # A[1]
    lw        t1, 4(s2)                # B[1]
    li        t2, 2                    # 2
    mul       t3, t2, t1               # B[1] * 2
    add       t4, t3, t0               # B[1] * 2 + A[1]
    sw        t4, 4(s1)                # A[1] = B[1] * 1 + A[1]
#### OPERAÇÃO 3 : A[2] = B[2] * 3 + A[2] ####
    lw        t0, 8(s1)                # A[2]
    lw        t1, 8(s2)                # B[2]
    li        t2, 3                    # 3
    mul       t3, t2, t1               # B[2] * 3
    add       t4, t3, t0               # B[2] * 3 + A[2]
    sw        t4, 8(s1)                # A[2] = B[2] * 3 + A[2]
#### OPERAÇÃO 4 : A[3] = B[3] * 4 + A[3] ####
    lw        t0, 12(s1)               # A[3]
    lw        t1, 12(s2)               # B[3]
    li        t2, 4                    # 4
    mul       t3, t2, t1               # B[3] * 4
    add       t4, t3, t0               # B[3] * 4 + A[3]
    sw        t4, 12(s1)               # A[3] = B[3] * 4 + A[3]
#### OPERAÇÃO 5 : A[4] = B[4] * 5 + A[4] ####
    lw        t0, 16(s1)               # A[4]
    lw        t1, 16(s2)               # B[4]
    li        t2, 5                    # 5
    mul       t3, t2, t1               # B[4] * 5
    add       t4, t3, t0               # B[4] * 5 + A[4]
    sw        t4, 16(s1)               # A[4] = B[4] * 5 + A[4]
#### FIM ####
    nop
