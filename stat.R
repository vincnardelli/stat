# Carica il pacchetto necessario
library(ggplot2)

# --------------------------------------------------------------------------------
# 1. T-test con varianza non nota (unpaired)
# --------------------------------------------------------------------------------
# Scenario aziendale: Confronto delle vendite medie tra due regioni

# Dati simulati: vendite settimanali in due regioni
set.seed(123)
region1_sales <- rnorm(100, mean = 5000, sd = 800)  # Vendite Regione 1
region2_sales <- rnorm(100, mean = 5500, sd = 900)  # Vendite Regione 2

# t-test unpaired
t_test_sales <- t.test(region1_sales, region2_sales, paired = FALSE)
print(t_test_sales)

# Dataset
sales_data <- data.frame(
  Region1 = region1_sales,
  Region2 = region2_sales
)

# Grafico
ggplot() +
  geom_histogram(aes(x = sales_data$Region1), fill = "blue", alpha = 0.6) +
  geom_histogram(aes(x = sales_data$Region2), fill = "green", alpha = 0.6) +
  labs(title = "Istogramma delle vendite per regione", x = "Vendite", y = "Frequenza") +
  theme_minimal()

ggplot() +
  geom_boxplot(aes(x = factor(1), y = sales_data$Region1, fill = "Regione 1"), alpha = 0.6) +
  geom_boxplot(aes(x = factor(2), y = sales_data$Region2, fill = "Regione 2"), alpha = 0.6) +
  scale_x_discrete(labels = c("Regione 1", "Regione 2")) +
  labs(title = "Boxplot delle vendite per regione", x = "Regione", y = "Vendite") +
  theme_minimal()

# Descrizione:
# - **Istogramma**: Visualizza la distribuzione delle vendite per ciascuna regione.
# - **Boxplot**: Mostra la mediana, la variabilità e i valori atipici per ciascuna regione.

# --------------------------------------------------------------------------------
# 2. T-test per due popolazioni non matched (unpaired)
# --------------------------------------------------------------------------------
# Scenario aziendale: Confronto del tempo medio di completamento di due team

# Dati simulati: tempi di completamento in minuti per due team
set.seed(456)
teamA_times <- rnorm(250, mean = 40, sd = 5)  # Team A
teamB_times <- rnorm(250, mean = 45, sd = 6)  # Team B

# t-test non paired
t_test_times <- t.test(teamA_times, teamB_times, paired = FALSE)
print(t_test_times)

# Dataset
times_data <- data.frame(
  TeamA = teamA_times,
  TeamB = teamB_times
)

# Grafico
ggplot() +
  geom_histogram(aes(x = times_data$TeamA), fill = "blue", alpha = 0.6, bins = 10) +
  geom_histogram(aes(x = times_data$TeamB), fill = "green", alpha = 0.6, bins = 10) +
  labs(title = "Istogramma dei tempi per team", x = "Tempi", y = "Frequenza") +
  theme_minimal()

ggplot() +
  geom_boxplot(aes(x = factor(1), y = times_data$TeamA, fill = "Team A"), alpha = 0.6) +
  geom_boxplot(aes(x = factor(2), y = times_data$TeamB, fill = "Team B"), alpha = 0.6) +
  scale_x_discrete(labels = c("Team A", "Team B")) +
  labs(title = "Boxplot dei tempi per team", x = "Team", y = "Tempi") +
  theme_minimal()

# Descrizione:
# - **Istogramma**: Visualizza la distribuzione dei tempi medi di completamento per ciascun team.
# - **Boxplot**: Mostra la mediana e la variabilità dei tempi per ciascun team.

# --------------------------------------------------------------------------------
# 3. T-test per due popolazioni matched (paired)
# --------------------------------------------------------------------------------
# Scenario aziendale: Confronto delle vendite prima e dopo una campagna di marketing

# Dati simulati: vendite prima e dopo la campagna
set.seed(789)
sales_before <- rnorm(50, mean = 10000, sd = 1200)  # Prima della campagna
sales_after <- rnorm(50, mean = 12000, sd = 1300)   # Dopo la campagna

# t-test paired
t_test_campaign <- t.test(sales_before, sales_after, paired = TRUE)
print(t_test_campaign)

# Dataset
campaign_data <- data.frame(
  Before = sales_before,
  After = sales_after
)

# Grafico
ggplot() +
  geom_histogram(aes(x = campaign_data$Before), fill = "blue", alpha = 0.6, bins = 10) +
  geom_histogram(aes(x = campaign_data$After), fill = "green", alpha = 0.6, bins = 10) +
  labs(title = "Istogramma delle vendite prima e dopo la campagna", x = "Vendite", y = "Frequenza") +
  theme_minimal()

ggplot() +
  geom_boxplot(aes(x = factor(1), y = campaign_data$Before, fill = "Before"), alpha = 0.6) +
  geom_boxplot(aes(x = factor(2), y = campaign_data$After, fill = "After"), alpha = 0.6) +
  scale_x_discrete(labels = c("Prima", "Dopo")) +
  labs(title = "Boxplot delle vendite prima e dopo la campagna", x = "Periodo", y = "Vendite") +
  theme_minimal()

# Descrizione:
# - **Istogramma**: Mostra la distribuzione delle vendite prima e dopo la campagna.
# - **Boxplot**: Confronta la mediana e la variabilità delle vendite nei due periodi.
