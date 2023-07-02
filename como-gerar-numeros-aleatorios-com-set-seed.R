# Definir a semente como 3
set.seed(3)

# Gerar um número aleatório entre 0 e 1
numero_aleatorio <- runif(1)

# Imprimir o número aleatório gerado
print(numero_aleatorio)

#rodar 2 x, vai dar os mesmos valores da primeira vez
set.seed(3)
aleatorio_1 <- runif(1)
aleatorio_2 <- runif(1)
print(aleatorio_1)
print(aleatorio_2)
set.seed(2)
aleatorio_1 <- runif(1)
aleatorio_2 <- runif(1)
print(aleatorio_1)
print(aleatorio_2)
