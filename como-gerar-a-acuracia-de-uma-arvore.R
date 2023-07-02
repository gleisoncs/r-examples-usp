library(rpart)
library(mlbench)

data(PimaIndiansDiabetes)

# Divida o conjunto de dados em variáveis de entrada (características) e variável de saída (variável-alvo)
x <- PimaIndiansDiabetes[, 1:8] # Variáveis de entrada
y <- PimaIndiansDiabetes[, 9]   # Variável de saída

# Crie o modelo de árvore de decisão usando a função "rpart"
modelo <- rpart(y ~ ., data = data.frame(x))

prob = predict(modelo, PimaIndiansDiabetes) #o que ele faz por trás do predict??

class = prob[,2]>.5
tab <- table(class, y)
tab

acc <- (tab[1,1] + tab[2,2]) / sum(tab)
acc
