## ex. datas na pratica

## pacotes

library(lubridate)
library(drc)
library(plotly)

## abrindo banco

covid =  'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'
covid_BR = read.csv2(covid, encoding='latin1', sep = ',')

## selecionando SP

covid_SP <- subset(covid_BR, state == 'SP')

## verificando classe data

class(covid_SP$date)

## transformando em Date format

covid_SP$date <- as.Date(covid_SP$date, format = "%Y-%m-%d")

## sequencial dias

covid_SP$dia <- seq(1:length(covid_SP$date))

## vetores predicao

predDia <- data.frame(dia = covid_SP$dia)
predSeq <- data.frame(dia = seq(max(covid_SP$dia)+1,
                                max(covid_SP$dia)+180))

predDia <- rbind(predDia, predSeq)

## predicao mortes

fitLL <- drm(deaths ~ dia, fct = LL2.5(),
             data = covid_SP, robust = 'mean') #modelo

plot(fitLL, log="", main = "Log logistic") 

predLL <- data.frame(predicao = ceiling(predict(fitLL, predDia))) #predicao

predLL$data <- seq.Date(as.Date('2020-03-12'), by = 'day', length.out = length(predDia$dia))  #data

predLL <- merge(predLL, covid_SP, by.x ='data', by.y = 'date', all.x = T) #mergindo banco

plot_ly(predLL) %>% add_trace(x = ~data, y = ~predicao, type = 'scatter', mode = 'lines', name = "Mortes - Predição") %>% add_trace(x = ~data, y = ~deaths, name = "Mortes - Observadas", mode = 'lines') %>% layout(
  title = 'Predição de Mortes de COVID 19 em SP', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Mortes Acumuladas por Dia', showgrid = FALSE),
  hovermode = "compare") # grafico




