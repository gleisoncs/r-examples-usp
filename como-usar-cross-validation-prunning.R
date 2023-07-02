# Carregue o conjunto de dados Pima Indians Diabetes
data(PimaIndiansDiabetes)

# Divida o conjunto de dados em treinamento (70%) e teste (30%)
set.seed(123)
train_indices <- sample(1:nrow(PimaIndiansDiabetes), nrow(PimaIndiansDiabetes) * 0.7)
train_data <- PimaIndiansDiabetes[train_indices, ]
test_data <- PimaIndiansDiabetes[-train_indices, ]

# Treine uma árvore de decisão sem restrição
tree <- rpart(diabetes ~ ., data = train_data)

# Avalie o desempenho da árvore no conjunto de teste
pred <- predict(tree, newdata = test_data, type = "class")
accuracy <- sum(pred == test_data$diabetes) / nrow(test_data)
print(paste("Acurácia (antes da poda):", accuracy))

# Realize o cross-validation pruning
pruned_tree <- prune(tree, cp = tree$cptable[which.min(tree$cptable[, "xerror"]), "CP"])

# Avalie o desempenho da árvore podada no conjunto de teste
pred_pruned <- predict(pruned_tree, newdata = test_data, type = "class")
accuracy_pruned <- sum(pred_pruned == test_data$diabetes) / nrow(test_data)
print(paste("Acurácia (após a poda):", accuracy_pruned))
