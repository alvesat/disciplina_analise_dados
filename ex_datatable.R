## exercicio data.table ##

library(readr)
library(data.table)
library(dplyr)

## abrindo banco The Joyner-Boore Attenuation Data - dataset package

## This data gives peak accelerations measured at various observation stations 
## for 23 earthquakes in California. The data have been used by various 
## workers to estimate the attenuating affect of distance on ground acceleration.

attenu <- as.data.table(attenu)


## ultima linha 

attenu[.N]

## regressao

attenu[ , lm(formula = accel ~ dist + mag)]

