## exercicio enriquecimento

library(splitstackshape)
library(reshape2)
library(readxl)

# abrindo dados suic mun e invertendo base

suic_mun <- read_excel("C:/Users/55879/OneDrive - Universidade Federal de Pernambuco/Consult/Isabel/Dados Tratados/SUIC_MUN_1996_19.xlsx")

suic <- melt(suic_mun, measure.vars = c("1996","1997","1998","1999","2000","2001","2002",
                                        "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010",
                                        "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019"))

suic$suicidios <- suic$value
suic$value <- NULL

# abrindo banco pop

pop_mun_1992_2018 <- read_excel("C:/Users/55879/Downloads/pop_mun_1992_2018.xlsx")

# criando variavel com o codigo ibge e a variavel de 1996 ((1995+1997)/2) e juntando com a pop de 19

pop_mun_1992_2018$Cod_IBGE_6 <- substr(pop_mun_1992_2018$Município, start = 1, stop = 6)
pop_mun_1992_2018$`1996` <- (pop_mun_1992_2018$`1995`+pop_mun_1992_2018$`1997`)/2 

pop_mun_1992_2018$`1992` <- NULL
pop_mun_1992_2018$`1993` <- NULL
pop_mun_1992_2018$`1994` <- NULL
pop_mun_1992_2018$`1995` <- NULL

pop_mun_1992_2018$`1996` <- round(pop_mun_1992_2018$`1996`)


# incluindo estimativas populacionais de 2019

pop2019 <- read_excel("C:/Users/55879/Downloads/POP2019_20210331.xls", 
                      col_types = c("text", "numeric", "text", 
                                    "text", "numeric", "numeric"))

codigos_mun <- read.csv("C:/Users/55879/Downloads/codigos_mun.txt", encoding="UTF-8")

pop2019$id_munic_7 <- pop2019$COD_MUN

## merge (right join)

pop_2019 <- merge(pop2019, codigos_mun, all.y = TRUE)

## após isso, é possível mergir com o banco contendo os dados de suicidio 
## devido a mesma coluna (codigo ibge) nos bancos