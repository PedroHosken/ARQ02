#### DADOS DO PROGRAMA ####
    .data
    i:
    .word     8                        # Inicialmente, i = 8
    x:
    .word     0                        # Inicialmente, x = 0

#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Carregar endereços e valores das variáveis ####
    la        t0, i                    # Carrega o endereço de 'i'
    lw        s0, 0(t0)                # Carrega o valor de 'i' em s0
    la        t1, x                    # Carrega o endereço de 'x'
    lw        s1, 0(t1)                # Carrega o valor de 'x' em s1

#### Início do loop while(i == 8) ####
    loop_while:
    li        t2, 8                    # Carrega o valor 8 em t2
    bne       s0, t2, fim              # Se i != 8, sai do loop

#### Dentro do loop: x = i e i++ ####
    mv      s1, s0                   # x = i
    addi      s0, s0, 1                # i++

#### Atualiza os valores na memória ####
    sw        s1, 0(t1)                # Armazena o valor de x
    sw        s0, 0(t0)                # Armazena o valor de i
    j         loop_while               # Volta para o início do loop

#### Fim do programa ####
    fim:
    nop                                # Fim do código
