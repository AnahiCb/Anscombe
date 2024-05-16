# Ajustar el modelo de regresión polinomial
degree <- 4 # Grado del polinomio
poly_model <- lm(y ~ poly(x, degree), data = high_lines_data)

# Calcular las predicciones del modelo
predictions <- predict(poly_model, newdata = high_lines_data)

# Calcular el R-cuadrado del modelo
accuracy <- summary(poly_model)$r.squared

# Graficar la regresión polinomial
plot(high_lines_data$x, high_lines_data$y, pch=16, col="blue", xlab="X", ylab="Y", main="Regresión Polinomial")
lines(sort(high_lines_data$x), predictions[order(high_lines_data$x)], col="red", lwd=2)

# Imprimir el accuracy
cat("El accuracy es:", accuracy, "\n")
