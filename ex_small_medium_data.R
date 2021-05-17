# exercicio small e medium data

# abrindo pacotes

library(data.table)

# endereco banco 

endereco_banco <- 'C:/Users/5579/Desktop/eleicoes.csv'


# lendo as primeiras 50 linhas do banco via amostragem


banco_eleicoes <- read.csv2(endereco_banco, sep = ",", dec = ".", encoding = 'UTF-8', nrows = 50)

amostra_banco <- sapply(banco_eleicoes, class)



# lendo banco

system.time(banco <- data.frame(read.csv2(endereco_banco, colClasses = amostra_banco)))

system.time(banco_eleicoes <- read.csv2(endereco_banco, sep = ",", dec = ".", encoding = 'UTF-8'))

