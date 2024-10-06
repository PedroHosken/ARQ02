#### DADOS DO PROGRAMA ####
    .data
    x1:
    .word     15
    x2:
    .word     25
    x3:
    .word     13
    x4:
    .word     17
    soma:
    .word     -1
#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Carregar endereços e valores da variáveis ####
    la        t0, x1                   # Carrega endereço de x1
    lw        t1, 0(t0)                # carrega valor armazenado x1
    la        t0, x2                   # Carrega endereço de x2
    lw        t2, 0(t0)                # carrega valor armazenado x2
    la        t0, x3                   # Carrega endereço de x3
    lw        t3, 0(t0)                # carrega valor armazenado x3
    la        t0, x4                   # Carrega endereço de x4
    lw        t4, 0(t0)                # carrega valor armazenado x4
#### REALIZAR A SOMA DOS VALORES ####
    add       s1, t1, t2               # Soma de t1 e t2
    add       s2, t3, t4               # soma de t3 e t4
    add       s3, s1, s2               # soma de todos
#### ARMAZENAR NA SOMA ####
    la        t0, soma                 # endereço de soma
    sw        s3, 0(t0)                # armazena valor
#### FIM ####
    nop