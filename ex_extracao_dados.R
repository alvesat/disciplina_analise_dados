# exercicio extracao

# lendo arquivo texto (unidades saúde recife)

unidades_saude_rec <- read.csv2('http://dados.recife.pe.gov.br/dataset/40638fd0-418e-4eeb-8871-b4ed92a973c2/resource/d05f6ffa-304b-4a28-bd03-1ffb26cbf866/download/20210411_rede_saude_dados_abertos.csv')
                                
# lendo arquivo excel (dados suicidio 1996-2019)

library(readxl)

SUIC_MUN <- read_excel("Eletiva_analise_dados/Eletiva_Analise_Dados/bancos/SUIC_MUN_1996_19.xlsx")

# lendo arquivo xml astronomical data

install.packages('XML')
library(XML)

astronomical_data <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/nasa/nasa.xml")
