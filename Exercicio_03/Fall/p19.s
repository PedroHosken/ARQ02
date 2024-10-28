#### DADOS DO PROGRAMA ####
    .data
    x:
    .word     0
    i:
    .word     0
#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Carregar endereços e valores da variáveis ####
    la        t0, x                    # Carrega endereço de x
    lw        s1, 0(t0)                # carrega valor armazenado x
    la        t0, i                    # Carrega endereço de i
    lw        s2, 0(t0)                # carrega valor armazenado i
#### OP: while(i <= 8)  x = i++; ####
    li        s3, 8                    # armazena valor a várivel estática
    loop:
    bgt       s2, s3, fim              # teste se i > 8, pula
    mv        s1, s2                   # x = i
    addi      s2, s2, 1                # i++
    j         loop                     # volta para loop
#### FIM ####
    fim       :
    la        t0, x                    # Carrega o endereço de x
    sw        s1, 0(t0)                # Armazena o valor final de x
    la        t0, i                    # Carrega o endereço de i
    sw        s2, 0(t0)                # Armazena o valor final de i
    nop
