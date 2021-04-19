# criando data frame (parlamentares federais eleitos em PE 2018)

# vetor com o nome dos parlamentares

nome_parlamentar <- c("Andre de Paula", "Andre Ferreira", "Augusto Coutinho", 
                      "Daniel Coelho", "Danilo Cabral", "Eduardo da Fonte", 
                      "Felipe Carreras", "Fernando Filho", "Fernando Monteiro",
                      "Fernando Rodolfo", "Pastor Eurico", "Gonzaga Patriota",
                      "Joao Campos", "Carlos Veras", "Luciano Bivar", "Marilia Arraes",
                      "Bispo Ossessio", "Raul Henry", "Renildo Calheiros",
                      "Ricardo Teobaldo", "Sebastiao Oliveira", "Silvio Costa Filho",
                      "Tadeu Alencar", "Tulio Gadelha", "Wolney Queiroz")

# vetor com o partido dos parlamentares

partido_parlamentar <- c("PSD", "PSC", "SD", "PPS", "PSB", "PP", "PSB", "DEM", "PP",
                         "PHS", "PATRIOTA", "PSB", "PSB", "PT", "PSL", "PT", "PRB",
                         "MDB", "PCdoB", "PODEMOS", "PR", "PRB", "PSB", "PDT", "PDT")

# vetor com a idade dos parlamentares na posse (01/2019)

Idade_posse <- c(57, 46, 56, 40, 51, 46, 43, 34, 42, 35, 57, 72, 25, 37, 74, 34, 64,
                 54, 59, 53, 50, 36, 55, 31, 46)

# dataframe com base nos vetores

parlamentares_pe <- data.frame(nome_parlamentar, partido_parlamentar, Idade_posse)
