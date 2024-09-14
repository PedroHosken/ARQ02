    .data
    x:
    .word     3                        # Valor de x
    y:
    .word     4                        # Valor de y
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

############################
# Calcular 15 * x usando shift
############################
    slli      t3, t1, 3                # t3 = x << 3  (multiplica x por 8)
    slli      t4, t1, 2                # t4 = x << 2  (multiplica x por 4)
    slli      t5, t1, 1                # t5 = x << 1  (multiplica x por 2)
    add       t6, t3, t4               # t6 = (x << 3) + (x << 2)  => 12 * x
    add       t6, t6, t5               # t6 = 12 * x + (x << 1)   => 14 * x
    add       t6, t6, t1               # t6 = 14 * x + x          => 15 * x

############################
# Calcular 67 * y usando shift
############################
    slli      t3, t2, 6                # t3 = y << 6  (multiplica y por 64)
    slli      t4, t2, 1                # t4 = y << 1  (multiplica y por 2)
    add       t5, t3, t4               # t5 = (y << 6) + (y << 1) => 66 * y
    add       t5, t5, t2               # t5 = 66 * y + y          => 67 * y

############################
# Somar os resultados
############################
    add       t6, t6, t5               # t6 = (15 * x) + (67 * y)

############################
# Multiplicar o resultado por 4 usando shift
############################
    slli      t6, t6, 2                # t6 = t6 << 2  (multiplica por 4)

############################
# Armazenar o resultado em z
############################
    la        t0, z                    # Carregar o endereço de z
    sw        t6, 0(t0)                # Armazenar o valor de z

# Finalizar a execução
    ecall
