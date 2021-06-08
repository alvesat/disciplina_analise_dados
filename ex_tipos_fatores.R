## exercicio dplyr ##

library(readr)
library(data.table)
library(dplyr)

## abrindo banco presidentes (tx de aprovacao) - dataset package

presi <- as.data.frame(presidents)
presi <- as.data.table(presidents)

## criando coluna para classificar a aprovacao

presi$class <- ifelse(presi$x < 25, 'risco alto', 'sem risco')
presi$class <- as.character(presi$class)

## transformando em fator 

presi$class_fac <- factor(presi$class, levels = recode)
