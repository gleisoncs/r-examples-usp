# Passo 1: Instale e carregue o pacote "rpart"
install.packages("rpart")
library(rpart)

# Passo 2: Carregue o conjunto de dados "iris"
data(iris)

# Passo 3: Divida o conjunto de dados em variáveis de entrada (características) e variável de saída (variável-alvo)
x <- iris[, 1:4] # Variáveis de entrada
y <- iris[, 5]   # Variável de saída

# Passo 4: Crie o modelo de árvore de decisão usando a função "rpart"
modelo <- rpart(y ~ ., data = data.frame(x))

# Passo 5: Visualize a árvore de decisão
plot(modelo)
text(modelo)

plot(modelo, uniform = TRUE, main = "Árvore de Decisão - Base Iris",
     sub = "Classificação da Espécie de Iris", margin = 0.5)
text(modelo, use.n = TRUE, all = TRUE, cex = 0.8)

