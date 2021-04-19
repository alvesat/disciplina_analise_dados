# exercicio bootstrapping

# seed fixa

seed_fixa <- addTaskCallback(function(...) {set.seed(433); T})


# criando uma dist normal com 3000 casos

normal_dist <- rnorm(3000)

# bootstrapping

boot_normal_100 <- replicate(100, sample(normal_dist, 100, replace = T)) #amostra replicada 100 vezes

# media com bootstrapping

media_boot_10 <- replicate(10, mean(sample(normal_dist, 10, replace = T)))
media_boot_50 <- replicate(50, mean(sample(normal_dist, 50, replace = T)))
media_boot_70 <- replicate(70, mean(sample(normal_dist, 70, replace = T)))

mean(media_boot_10)
mean(media_boot_50)
mean(media_boot_70)
mean(boot_normal_100)     
