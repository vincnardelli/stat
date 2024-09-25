# Lezione precedente --
# Domande e mostrare file
# Import dataset


# Excel
library(readxl)
esercizio_1 <- read_excel("esercizio_1.xlsx")


# CSV
esercizio_1 <- read.csv("esercizio_1.csv")



library(dplyr)
esercizio_1 %>%
  count(Diritto_Privato) %>%
  mutate(freq_rel = n / sum(n)) %>%
  mutate(freq_perc = round(n / sum(n) * 100, 2)) %>%
  mutate(freq_cum = cumsum(n / sum(n) * 100))


library(ggplot2)
ggplot(esercizio_1, aes(x = Diritto_Privato)) +
  geom_histogram(binwidth = 1) +
  scale_x_continuous(breaks=10:30)

esercizio_1 %>%
  mutate(Diritto_Privato = cut(Diritto_Privato, breaks = 4)) %>%
  count(Diritto_Privato) %>%
  mutate(percentage = round(n / sum(n) * 100, 2))  %>%
  mutate(freq_cum = cumsum(n / sum(n) * 100))

esercizio_1 %>%
  mutate(Diritto_Privato = cut(Diritto_Privato, breaks = c(17, 24, 28, 30))) %>%
  count(Diritto_Privato) %>%
  mutate(percentage = round(n / sum(n) * 100, 2))  %>%
  mutate(freq_cum = cumsum(n / sum(n) * 100))

ggplot(esercizio_1, aes(x = Diritto_Privato)) +
  geom_histogram(breaks = c(17, 24, 28, 30)) +
  scale_x_continuous(breaks=10:30)


summary(esercizio_1$Diritto_Privato)
#Calcola la media dei voti per colonna

# Min - max

# Mediana


vettore <- c(132, 2, 8, 98, 34)

mean(vettore)
sum(vettore)/5

sort(vettore)[3]
median(vettore)

vettore <- c(132, 2, 8, 98, 34, 78)
(sort(vettore)[3] + sort(vettore)[4])/2
median(vettore)

quantile(vettore, 0.25)
quantile(vettore, 0.5)
quantile(vettore, 0.75)

summary(esercizio_1$Diritto_Privato)

