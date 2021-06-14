## Exercicio Valores Ausentes

library(haven)
library(data.table)
library(funModeling)
library(tidyverse)

## abrindo banco com votacao vereadores (2020) recife por secao


Votacao_total <- read_sav("C:/Users/55879/Desktop/ELEICOES_ANALISE_VEREADOR_REC/Votacao_total_secao_vereadores.sav")
View(Votacao_total)

## identificando valores ausentes

status <- as.data.frame(status(Votacao_total))

## shadow matrix

shad_matr <- as.data.frame(abs(is.na(Votacao_total)))
head(shad_matr)

## selecionando apenas as var. com na e identificando padrão

selec_na <- shad_matr[which(sapply(shad_matr, sd) > 0)]

cor(Votacao_total, selec_na, use = "pairwise.complete.obs")


