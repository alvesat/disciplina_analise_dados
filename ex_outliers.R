## Exercicio outliers

library(haven)
library(data.table)
library(plotly)
library(tidyverse)

## abrindo banco covid pe

covid19_pe <- fread('https://dados.seplag.pe.gov.br/apps/basegeral.csv')


## por mun

covid19_pe <- covid19_pe %>% count(municipio, sort = T, name = 'casos') %>% mutate(casos2 = sqrt(casos), casosLog = log10(casos))

## identificando outliers em casosLog

plot_ly(y = covid19_pe$casosLog, type = "box", text = covid19_pe$municipio, boxpoints = "all", jitter = 0.3)
boxplot.stats(covid19_pe$casosLog)$out
boxplot.stats(covid19_pe$casosLog, coef = 2)$out

covid19PEOut <- boxplot.stats(covid19_pe$casosLog)$out
covid19PEOutIndex <- which(covid19_pe$casosLog %in% c(covid19PEOut))
covid19PEOutIndex

## outliers detectados 9 casos (linhas 1,2,3,4,5,6,186,187,188)