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
