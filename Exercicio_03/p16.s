#### DADOS DO PROGRAMA ####
    .data
    a:
    .word     10                       # Exemplo: um valor qualquer para a
    b:
    .word     45                       # Exemplo: um valor qualquer para b
    x:
    .word     0                        # Inicialmente x = 0
#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
##### COMEÇO DO PROGRAMA #####
    _start:
#### Carregar endereços e valores das variáveis ####
    la        t0, a                    # Carrega o endereço de 'a'
    lw        s0, 0(t0)                # Carrega o valor de 'a' em s0
    la        t0, b                    # Carrega o endereço de 'b'
    lw        s1, 0(t0)                # Carrega o valor de 'b' em s1
    la        t0, x                    # Carrega o endereço de 'x'
    lw        s2, 0(t0)                # Carrega o valor de 'x' em s2 (inicialmente 0)

#### Verificação: if (a >= 0) ####
    bgez      s0, check_b              # Se a >= 0, verifica b, senão, pula

#### Verificação: if (b <= 50) ####
    check_b:
    li        t1, 50                   # Carrega 50 em t1
    ble       s1, t1, set_x            # Se b <= 50, vai para set_x

#### Atribuição: x = 1 ####
    set_x:
    li        s2, 1                    # Atribui 1 para x
    sw        s2, 0(t0)                # Armazena o valor de x na memória

#### FIM ####
    nop
