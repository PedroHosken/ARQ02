#### DADOS DO PROGRAMA ####
    .data

    Vetor:
    .word     1, 3, 5, 7, 9, 11, 13, 0, 2, 4, 6, 8, 10, 12

    Soma:
    .word     -1

    Maior:
    .word     -1

#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
#### COMEÇO DO PROGRAMA ####
    _start:

#### INICIALIZAÇÃO ####
    la        t0, Vetor                # Carrega o endereço do início de Vetor em t0
    li        t4, 0                    # Inicializa Soma em 0
    lw        t5, 0(t0)                # Inicializa Maior com o primeiro valor do vetor

#### PERCORRER VETOR ####
    li        t6, 0                    # Variável de controle do vetor
    li        s1, 14                   # Tamanho do vetor (14 elementos)

    loop:
    bge       t6, s1, fim              # Se controle >= tamanho, sai do loop

    lw        t1, 0(t0)                # Carrega o valor atual do vetor em t1
    add       t4, t4, t1               # Soma o valor atual em t4

    blt       t5, t1, atualiza_maior   # Se t1 > t5, atualiza o maior valor
    j         continua                 # Caso contrário, segue o loop

    atualiza_maior:
    mv        t5, t1                   # Atualiza o maior valor

    continua:
    addi      t0, t0, 4                # Avança para o próximo elemento do vetor
    addi      t6, t6, 1                # Incrementa o controle
    j         loop                     # Volta ao início do loop

#### FIM DO PROGRAMA ####
    fim:
    la        t2, Soma                 # Carrega o endereço de Soma em t2
    sw        t4, 0(t2)                # Armazena a soma total em Soma
    la        t3, Maior                # Carrega o endereço de Maior em t3
    sw        t5, 0(t3)                # Armazena o maior valor em Maior
    nop
