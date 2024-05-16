# Ajustar el modelo de regresión cuadrática
quadratic_model <- lm(y ~ poly(x, 2, raw=TRUE), data = high_lines_data)

# Calcular las predicciones del modelo
predictions <- predict(quadratic_model, newdata = high_lines_data)

# Calcular el R-cuadrado del modelo
accuracy <- summary(quadratic_model)$r.squared

# Graficar la regresión cuadrática
plot(high_lines_data$x, high_lines_data$y, pch=16, col="blue", xlab="X", ylab="Y", main="Regresión Cuadrática")
lines(sort(high_lines_data$x), predictions[order(high_lines_data$x)], col="red", lwd=2)

# Imprimir el accuracy
cat("El accuracy es:", accuracy, "\n")
