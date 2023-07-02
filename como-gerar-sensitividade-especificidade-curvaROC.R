# Instale e carregue as bibliotecas pROC e caret
install.packages("pROC")
install.packages("caret")
library(pROC)
library(caret)
library(rpart)
library(tidyverse)

# Carregue a base de dados Pima Indians Diabetes
data(PimaIndiansDiabetes)

# Divida os dados em conjunto de treinamento e teste
set.seed(123)
indices_treinamento <- createDataPartition(PimaIndiansDiabetes$diabetes, p = 0.7, list = FALSE)
dados_treinamento <- PimaIndiansDiabetes[indices_treinamento, ]
dados_teste <- PimaIndiansDiabetes[-indices_treinamento, ]

# Treine um modelo de classificação (por exemplo, Regressão Logística)
modelo <- train(diabetes ~ ., data = dados_treinamento, method = "glm")

# Faça previsões no conjunto de teste
previsoes <- predict(modelo, newdata = dados_teste, type = "raw")

# Obtenha os rótulos verdadeiros do conjunto de teste
rotulos <- dados_teste$diabetes

# Calcule a sensibilidade (recall)
sensibilidade <- confusionMatrix(previsoes, rotulos)$byClass["Sensitivity"]
cat("Sensibilidade (Recall):", sensibilidade, "\n")

# Calcule a especificidade
especificidade <- confusionMatrix(previsoes, rotulos)$byClass["Specificity"]
cat("Especificidade:", especificidade, "\n")

# Calcule a curva ROC
roc_obj <- roc(rotulos, previsoes)

# Plote a curva ROC
plot(roc_obj, main = "Curva ROC")
