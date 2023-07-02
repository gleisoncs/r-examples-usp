# Carregue o pacote "rpart"
library(tidyverse)
library(rpart)

# Carregue o conjunto de dados "Pima Indians Diabetes" (disponível no pacote "mlbench")
library(mlbench)
data(PimaIndiansDiabetes)

# Divida o conjunto de dados em variáveis de entrada (características) e variável de saída (variável-alvo)
x <- PimaIndiansDiabetes[, 1:8] # Variáveis de entrada
y <- PimaIndiansDiabetes[, 9]   # Variável de saída

# Crie o modelo de árvore de decisão usando a função "rpart"
modelo <- rpart(y ~ ., data = x)

# Visualize a árvore de decisão
plot(modelo, uniform = TRUE, main = "Árvore de Decisão - Base PimaIndiansDiabetes",
     sub = "Classificação da Positivo/Negativo", margin = 0.001)
text(modelo, use.n = TRUE, all = TRUE, cex = 0.8)

#Melhore a visualização do modelo
rpart.plot(modelo, extra = 1, under = TRUE, cex = 0.8, box.palette = "GnBu")


#Conferencia
head(PimaIndiansDiabetes)

dados_filtrados_pos <- PimaIndiansDiabetes %>% filter(diabetes == "pos")
dados_filtrados_neg <- PimaIndiansDiabetes %>% filter(diabetes == "neg")

# Visualizar os dados filtrados
quantidade_filtrados_pos <- nrow(dados_filtrados_pos)
quantidade_filtrados_neg <- nrow(dados_filtrados_neg)

print(quantidade_filtrados_pos)
print(quantidade_filtrados_neg)
print(quantidade_filtrados_pos + quantidade_filtrados_neg)

remove(dados_filtrados_pos)
remove(dados_filtrados_neg)
remove(quantidade_filtrados_pos)
remove(quantidade_filtrados_neg)

#Filtando os que não tiveram diabetes e com glicose < 128
dados_filtrados_neg_glu128 <- PimaIndiansDiabetes %>% filter(diabetes == "neg" & glucose < 128)
quantidade_dados_filtrados_neg_glu128 <- nrow(dados_filtrados_neg_glu128)
print(quantidade_dados_filtrados_neg_glu128)

remove(dados_filtrados_neg_glu128)
remove(quantidade_dados_filtrados_neg_glu128)

