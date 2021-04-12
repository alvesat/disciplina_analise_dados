# Criação vetor simples

numeros_0_10 <- c(1:10)

# Criação Regressão
# reg com dados do banco 'iris'. VD 'Petal.Length'

reg_petalas <- lm(Petal.Length ~., iris) 
reg_petalas

#Natureza dos objetos
str(numeros_0_10)
str(reg_petalas)
