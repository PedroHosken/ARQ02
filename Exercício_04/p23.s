#### DADOS DO PROGRAMA ####
    .data
    A:
    .word     -5                        # Valor inicial de A

#### PARTE EXECUTÁVEL ####
    .text
    .globl    _start
#### COMEÇO DO PROGRAMA ####
    _start:
    la        t0, A                    # Carrega o endereço de A em t0
    lw        a0, 0(t0)                # Carrega o valor de A em a0
    jal       is_positivo              # Chama a função que testa o valor

    sw        a0, 0(t0)                # Armazena o valor retornado em A
    j         end_program              # Salta para o fim do programa

#### FUNÇÃO: is_positivo ####
    is_positivo:
    blt       a0, x0, is_negativo       # teste se menor que 0
    jr        ra                       # Retorna a chamada para os positivos

#### FUNÇÃO: is_negativo ####
    is_negativo:
    sub       a0, zero, a0             # Calcula o módulo (opcional)
    jr        ra                       # Retorna para a chamada

#### FIM DO PROGRAMA ####
    end_program:
    nop
