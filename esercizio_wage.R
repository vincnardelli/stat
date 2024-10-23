# Carica i pacchetti necessari
library(ISLR)
library(dplyr)
library(ggplot2)

# Carica il dataset Wage
data("Wage")

# Istogrammi per la distribuzione di wage e age
ggplot(Wage) +
  geom_histogram(aes(x = wage), bins = 30, fill = "lightblue", color = "black") +
  labs(title = "Distribuzione del Salario", x = "Salario ($)", y = "Frequenza")

ggplot(Wage) +
  geom_histogram(aes(x = age), bins = 30, fill = "lightgreen", color = "black") +
  labs(title = "Distribuzione dell'Età", x = "Età", y = "Frequenza")

# Riassunto delle variabili wage e age
summary(Wage$wage)
summary(Wage$age)

# Tabella di frequenza per la variabile education
Wage %>%
  count(education) %>%
  mutate(freq_rel = n / sum(n)) %>%
  mutate(freq_perc = round(freq_rel * 100, 2)) %>%
  mutate(freq_cum = cumsum(freq_perc))

# Boxplot per la distribuzione del salario in base al livello di istruzione
ggplot(Wage, aes(x = factor(education), y = wage)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "Distribuzione del Salario per Livello di Istruzione", x = "Livello di Istruzione", y = "Salario ($)")

# Tabella di frequenza per la variabile jobclass
Wage %>%
  count(jobclass) %>%
  mutate(freq_rel = n / sum(n)) %>%
  mutate(freq_perc = round(freq_rel * 100, 2)) %>%
  mutate(freq_cum = cumsum(freq_perc))

# Boxplot per la distribuzione del salario in base alla jobclass
ggplot(Wage, aes(x = factor(jobclass), y = wage)) +
  geom_boxplot(fill = "coral", color = "black") +
  labs(title = "Distribuzione del Salario per Job Class", x = "Job Class", y = "Salario ($)")

# Scatter plot e correlazione tra wage e age
ggplot(Wage, aes(x = age, y = wage)) +
  geom_point(color = "darkblue") +
  labs(title = "Relazione tra Età e Salario", x = "Età", y = "Salario ($)")

cor(Wage$age, Wage$wage)

modello <- lm(wage ~ age, data=Wage)
summary(modello)
coefficients(modello)
