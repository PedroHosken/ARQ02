#### DADOS DO PROGRAMA ####
    .data
    A:
    .word     0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # Array A[10], todos inicializados com 0

#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Inicializar i = 0 ####
    li        t0, 0                    # i = 0
    la        t1, A                    # Carregar o endereço base de A em t1

#### Início do loop for (i = 0; i < 10; i++) ####
    loop:
    li        t3, 10                   # Carregar o limite superior 10
    bge       t0, t3, end_loop         # Se i >= 10, sai do loop

#### A[i] = A[i] + 1 ####
    slli      t2, t0, 2                # Multiplica i por 4 (tamanho de uma word)
    add       t2, t1, t2               # Calcula o endereço de A[i]
    lw        t4, 0(t2)                # Carrega A[i] em t4
    addi      t4, t4, 1                # Incrementa A[i]
    sw        t4, 0(t2)                # Armazena A[i] de volta na memória

#### Incrementar i ####
    addi      t0, t0, 1                # i = i + 1
    j         loop                     # Volta para o início do loop

#### Fim do loop ####
    end_loop:
    nop                                # Fim do código
