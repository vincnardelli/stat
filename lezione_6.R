## Probabilità
#1
p = 0.8
p*(1-p)


#2
n <- 10   # numero di prove
p <- 0.05 # probabilità di successo
k <- 2    # numero esatto di successi

dbinom(k, n, p)


n*p # Valore atteso
n * p * (1 - p) # Varianza


#3
lambda <- 30  # numero medio di prenotazioni
k <- 25       # numero esatto di prenotazioni

dpois(k, lambda)


lambda <- 50  # numero medio di chiamate all'ora
k <- 45       # numero esatto di chiamate

# Calcolo della probabilità
dpois(k, lambda)




# mean

mean(c(12,6,7,3,15,10,18,5))

median(c(84, 91, 72, 68, 87, 78))


# distribuzione di frequenza

library(ISLR2)
library(ggplot2)
library(dplyr)
data(Bikeshare)

Bikeshare %>% 
  count(weathersit) %>% 
  mutate(freq_rel = n/sum(n))

# mean and variance
mean(Bikeshare$bikers)
var(Bikeshare$bikers)

#. IQR
IQR(Bikeshare$bikers)
quantile(Bikeshare$bikers, 0.75) - quantile(Bikeshare$bikers, 0.25)

max(Bikeshare$bikers)-min(Bikeshare$bikers)


#skrewness
data(College)
library(moments)
skewness(College$Apps)

ggplot(College) +
  geom_histogram(aes(x=Apps))

ggplot(College) +
  geom_boxplot(aes(x=Enroll))

ggplot(College) +
  geom_boxplot(aes(x=Enroll, y=Private))


# Correlazione
cor(College$Apps, College$Enroll)

ggplot(College) +
  geom_point(aes(x=Apps, y=Enroll))



# Modello
data(mtcars)
modello <- lm(mpg ~ wt, data = mtcars)
summary(modello)
# attenzione a non invertire le variabili!!!!


data(mtcars)
modello <- lm(mpg ~ hp, data = mtcars)
summary(modello)
