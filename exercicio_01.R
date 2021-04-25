# exercicio 1

# criando vetores com as exigencias do exercicio



variavel_distri_normal_1 <- rnorm(500, sd = 2) #variavel distribuicao normal, dp = 1
variavel_distri_normal_2 <- rnorm(500, sd = 1) #variavel distribuicao nomral, dp = 2

variavel_poisson <- rpois(500, 3) # variavel poisson
variavel_bin_neg <- rnbinom(500, 500, 0.7) # variavel binomial negativa

bin <- 0:1 #vetor binario (0,1)
variavel_bin <- rbinom(500, bin, 0.7) #variavel binomial (0,1) 70% 

variavel_quali <- c("É zero", "É um") #vetor quali [char] 

data_set <- data.frame(variavel_distri_normal_1, variavel_distri_normal_2, variavel_poisson, variavel_bin_neg,
                       variavel_bin) #dataframe criado 

data_set$variavel_quali <- ifelse(data_set$variavel_bin == 0, variavel_quali[1], variavel_quali[2] ) #variavel
#qualitativa com indexação

index <- c(sample(1:4, 900, replace = T))

data_set$variavel_index <- index[1:500] #variavel criada utilizando index


# criando funcao p/ centralizacao

centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
}

# centralizando as variaveis distr normal

data_set$variavel_distri_normal_1 <- centralizacao(data_set$variavel_distri_normal_1)
data_set$variavel_distri_normal_2 <- centralizacao(data_set$variavel_distri_normal_2)

# trocando 0 por 1 nas variaveis de contagem

data_set$variavel_bin <- ifelse(data_set$variavel_bin == 1, 0, 1)

# criando novo data frame (n=100)

novo_data_frame <- data_set[sample(nrow(data_set), 100), ]
