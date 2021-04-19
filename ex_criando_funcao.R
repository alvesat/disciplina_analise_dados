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


# criando funcao para converter a variavel speed de mph para km

km_converter <- function(x) {
  x <- x * 1.60934
}

speed_km <- km_converter(carro_base$speed)
