# Carregar bibliotecas necessárias
library(tidyverse) # Inclui ggplot2, dplyr, entre outros

# Suponha que temos um conjunto de dados chamado 'vendas_data'
# Aqui vamos criar um conjunto de dados fictício para o exemplo
set.seed(123)
vendas_data <- data.frame(
  vendas = rnorm(100, mean = 500, sd = 100),
  tv = rnorm(100, mean = 100, sd = 20),
  radio = rnorm(100, mean = 50, sd = 15),
  jornal = rnorm(100, mean = 75, sd = 25)
)

# Verificar as primeiras linhas do conjunto de dados
head(vendas_data)

# Criar um modelo de regressão linear múltipla
modelo_vendas <- lm(vendas ~ tv + radio + jornal, data = vendas_data)

# Resumo do modelo
summary(modelo_vendas)

# Análise de Variância (ANOVA)
anova(modelo_vendas)

# Diagnósticos do modelo
# Resíduos vs Valores Ajustados
plot(modelo_vendas, which = 1)

# Normalidade dos resíduos (QQ-plot)
plot(modelo_vendas, which = 2)

# Escala-Localização
plot(modelo_vendas, which = 3)

# Resíduos vs Alavancagem
plot(modelo_vendas, which = 5)

# Gráfico dos resíduos para verificar padrões
ggplot(vendas_data, aes(x = vendas, y = residuals(modelo_vendas))) +
  geom_point() +
  labs(title = "Resíduos vs Valores Observados de Vendas",
       x = "Vendas Observadas", y = "Resíduos")

# Previsões
novos_dados <- data.frame(
  tv = c(100, 120),
  radio = c(50, 60),
  jornal = c(75, 85)
)

previsoes <- predict(modelo_vendas, newdata = novos_dados)

# Mostrar previsões
print(previsoes)

# Salvar o modelo para uso futuro
saveRDS(modelo_vendas, "modelo_vendas.rds")

# Carregar um modelo salvo (caso necessário)
# modelo_vendas <- readRDS("modelo_vendas.rds")
