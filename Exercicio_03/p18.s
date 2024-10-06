#### DADOS DO PROGRAMA ####
    .data
    temp:
    .word     10                       # Valor inicial para temp (exemplo)
    x:
    .word     0                        # Inicialmente x = 0

#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Carregar endereços e valores das variáveis ####
    la        t0, temp                 # Carrega o endereço de 'temp'
    lw        s0, 0(t0)                # Carrega o valor de 'temp' em s0
    la        t0, x                    # Carrega o endereço de 'x'
    lw        s1, 0(t0)                # Carrega o valor de 'x' em s1 (inicialmente 0)

#### Início do switch/case ####
    li        t1, 10                   # Carrega o valor 10 em t1
    beq       s0, t1, case_10          # Se temp == 10, pula para case_10
    li        t1, 25                   # Carrega o valor 25 em t1
    beq       s0, t1, case_25          # Se temp == 25, pula para case_25
    j         default_case             # Se não for nenhum dos casos, vai para default_case

#### Casos do switch ####
    case_10:
    li        s1, 10                   # x = 10
    j         fim                      # Pula para o fim

    case_25:
    li        s1, 25                   # x = 25
    j         fim                      # Pula para o fim

#### Caso padrão (default) ####
    default_case:
    li        s1, 0                    # x = 0 (caso padrão)

#### Fim do programa ####
    fim:
    sw        s1, 0(t0)                # Armazena o valor de 'x' na memória
    nop                                # Fim do código
