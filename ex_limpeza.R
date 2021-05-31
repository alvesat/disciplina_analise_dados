## Exercicio Limpeza 

library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling) 

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

latin_america_countries <-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela") # vetor que identifica países latino americanos

latin_america <- general_data %>% filter(location %in% latin_america_countries) # filtra casos apenas no vetor

latin_america <- latin_america %>% select(location, new_cases, new_deaths)

latin_america %>% filter(new_cases < 0)

latin_america <- latin_america %>% filter(new_cases>=0)

## verificando se há na na base latin

ftable(is.na(latin_america$new_deaths)) # sim
ftable(is.na(latin_america$new_cases)) # não

## selecionando apenas as linhas sem na

latin_america_s_na <- latin_america[complete.cases(latin_america), ]

## verificando se ainda há na

ftable(is.na(latin_america_s_na$new_deaths)) # não
ftable(is.na(latin_america_s_na$new_cases)) # não

