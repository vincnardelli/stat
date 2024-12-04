library(readxl)
library(caret)  # Per la valutazione dei modelli e le matrici di confusione
library(ggplot2)  # Per la visualizzazione dei dati

bank <- read_xlsx("bank.xlsx")

# Modello di regressione logistica: sottoscrizione in funzione della durata della chiamata
glm_duration <- glm(y ~ duration, data = bank, family = binomial)
summary(glm_duration)  # Statistiche del modello

# Coefficienti in log-odds
coefficients(glm_duration)

# Odds ratio (esponenziale dei coefficienti)
exp(coefficients(glm_duration))

# Interpretazione degli odds ratio (percentuale di variazione)
(exp(coefficients(glm_duration)) - 1)

# Predizione della probabilità per diverse durate di chiamata
new_duration_data <- data.frame(duration = c(50, 100, 200, 400))
predict(glm_duration, newdata = new_duration_data, type = "response")


# Modello multivariato: sottoscrizione in funzione di più variabili
glm_full <- glm(y ~ duration + housing + loan, data = bank, family = binomial)
summary(glm_full)

# Coefficienti del modello multivariato
coefficients(glm_full)

# Odds ratio per il modello multivariato
exp(coefficients(glm_full))

# Interpretazione in termini percentuali
(exp(coefficients(glm_full)) - 1) * 100

# Predizione multivariata per nuovi dati
new_data <- data.frame(
  duration = c(120, 300, 600),  # Durata della chiamata in secondi
  housing = c("yes", "no", "yes"),  # Possesso di un mutuo sulla casa
  loan = c("no", "yes", "no")  # Presenza di un prestito personale
)
predict(glm_full, newdata = new_data, type = "response")

# Calcolo delle probabilità per tutte le osservazioni nel dataset
predicted_prob_all <- predict(glm_full, type = "response")

# Soglia di classificazione predefinita (0.5)
threshold <- 0.5
predicted_class <- factor(ifelse(predicted_prob_all > threshold, "1", "0"))

# Matrice di confusione per la soglia 0.5
confusionMatrix(predicted_class, factor(bank$y), positive = "1")

# Soglia di classificazione più bassa (0.2) per migliorare la sensibilità
threshold_2 <- 0.2
predicted_class_2 <- factor(ifelse(predicted_prob_all > threshold_2, "1", "0"))
confusionMatrix(predicted_class_2, factor(bank$y), positive = "1")

# Soglia di classificazione più alta (0.8) per migliorare la specificità
threshold_3 <- 0.8
predicted_class_3 <- factor(ifelse(predicted_prob_all > threshold_3, "1", "0"))
confusionMatrix(predicted_class_3, factor(bank$y), positive = "1")

