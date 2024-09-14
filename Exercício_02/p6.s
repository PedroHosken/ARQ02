    .data
    x:
    .word     1                        # Valor de x
    y:
    .word     1                        # Valor de y
    z:
    .word     0                        # Local para armazenar z

    .text
    .globl    _start                   # Diretiva correta para o Venus

    _start:

# Carregar os valores de x e y
    la        t0, x                    # Carregar o endereço de x em t0
    lw        t1, 0(t0)                # Carregar o valor de x em t1 (t1 = x)

    la        t0, y                    # Carregar o endereço de y em t0
    lw        t2, 0(t0)                # Carregar o valor de y em t2 (t2 = y)
##################
# Novo valor de x
##################
    slli      t3, t1, 20
##################
# Novo valor de y
##################
    slli      t4, t2, 12
##################
# Somar valores
##################
    add       t5, t4, t3
##################
# Guardar em z
##################
    la        t0, z                    # Carregar o endereço de z
    sw        t5, 0(t0)                # Armazenar o valor de z
# Fim
    ecall
