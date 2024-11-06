# Carica la libreria necessaria per leggere i file Excel
library(readxl)
# Carica il dataset 'happiness.xlsx' e visualizza un riassunto delle variabili
happy <- read_excel("happiness.xlsx")
summary(happy)

mean(happy$median_income)
mean(happy$happyScore)

sd(happy$median_income)
sd(happy$happyScore)

# Grafico della distribuzione del reddito mediano
library(ggplot2)
ggplot() +
  geom_histogram(data=happy, aes(median_income)) +
  labs(title = "Distribuzione del Reddito Mediano", x = "Reddito Mediano", y = "Frequenza")

# Grafico della distribuzione del punteggio di felicità
ggplot() +
  geom_histogram(data=happy, aes(happyScore)) +
  labs(title = "Distribuzione del Punteggio di Felicità", x = "Punteggio di Felicità", y = "Frequenza")

cov(happy$happyScore, happy$median_income)
cor(happy$happyScore, happy$median_income)

ggplot() +
  geom_point(data=happy, aes(happyScore, median_income)) +
  labs(title = "Relazione tra Felicità e Reddito Mediano", x = "Punteggio di Felicità", y = "Reddito Mediano")
