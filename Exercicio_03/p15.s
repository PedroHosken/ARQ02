#### DADOS DO PROGRAMA ####
    .data
    x:
    .word     5
    y:
    .word     10
    m:
    .word     0                        # valore será sobescrito
#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Carregar endereços e valores da variáveis ####
    la        t0, x                    # Carrega endereço de x
    lw        s0, 0(t0)                # carrega valor armazenado x
    la        t0, y                    # Carrega endereço de y
    lw        s1, 0(t0)                # carrega valor armazenado y
    la        t0, m                    # Carrega endereço de m
    lw        s2, 0(t0)                # carrega valor armazenado y
#### OP: if (x > y) ####
    ble       s0,s1, mi                # Nesse caso menor igual pula
    mv        s2, s0                   # m = x
    j         fim                      # pula para fim
    mi:
    mv        s2,s1                    # m = y
    fim:
    sw        s2,0(t0)                 # armazena valor
#### FIM ####
    nop
