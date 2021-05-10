# Exercicio Carga Incremental 

# carregando pacote
library(dplyr)

# lendo banco vacinados covid em recife (dados abertos coleta em 10_05) 

vacinados_rec <- read.csv2('http://dados.recife.pe.gov.br/dataset/f381d9ea-4839-44a6-b4fe-788239189900/resource/966e9c4c-df45-40d7-9c58-2f13c61a6d28/download/vacinados.csv',
                           sep = ";")

# lendo banco vacinados covid em recife 15-30 de abril (portal da transp coleta em 10_05)

vacinados_2021 <- read.csv("C:/Users/55879/Downloads/vacinados_2021.csv", encoding="UTF-8", sep=";")

# [chave primaria = cpf] 
# verificando se as informacoes da ultima quinzena de abril estao no banco original

vacinados <- (!vacinados_2021$CPF %in% 
                vacinados_rec$cpf)

ftable(vacinados) # todos os casos da ultima quinzena de abril estao no banco inicial 


