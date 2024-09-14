    .data
    x:
    .word     0xFFFFFFFF               # Valor de x
    y:
    .word     8192                     # Valor de y
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
# Novo valor de y
##################
    slli      t3, t2, 2                # 4y
##################
# Novo valor de z
##################
    sub       t4, t1, t3               # z = x - 4y
    la        t0, z
    sw        t4, 0(t0)
#FIM
    ecall
