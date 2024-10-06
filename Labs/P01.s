    .data
a:
    .word  3, 8, 20, 15    # Array Estático

    .text
    .globl _start
_start:
#### Definir dados ####
    li     s3, 4           # n = 4
    li     s4, 0           # x = 0
    li     s2, 0           # i = 0
    la     s1, A           # carrega o endereço de memória de A
#### For1 ####
    bge    s2, s3,FimFor1  # i < N, pula para Fimfor1 caso maior
    slli   t0, s2,2        # Valor de i para o for
    add    t0, s1, t0      # Valor de i para o for
    lw     t1, 0(t0)       # Carrega o valor de A[i]
    li     t0, 2           # Valor para comparar %
    rem    t0, s2, t0      # Valor i % 2
    bne    t0, zero, FimIf # Teste para caso seja 0, caso não seja pula
    addi   t1, t1, 3       # A[i] + 3
    sw     t1, 0(t0)       # A[i] = A[i] + 3
FimIf:
    slti   s4, t1, 12      # x = A[i] < 12 ? 1 : 0
    addi   s2, s2, 1       # i++
    j      For1            # for
FimFor1:
    li     s4, 0
    ecall