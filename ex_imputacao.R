## Exercicio imputacao

library(haven)
library(data.table)
library(plotly)
library(tidyverse)

## abrindo banco covid pe

covid19_pe <- fread('https://dados.seplag.pe.gov.br/apps/basegeral.csv')


## por mun

covid19_pe <- covid19_pe %>% count(municipio, sort = T, name = 'casos') %>% mutate(casos2 = sqrt(casos), casosLog = log10(casos))

## imputacao na 

library(Hmisc) 

(covid_seed <- round(runif(10, 1, 50))) 

(covid19_pe$casos[covid_seed] <- NA) 

# imputacao media casos 

covid19_pe$casos <- impute(covid19_pe$casos, fun = mean) 


is.imputed(covid19_pe$casos) # teste imputacao
table(is.imputed(covid19_pe$casos)) # 9 sim

## Hot deck
# imputação aleatória

covid19_pe$casos[covid_seed] <- NA

covid19_pe$casos <- impute(covid19_pe$casos, "random")
is.imputed(covid19_pe$casos)
