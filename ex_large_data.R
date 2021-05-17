# exercicio large data 

# abrindo pacotes

library(ff)

# endereco banco (dados turmas censo escolar)

endereco_banco <- 'C:/Users/55879/Desktop/TURMAS.csv'


# abrindo arquivo (ff)

turmas <- read.csv.ffdf(file = endereco_banco, sep = "|")

# head e class

class(turmas)

head(turmas)

# soma e media

sum(turmas[,7])
mean(turmas[,7])

# amostra e reg

amostra <- turmas[sample(nrow(turmas), 10000),]

lm(NU_MATRICULAS ~ TP_LOCALIZACAO, amostra)

