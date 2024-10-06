#### DADOS DO PROGRAMA ####
    .data
    option:
    .word     2                        # Exemplo: valor 2 para option
    result:
    .word     0                        # Inicialmente result = 0

#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Carregar endereços e valores das variáveis ####
    la        t0, option               # Carrega endereço de 'option'
    lw        s0, 0(t0)                # Carrega valor de 'option' em s0
    la        t0, result               # Carrega endereço de 'result'
    lw        s1, 0(t0)                # Carrega valor de 'result' em s1

#### Início do switch/case ####
    li        t1, 1                    # Carrega o valor 1 em t1
    beq       s0, t1, case_1           # Se option == 1, pula para case_1
    li        t1, 2                    # Carrega o valor 2 em t1
    beq       s0, t1, case_2           # Se option == 2, pula para case_2
    li        t1, 3                    # Carrega o valor 3 em t1
    beq       s0, t1, case_3           # Se option == 3, pula para case_3
    j         default_case             # Se não for nenhum dos casos, vai para default_case

#### Casos do switch ####
    case_1:
    li        s1, 10                   # result = 10
    j         fim                      # Pula para o fim

    case_2:
    li        s1, 20                   # result = 20
    j         fim                      # Pula para o fim

    case_3:
    li        s1, 30                   # result = 30
    j         fim                      # Pula para o fim

#### Caso padrão (default) ####
    default_case:
    li        s1, -1                   # result = -1 (caso padrão)

#### Fim do programa ####
    fim:
    sw        s1, 0(t0)                # Armazena o valor de 'result' na memória
    nop                                # Fim do código
