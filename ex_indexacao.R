# exercicio centralizacao 

# base cars

carro_base <- cars
names(carro_base)

# histograma da variavel "speed"

hist(carro_base$speed)

# centralizar a variavel "speed"

speed <- carro_base$speed

speed <- speed - mean(speed)

hist(speed)

# verificando os elementos da primeira coluna da base cars

carro_base[,1]

# verificando se o elemento da primeira linha em speed é um valor maior que o da segunda

carro_base[1,1] < carro_base[2,1]

# verificando se o elemento da primeira linha em speed é igual o da segunda

carro_base[1,1] == carro_base[2,1]

# retornando a coluna dist

carro_base[,"dist"]
