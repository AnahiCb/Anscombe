install.packages("caret")
install.packages("MASS")
library(caret)
library(MASS)

data(datasaurus_dozen)

# Filtra los datos para obtener solo el conjunto high_lines
high_lines_data <- datasaurus_dozen[datasaurus_dozen$dataset == "high_lines", ]

# Grafica la regresión lineal
ggplot(high_lines_data, aes(x=x, y=y)) +
  geom_point() +  # Grafica los puntos
  geom_smooth(method="lm", se=FALSE) +  # Agrega la línea de regresión lineal sin intervalos de confianza
  labs(title="Conjunto de datos High Lines", x="X", y="Y")  # Etiquetas del gráfico

high_lines_data <- subset(high_lines_data, select = -dataset)

# Ajustar el modelo de regresión lineal sin validación cruzada
lm_model <- lm(y ~ ., data = high_lines_data)

# Calcular la precisión del modelo (en este caso el R-cuadrado)
accuracy <- summary(lm_model)$r.squared
cat("El accuracy es: ")
print(accuracy)
