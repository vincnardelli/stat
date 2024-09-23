3 + 5
12/7

result <- 3 + 5
result = 3 + 5

x <- result * 3.1415

x
print(x)

nome_molto_lungo
nome.molto.lungo


vettore <- c(1, 3, 8, 13)
vettore


vettore[1]
vettore[4]

vettore[1:3]
vettore[c(1, 2, 3)]

vettore[c(1, 3)]

vettore > 3
vettore[vettore > 3]

vettore == 3
vettore[vettore == 3]

vettore != 3
vettore[vettore != 3]

# commento
stringa <- "questo è un testo"



numero1 <- 3
numero2 <- "3"

numero1 == numero2

class(numero1)
class(numero2)
class(stringa)
a <- c(1, 2, 5)
c(3, a)

sum(a)
mean(a)
min(a)
max(a)


## Esempio con nomi e numeri preferiti

nomi <- c("a", "b", "c", "d")
numeri <- c(3, 6, 8, 9)

nomi[numeri > 8]


# Agg mese di nascita
## Data Frame

data <- data.frame(nomi = nomi, 
           numeri = numeri)

data

class(data)
str(data)
dim(data)

View(data)

data$nomi
data$numeri



# Caricare dati

# Da pacchetto R
data("mtcars")
?mtcars

data("USPersonalExpenditure")
?USPersonalExpenditure

# Da un nuovo pacchetto R
library(ISLR)
data("Hitters")
str(Hitters)

data("Smarket")
summary(Smarket)
str(Smarket)

mean(Smarket$Today)

min(Smarket$Today)
max(Smarket$Today)


median(Smarket$Today)
summary(Smarket$Today)

# Carico dati da Excel
library(readxl)
esercizio_1 <- read_excel("esercizio_1.xlsx")
View(esercizio_1)


esercizio_1 <- read.csv("esercizio_1.csv")


# calcoliamo la media
voti <- esercizio_1
(voti$Economia_Aziendale + voti$Matematica_Generale + voti$Informatica)/3

# calcoliamo la media ponderata?


