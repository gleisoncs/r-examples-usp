# Carregar o pacote rpart
library(rpart)

data(PimaIndiansDiabetes)

# Criar um conjunto de dados de exemplo (iris dataset)
dados <- PimaIndiansDiabetes

# Criar o objeto de árvore de decisão
arvore <- rpart(diabetes ~ ., data = dados, method = "class")

# Plotar a árvore
rpart.plot(arvore, extra = 1, under = TRUE, cex = 0.8, box.palette = "GnBu")

# Ajustar hiperparâmetros
arvore_ajustada <- rpart(
  diabetes ~ .,
  data = dados,
  method = "class",
  control = rpart.control(
    cp = 0.01,    # Parâmetro de complexidade (complexity parameter)
    minsplit = 2, # Número mínimo de observações necessárias para dividir um nó
    minbucket = 1 # Número mínimo de observações em cada folha
  )
)

# Plotar a árvore ajustada
rpart.plot(arvore_ajustada, extra = 1, under = TRUE, cex = 0.8, box.palette = "GnBu")
