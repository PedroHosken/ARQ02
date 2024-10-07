#### DADOS DO PROGRAMA ####
    .data
    a:
    .word     5
    b:
    .word     10
    x:
    .word     0                        # valor será sobescrito
#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Carregar endereços e valores da variáveis ####
    la        t0, a                    # Carrega endereço de a
    lw        s0, 0(t0)                # carrega valor armazenado a
    la        t0, b                    # Carrega endereço de b
    lw        s1, 0(t0)                # carrega valor armazenado b
    la        t0, x                    # Carrega endereço de x
    lw        s2, 0(t0)                # carrega valor armazenado x
#### OP: if ( a >= 0 && b <= 50 ) ####
    li        t1, 0                    # registrador auxiliar = 0
    blt       s0, t1, fim              # teste de a < 0, pula
    li        t1, 50                   # registrador auxiliar = 50
    bgt       s1, t1, fim              # teste de b > 50, pula
    li        s2, 1                    # Se ambos são verdadeiros, x = 1
    j         fim                      # pula para o fim
#### FIM ####
    fim:
    sw        s2, 0(t0)                # armazena valor na memmória
    nop
