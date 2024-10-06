#### DADOS DO PROGRAMA ####
    .data
    result:
    .word     0                        # Resultado do 9º termo da série de Fibonacci

#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Inicializar os dois primeiros termos da série ####
    li        t0, 1                    # Primeiro termo (1)
    li        t1, 1                    # Segundo termo (1)
    li        t2, 2                    # Contador para começar do 3º termo

#### Loop para calcular até o 9º termo ####
    loop_fib:
    li        t3, 9                    # Queremos o 9º termo
    beq       t2, t3, end_loop         # Se o contador atingir 9, sai do loop

#### Calcular o próximo termo (t4 = t0 + t1) ####
    add       t4, t0, t1               # Soma dos dois termos anteriores

#### Atualizar os termos para a próxima iteração ####
    mv        t0, t1                   # t0 = t1 (próximo primeiro termo)
    mv        t1, t4                   # t1 = t4 (próximo segundo termo)

#### Incrementar o contador ####
    addi      t2, t2, 1                # Incrementa o contador
    j         loop_fib                 # Vai para a próxima iteração

#### Fim do loop e armazenar o resultado ####
    end_loop:
    la        t5, result               # Carrega o endereço da variável result
    sw        t1, 0(t5)                # Armazena o 9º termo em result
    nop                                # Fim do código
