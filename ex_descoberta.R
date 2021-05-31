## exercicio descoberta

library(splitstackshape)
library(reshape2)
library(readxl)
library(funModeling)

# abrindo dados suic mun e invertendo base

suic_mun <- read_excel("C:/Users/55879/OneDrive - Universidade Federal de Pernambuco/Consult/Isabel/Dados Tratados/SUIC_MUN_1996_19.xlsx")

suic <- melt(suic_mun, measure.vars = c("1996","1997","1998","1999","2000","2001","2002",
                                        "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010",
                                        "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019"))

suic$suicidios <- suic$value
suic$value <- NULL

##

glimpse(suic)

status(suic)

freq(suic)

plot_num(suic)

profiling_num(suic)
