# Caricamento dei pacchetti necessari
library(ISLR2)  # Pacchetto contenente il dataset Default
library(caret)  # Per il calcolo delle matrici di confusione e altre analisi
library(ggplot2)  # Per la creazione di grafici

# Dataset: Default
data("Default")  # Carica il dataset Default incluso in ISLR2

# Esplorazione dei dati
head(Default)  # Visualizza le prime righe del dataset
str(Default)  # Mostra la struttura del dataset, incluse le variabili e i loro tipi

# Scatter plot: rapporto tra bilancio e default
ggplot() +
  geom_point(data = Default, aes(x = balance, y = default))

# Boxplot per visualizzare la distribuzione di default rispetto al bilancio
ggplot(data = Default, aes(y = default, x = balance)) +
  geom_boxplot()

# Boxplot con differenziazione dei colori per il default
ggplot(data = Default, aes(y = default, x = balance, fill = default)) +
  geom_boxplot()

# Scatter plot tra bilancio e reddito, colorato per il default
ggplot() +
  geom_point(data = Default, aes(x = balance, y = income, color = default))

# Livelli della variabile 'default' (si/no)
levels(Default$default)

# Modello 1: Regressione logistica con 'balance' come predittore
glm_balance <- glm(default ~ balance, data = Default, family = binomial)
summary(glm_balance)  # Statistiche riassuntive del modello

# Coefficienti del modello in log-odds
coefficients(glm_balance)

# Conversione in odds (esponenziale dei coefficienti)
exp(coefficients(glm_balance))

# Interpretazione degli odds (percentuale di variazione)
exp(coefficients(glm_balance)) - 1

# Predizioni: calcolo delle probabilità per balance = 0, 1000, e 2000
new_data <- data.frame(balance = c(0, 1000, 2000))

# Log-odds per le osservazioni
log_odds <- predict(glm_balance, newdata = new_data)
log_odds

# Odds (esponenziale delle log-odds)
odds <- exp(log_odds)
odds

# Calcolo delle probabilità da odds
odds / (1 + odds)

# Predizioni di probabilità direttamente dal modello
predicted_prob <- predict(glm_balance, newdata = new_data, type = "response")
predicted_prob

# Soglia di classificazione predefinita (0.5)
threshold <- 0.5

# Probabilità previste per tutte le osservazioni
predicted_prob_all <- predict(glm_balance, type = "response")

# Conversione in classi binarie
predicted_class <- factor(ifelse(predicted_prob_all > threshold, "Yes", "No"))

# Matrice di confusione per valutare le prestazioni del modello
confusionMatrix(predicted_class, Default$default, positive = "Yes")

# Soglia 0.5: Matrice di confusione
threshold_1 <- 0.5
predicted_class_1 <- factor(ifelse(predicted_prob_all > threshold_1, "Yes", "No"))
confusionMatrix(predicted_class_1, Default$default, positive = "Yes")

# Soglia 0.2: Maggiore sensibilità
threshold_2 <- 0.2
predicted_class_2 <- factor(ifelse(predicted_prob_all > threshold_2, "Yes", "No"))
confusionMatrix(predicted_class_2, Default$default, positive = "Yes")

# Soglia 0.8: Maggiore specificità
threshold_3 <- 0.8
predicted_class_3 <- factor(ifelse(predicted_prob_all > threshold_3, "Yes", "No"))
confusionMatrix(predicted_class_3, Default$default, positive = "Yes")
