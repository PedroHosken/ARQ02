#### DADOS DO PROGRAMA ####
    .data
    A:
    .word     0, 1, 2, 3, 4, 5, 6, 7, 8, 9 # Array A[10], inicializado com valores

#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Inicializar i = 0 ####
    li        t0, 0                    # i = 0
    la        t1, A                    # Carrega o endereço base de A em t1

#### Início do loop for (i = 0; i < 10; i++) ####
    loop:
    li        t3, 10                   # Carrega o limite superior 10
    bge       t0, t3, end_loop         # Se i >= 10, sai do loop

#### Verificar se i é par (i % 2 == 0) ####
    rem       t4, t0, t2               # Calcula o resto de i % 2
    beqz      t4, case_even            # Se i é par (i % 2 == 0), vai para case_even

#### Caso ímpar: A[i] = A[i] * 2 ####
    case_odd:
    slli      t2, t0, 2                # Multiplica i por 4 (tamanho de uma word)
    add       t2, t1, t2               # Calcula o endereço de A[i]
    lw        t3, 0(t2)                # Carrega A[i] em t3
    slli      t3, t3, 1                # Multiplica A[i] por 2
    sw        t3, 0(t2)                # Armazena A[i] de volta
    j         increment_i              # Pula para incrementar i

#### Caso par: A[i] = A[i] + A[i+1] ####
    case_even:
    slli      t2, t0, 2                # Multiplica i por 4
    add       t2, t1, t2               # Calcula o endereço de A[i]
    lw        t3, 0(t2)                # Carrega A[i] em t3
    lw        t4, 4(t2)                # Carrega A[i+1] (A[i+1] está 4 bytes à frente)
    add       t3, t3, t4               # A[i] = A[i] + A[i+1]
    sw        t3, 0(t2)                # Armazena A[i] de volta
    j         increment_i              # Pula para incrementar i

#### Incrementar i ####
    increment_i:
    addi      t0, t0, 1                # i = i + 1
    j         loop                     # Volta para o início do loop

#### Fim do loop ####
    end_loop:
    nop                                # Fim do código
