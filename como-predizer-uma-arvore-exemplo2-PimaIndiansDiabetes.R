# Carregar pacotes necessários
library(mlbench)
library(rpart)

# Carregar a base de dados PimaIndiansDiabetes
data(PimaIndiansDiabetes)

# Dividir a base em treinamento e teste
set.seed(123)  # Definir semente para reprodutibilidade
indices <- sample(1:nrow(PimaIndiansDiabetes), nrow(PimaIndiansDiabetes) * 0.7)  # 70% para treinamento
dados_treinamento <- PimaIndiansDiabetes[indices, ]
dados_teste <- PimaIndiansDiabetes[-indices, ]

# Treinar um modelo de árvore de decisão
modelo <- rpart(diabetes ~ ., data = dados_treinamento, method = "class")

# Fazer previsões usando o modelo treinado
previsoes <- predict(modelo, newdata = dados_teste, type = "prob")

# Selecionar as previsões para a classe positiva (diabetes)
previsoes_diabetes <- previsoes[, "1"]

# Visualizar as primeiras 10 previsões
head(previsoes_diabetes, 10)
