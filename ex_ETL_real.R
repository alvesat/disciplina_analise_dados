# acrescentando mais anos a extração (2018)

sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2485590a-3b35-4ad0-b955-8dfc36b61021/download/acidentes_2018.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

# função para verificar se os nomes das colunas nos bancos são as mesmas

nomes_col <- function(x,y) {
  for (i in names(x)) {
    if (!(i %in% names(y))) {
      print('Nomes não iguais')
      break
    }  
    else if(i==tail(names(y),n=1)) {
      print('Nomes iguais')
    }
  }
}

# verificando se sinistrosRecife2018Raw e sinistrosRecife2019Raw possuem mesmas colunas

nomes_col(sinistrosRecife2018Raw, sinistrosRecife2019Raw)

  #rbind com os dois bancos

sinistros_18_19 <- rbind(sinistrosRecife2018Raw, sinistrosRecife2019Raw)

# verificando se sinistrosRecife2020Raw e sinistrosRecife2021Raw possuem mesmas colunas

nomes_col(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

#rbind com os dois bancos

sinistros_20_21 <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

# nome das colunas em maiusculo em ambos os bancos

names(sinistros_20_21) <- toupper(names(sinistros_20_21))
names(sinistros_18_19) <- toupper(names(sinistros_18_19))

# identificando colunas diferentes entre os bancos

library(janitor)
cols <- compare_df_cols(sinistros_18_19, sinistros_20_21)

  # o banco sinistros_18_19 apresenta diferente as colunas "ENDERECO_CRUZAMENTO", "NUMERO_CRUZAMENTO" e "REFERENCIA_CRUZAMENTO" 

# deleta as variaveis a mais em base sinistros_18_19 e junta as duas bases

names(sinistros_18_19)
sinistros_18_19 <- sinistros_18_19[c(-10,-11, -12)]

sinistrosRecifeRaw <- merge(sinistros_18_19, sinistros_20_21, all = T)

# modifica o tipo do sinistro de texto para fator
sinistrosRecifeRaw$TIPO <- as.factor(sinistrosRecifeRaw$TIPO)

# exporta em .rds
saveRDS(sinistrosRecifeRaw, "sinistrosRecifeRaw.rds")

