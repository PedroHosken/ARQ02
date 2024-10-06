#### DADOS DO PROGRAMA ####
    .data
    x:
    .word     5
    z:
    .word     7
    y:
    .word     0                        # esse valor deverá ser sobrescrito
#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Carregar endereços e valores da variáveis ####
    la        t0, x                    # Carrega endereço de x
    lw        t1, 0(t0)                # carrega valor armazenado x
    la        t0, z                    # Carrega endereço de z
    lw        t2, 0(t0)                # carrega valor armazenado z
#### OP: Y = 127X - 65Z + 1 ####
    li        t3, 127                  # Carrega o valor de 127
    mul       s1,t1,t3                 # 127x
    li        t3, -65                  # Carrega valor de -65
    mul       s2, t2, t3               # -65z
    add       t3, s1, s2               # 127x - 65z
    addi      s3, t3, 1                # 127x - 65z + 1
#### ARMAZENAR EM Y ####
    la        t0, y                    # endereço de y
    sw        s3, 0(t0)                # armazena valor
#### FIM ####
    nop
