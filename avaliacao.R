### AVALIACAO ###

### pacotes

library(dplyr)
library(lubridate)

### abrindo banco

# carregar dados covid19 Pernambuco
covid19_PE<- read.csv2('https://dados.seplag.pe.gov.br/apps/basegeral.csv')


covid19_PE$dt_notificacao <- as.Date(covid19_PE$dt_notificacao, format = "%Y-%m-%d")
covid19_PE$dt_obito <- as.Date(covid19_PE$dt_obito, format = "%Y-%m-%d")

# semana epidemiologica

covid19_PE$sem_epid <- epiweek(covid19_PE$dt_notificacao)

# selecionando casos apenas confirmados

covid19_mun <- covid19_PE %>% filter(classe %in% 'CONFIRMADO')

# agregando casos por semana epidemiologica e mun

covid19_casos <- covid19_mun %>% group_by(sem_epid) %>%
 count(municipio, sort = T, name = 'casos')

# agregado obitos por semana epidemiologica e mun

covid19_mun_ob <- covid19_mun %>% filter(evolucao %in% 'OBITO')

covid19_obitos <- covid19_mun_ob %>% group_by(cd_municipio, sem_epid) %>%
  count(municipio, sort = T, name = 'obitos')

# mergindo o banco de casos e obitos e 0 nos na

banco_covid <- merge(covid19_casos, covid19_obitos, all = TRUE)
banco_covid$casos[is.na(banco_covid$casos)] <- 0
banco_covid$obitos[is.na(banco_covid$obitos)] <- 0
banco_covid$cd_municipio <- NULL

# abrindo banco ibge

tabela6579 <- read_excel("C:/Users/55879/Downloads/tabela6579.xlsx", 
           col_types = c("text", "numeric"))

# colocando nome dos mun em maiusculo

tabela6579$NOME_MUN <- toupper(tabela6579$NOME_MUN)

# retirando acentuacao e removendo (UF) do banco

Encoding(tabela6579$NOME_MUN)
tabela6579$NOME_MUN <- iconv(tabela6579$NOME_MUN,from="UTF-8",to="ASCII//TRANSLIT")

tabela6579$NOME_MUN <-  gsub('.{4}$', '', tabela6579$NOME_MUN)

# juntando com o banco

tabela6579$municipio <- tabela6579$NOME_MUN

banco_pop <- merge(banco_covid, tabela6579, by = "municipio", all.x = TRUE)

## calculando taxas

banco_pop$tx_casos <- (banco_pop$casos/banco_pop$POP)*100000
banco_pop$tx_let <- (banco_pop$obitos/banco_pop$POP)*100000
