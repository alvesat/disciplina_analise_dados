## exercicio dplyr ##

library(readr)
library(data.table)
library(dplyr)

## abrindo banco The Joyner-Boore Attenuation Data - dataset package

## This data gives peak accelerations measured at various observation stations 
## for 23 earthquakes in California. The data have been used by various 
## workers to estimate the attenuating affect of distance on ground acceleration.

attenu <- as.data.table(attenu)


## media da mag dos terremotos observados (summarise)

summarise(attenu, avg = mean(mag))

## arredondando magnitudes 

attenu$mag <- round(attenu$mag, 0)

## tirando média da aceleração de acordo com a magnitude (agrupamento)

acc <- attenu %>%
  group_by(mag) %>%
  summarise(avg = mean(accel))

## selecionando apenas magnitudes acima de 7 (manipulate)

mag_7 <- filter(attenu, mag > 7)

## selecionando apenas as colunas mag e dist e dps correlacao

mag_dist_cor <- select(attenu, mag, dist)

cor(mag_dist_cor)  

