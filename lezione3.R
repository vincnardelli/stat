## Domanda Ciarla

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



# import vendite negozi
library(readxl)
vendite_negozi <- read_excel("vendite_negozi.xlsx")

sum(vendite_negozi$Milano)
sum(vendite_negozi$Roma)

min(vendite_negozi$Roma)
max(vendite_negozi$Roma)

mean(vendite_negozi$Milano)
mean(vendite_negozi$Roma)

median(vendite_negozi$Milano)
median(vendite_negozi$Roma)

freq <- vendite_negozi %>%
  count(Milano) %>%  # Conta le occorrenze di ogni valore nella colonna 'Diritto_Privato'
  mutate(freq_rel = n / sum(n)) %>%  # Aggiunge una colonna con la frequenza relativa (n / totale)
  mutate(freq_per = n / sum(n) * 100) %>% 
  arrange(desc(n))

ggplot() +
  geom_histogram(data = vendite_negozi, aes(x = Milano))

ggplot() +
  geom_histogram(data = vendite_negozi, aes(x = Milano), bins = 10)

ggplot() +
  geom_histogram(data = vendite_negozi, aes(x = Milano), binwidth = 1)

ggplot() +
  geom_histogram(data = vendite_negozi, aes(x = Milano), binwidth = 10)

ggplot() +
  geom_histogram(data = vendite_negozi, aes(x = Milano), binwidth = 50) +
  scale_x_continuous(breaks=c(25, 75, 125, 175, 225))

quantile(vendite_negozi$Milano)
quantile(vendite_negozi$Milano, 0.25)

summary(vendite_negozi$Milano)
summary(vendite_negozi$Roma)


vendite_negozi %>%
  mutate(Milano = cut(Milano, breaks = 4)) %>% 
  count(Milano)
  
vendite_negozi %>%
  mutate(Milano = cut(Milano, breaks = c(69, 149, 173, 202, 299))) %>% 
  count(Milano)

ggplot() +
  geom_histogram(data = vendite_negozi, aes(x = Milano), breaks = c(69, 149, 173, 202, 299))

sd(vendite_negozi$Milano)
var(vendite_negozi$Milano)

sqrt(var(vendite_negozi$Milano))


IQR(vendite_negozi$Milano)

q1 = quantile(vendite_negozi$Milano,probs = 0.25)
q1
q3 = quantile(vendite_negozi$Milano,probs = 0.75)
q3
diff_inter = q3 - q1
diff_inter

sd(vendite_negozi$Roma)
sd(vendite_negozi$Milano)

sd(vendite_negozi$Milano)/mean(vendite_negozi$Milano)*100
sd(vendite_negozi$Roma)/mean(vendite_negozi$Roma)*100

