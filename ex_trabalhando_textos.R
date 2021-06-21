## EXERCICIO TRABALHANDO COM TEXTOS

## PACOTES

library(dplyr)
library(pdftools)
library(textreadr)
library(stringr)

## Lendo texto (MPV Eletrobrás da ordem do dia 21_06_21 CD)

MPV <- read_pdf('MPV_1031_2021.pdf', ocr = T)

## Extraindo data inicio documento

datas <- str_extract_all(MPV$text, "\\d{2}/\\d{2}/\\d{2}")

datas[1]
