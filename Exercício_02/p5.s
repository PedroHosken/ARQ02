    .data
    x         : .word 3 # x = 3
    y         : .word 4 # y = 4
    z         : .word 0 # para futuro

    .text
    .global   _start

    _start:

# Carregar os valores de x e y
    la        t0, x                    # Carregar o endereço de x em t0
    lw        t1, 0(t0)                # Carregar o valor de x em t1 (t1 = x)

    la        t0, y                    # Carregar o endereço de y em t0
    lw        t2, 0(t0)                # Carregar o valor de y em t2 (t2 = y)

###############################
# Calcular 15 * x usando shift
###############################

    slli      t3, 2, 3                 # 2 ao cubo = 8
    slli      t2, 2, 2                 # 2 ao quadrado = 4
    slli      t1, 2, 1                 # 2 elevado a 1 = 2
    slli      t0, 2, 0                 # 2 elevado a 0 = 1
    
