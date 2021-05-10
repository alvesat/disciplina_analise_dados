# exercicio webscraping

# abrindo pacotes

library(rvest)
library(dplyr)

# tabela wikipedia estatais no brasil (controle direto dependentes do tesouro)

url <- "https://pt.wikipedia.org/wiki/Lista_de_empresas_estatais_do_Brasil"

urlTables <- url %>% read_html %>% html_nodes("table")

urlLinks <- url %>% read_html %>% html_nodes("link")

estatais_br <- as.data.frame(html_table(urlTables[2]))


