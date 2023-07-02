# Carregue o pacote "rpart"
library(rpart)

# Carregue a base de dados "Pima Indians Diabetes" (disponível no pacote "mlbench")
library(mlbench)
data(PimaIndiansDiabetes)

# Divida o conjunto de dados em variáveis de entrada (características) e variável de saída (variável-alvo)
x <- PimaIndiansDiabetes[, 1:8] # Variáveis de entrada
y <- PimaIndiansDiabetes[, 9]   # Variável de saída

# Crie o modelo de árvore de decisão usando a função "rpart"
modelo <- rpart(y ~ ., data = x)

# Aplicar o modelo para fazer previsões em novos dados (usando os próprios dados de treinamento como exemplo)
previsoes <- predict(modelo, x)

# Exibir as previsões
print(previsoes)


library(rpart.plot)

# Plotar a árvore de decisão
rpart.plot(modelo, extra = 1, under = TRUE, cex = 0.8, box.palette = "GnBu")
