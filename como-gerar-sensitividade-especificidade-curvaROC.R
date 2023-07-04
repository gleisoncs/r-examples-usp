# Instale e carregue o pacote rpart
install.packages("rpart")
library(rpart)

# Carregue a base de dados Pima Indians Diabetes
library(mlbench)
data(PimaIndiansDiabetes)

#Calcular curva ROC
install.packages("pROC")
library(pROC)

# Divida os dados em conjunto de treinamento e teste
set.seed(123)
indices_treinamento <- sample(1:nrow(PimaIndiansDiabetes), nrow(PimaIndiansDiabetes) * 0.7)
dados_treinamento <- PimaIndiansDiabetes[indices_treinamento, ]
dados_teste <- PimaIndiansDiabetes[-indices_treinamento, ]

# Crie um modelo de árvore de decisão usando o algoritmo rpart
modelo <- rpart(diabetes ~ ., data = dados_treinamento, method = "class")

# Faça previsões no conjunto de teste
previsoes <- predict(modelo, dados_teste, type = "class")
#previsoes2 <- predict(modelo, dados_teste) #se não colocar o class ele traz a probabilidade de sim e não em valores

# Obtenha os rótulos verdadeiros do conjunto de teste
rotulos <- dados_teste$diabetes

# Calcule a matriz de confusão
confusion_matrix <- table(previsoes, rotulos)

# Calcule a acurácia #Acurácia: (TP + TN) / (TP + FP + FN + TN)
accuracy <- (confusion_matrix[1, 1] / sum(confusion_matrix[2, 2])) / nrow(dados_teste)
cat("Acurária:", accuracy, "\n")

# Calcule a sensibilidade (recall) #Sensibilidade (Recall): TP / (TP + FN)
sensibilidade <- confusion_matrix[2, 2] / sum(confusion_matrix[, 2])
cat("Sensibilidade (Recall):", sensibilidade, "\n")

# Calcule a especificidade #Especificidade: TN / (TN + FP)
especificidade <- confusion_matrix[1, 1] / sum(confusion_matrix[, 1])
cat("Especificidade:", especificidade, "\n")

# Calcule a precisão #Precisão: TP / (TP + FP)
precisao <- confusion_matrix[2, 2] / sum(confusion_matrix[2, ])
cat("Precisao:", precisao, "\n")

# Calcule as probabilidades de classe positiva para traçar a curva ROC
prob_positivo <- predict(modelo, newdata = dados_teste, type = "prob")[, 1]

# Calcule a curva ROC
roc_obj <- roc(rotulos, prob_positivo)

# Plote a curva ROC
plot(roc_obj, main = "Curva ROC")

# Plote a curva ROC com mais detalhes
plot(roc_obj, main = "Curva ROC", xlab = "Taxa de Falsos Positivos", ylab = "Taxa de Verdadeiros Positivos",
     print.auc = TRUE, print.auc.x = 0.5, print.auc.y = 0.3,
     auc.polygon = TRUE, max.auc.polygon = TRUE, grid = TRUE,
     col = "blue", lwd = 2)




