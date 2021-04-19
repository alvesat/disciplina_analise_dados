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

# estrutura de repeticao para criacao dos histogramas

par(mfrow = c(1,2))

for (i in 1:2) {
  x <- carro_base[,i]
  hist(x,
       main = paste("Variável", i, names(carro_base)[i]),
       xlab = "Valores")
}

# usando mapply para os histogramas

mapply(hist, carro_base[,1:2], MoreArgs = list(main = "Histograma", xlab = "Valores", ylab = "Freq."))

# usando sapply

sapply(carro_base[,1:2], hist)
