## exercicio 2 ##

## lendo pacotes

library(ff)
library(readxl)

## lendo dados

setwd("C:/Users/55879/Documents/Eletiva_analise_dados/Eletiva_analise_dados/exercicio_2") ## definindo area

situacao_final <- dir(pattern = "*.csv") ##lista csv
ldf <- list() ##lista para o loop

for (k in 1:length(situacao_final)){
  ldf[[k]] <- read.csv(situacao_final[k],sep = ";")
} 

## convertendo para dataframe

situacao_final_alunos <- do.call(rbind.data.frame, ldf)

## convertendo para ff

cols <- c(2,3,4,5,8,9,10,11,12,13, 15, 16, 17)

situacao_final_alunos[cols] <- lapply(situacao_final_alunos[cols] , factor)

banco <- as.ffdf(situacao_final_alunos)

rm(a, ldf, b, class, cols, k, situacao_final)

## salvando em rds

local <- getwd()
saveRDS(situacao_final_alunos, "banco.rds", local)
