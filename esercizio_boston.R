# Caricamento delle librerie necessarie
library(ISLR2)
library(ggplot2)

# Caricamento del dataset Boston
data("Boston")

# Modello di regressione lineare semplice
lm.fit <- lm(medv ~ lstat, data = Boston)


# Istogramma della variabile lstat
ggplot(Boston, aes(x = lstat)) +
  geom_histogram(color = "black", fill = "skyblue", bins = 20) +
  labs(title = "Distribuzione del Livello di Povertà",
       x = "Livello di Povertà (lstat)",
       y = "Frequenza") +
  theme_minimal()

# Istogramma della variabile medv
ggplot(Boston, aes(x = medv)) +
  geom_histogram(color = "black", fill = "lightgreen", bins = 20) +
  labs(title = "Distribuzione del Valore Medio della Casa",
       x = "Valore Medio della Casa (medv)",
       y = "Frequenza") +
  theme_minimal()

# Calcolo della covarianza e della correlazione
cov(Boston$lstat, Boston$medv)
cor(Boston$lstat, Boston$medv)

lm.fit <- lm(medv ~ lstat, data = Boston)

# Visualizzazione del modello
summary(lm.fit)

# Grafico scatterplot con linea di regressione
ggplot(Boston, aes(x = lstat, y = medv)) +
  geom_point(color = "blue") +
  geom_abline(intercept = coef(lm.fit)[1], slope = coef(lm.fit)[2], color = "red") +
  labs(title = "Relazione tra Livello di Povertà e Valore Medio della Casa",
       x = "Livello di Povertà (lstat)",
       y = "Valore Medio della Casa (medv)") +
  theme_minimal()


predict(lm.fit, data.frame(lstat = (c(5, 10, 15))))

