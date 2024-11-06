library(ISLR2)
library(ggplot2)

data("Carseats")
summary(Carseats$Sales)
summary(Carseats$Price)

# Creiamo un grafico a dispersione (scatter plot) usando ggplot2
ggplot(data=Carseats) +
  geom_point(aes(Price, Sales))

# Creiamo un modello di regressione lineare semplice per predire y in base a x
modello <- lm(Sales ~ Price, data=Carseats)

# Visualizziamo il sommario del modello di regressione
summary(modello)

# Estraiamo i coefficienti del modello
modello$coefficients
coefficients(modello)

# Creiamo di nuovo il grafico a dispersione aggiungendo la linea di regressione
ggplot(data=Carseats) +
  geom_point(aes(Price, Sales)) +
  geom_abline(intercept = modello$coefficients[1], slope=modello$coefficients[2])

# Prediciamo i valori di y usando il modello di regressione
y_pred <- predict(modello)

# Aggiungiamo i valori predetti al data frame
Carseats$y_pred <- y_pred

# Conviene aumentare il prezzo da 100 a 150?
(coefficients(modello)[1] + coefficients(modello)[2] * 100) * 100
(coefficients(modello)[1] + coefficients(modello)[2] * 150) * 150

# Conviene aumentare il prezzo da 150 a 200?
(coefficients(modello)[1] + coefficients(modello)[2] * 150) * 150
(coefficients(modello)[1] + coefficients(modello)[2] * 200) * 200
