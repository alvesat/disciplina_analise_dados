## exercicio datas e tempos

library(lubridate)
library(electionsBR)

## selecionando banco

candidatos_2020 <- candidate_local(2020, uf = "all")

## verificando classe (data de ultima at nos dados)

class(candidatos_2020$DT_GERACAO)

## convertendo em data 

candidatos_2020$DT_GERACAO <- dmy(candidatos_2020$DT_GERACAO)

## convertendo coluna com data e hora (POSIXct)

candidatos_2020$data_posi <- ISOdate(year = year(candidatos_2020$DT_GERACAO),
                                     month = month(candidatos_2020$DT_GERACAO),
                                     day = day(candidatos_2020$DT_GERACAO),
                                     hour = hour(candidatos_2020$HH_GERACAO))


## convertendo coluna com data e hora (POSIXlt)

candidatos_2020$data_posixlt <- as.POSIXlt(candidatos_2020$data_posi)

## extracoes 

ultimo_up_dados_ano <- year(candidatos_2020$DT_GERACAO)

ultimo_up_dados_mes <- month(candidatos_2020$data_posi)

ultimo_up_dados_dia <- day(candidatos_2020$data_posi)

