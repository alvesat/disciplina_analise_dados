# exercicio simulacao e sequencia

# seed fixa

seed_fixa <- addTaskCallback(function(...) {set.seed(419); T})

# call seed fixa

seed_fixa

# distribuicao normal

dist_normal <- rnorm(2000)

hist(dist_normal) #histograma da distribuicao normal

# distribuicao binomial

dist_bino <- rbinom(2000, 1, 0.5) #distribuicao binomial com 2000 casos e prop de 0.5

hist(dist_bino) #histograma da distribuicao binomial

# Index

index_sim <- seq(1, length(dist_bino))

hist(index_sim)

# Remover seed fixa

removeTaskCallback(seed_fixa)
