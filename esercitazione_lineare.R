# Definiamo due vettori x e y con i valori numerici
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 5, 4, 5)

# Creiamo un data frame a partire dai vettori x e y
data <- data.frame(x = x, y = y)

# Creiamo un grafico a dispersione (scatter plot) usando ggplot2
ggplot(data=data) +
  geom_point(aes(x, y))

# Creiamo un modello di regressione lineare semplice per predire y in base a x
modello <- lm(y ~ x, data=data)

# Visualizziamo il sommario del modello di regressione
summary(modello)

# Estraiamo i coefficienti del modello
modello$coefficients
coefficients(modello)

# Creiamo di nuovo il grafico a dispersione aggiungendo la linea di regressione
ggplot(data=data) +
  geom_point(aes(x, y)) +
  geom_abline(intercept = modello$coefficients[1], slope=modello$coefficients[2])

# Prediciamo i valori di y usando il modello di regressione
y_pred <- predict(modello)

# Aggiungiamo i valori predetti al data frame
data$y_pred <- y_pred

# Creiamo il grafico a dispersione con la linea di regressione e i valori predetti in rosso
ggplot(data=data) +
  geom_point(aes(x, y)) +
  geom_abline(intercept = modello$coefficients[1], slope=modello$coefficients[2]) +
  geom_point(aes(x, y_pred), color="red")

# Ricontrolliamo il sommario del modello
summary(modello)

# Installiamo il pacchetto 'Ecdat' e carichiamo i dati 'Cigarette'
install.packages("Ecdat")
library(Ecdat)
library(dplyr)
data("Cigarette")
head(Cigarette)

# Creiamo un istogramma per il prezzo medio delle sigarette
ggplot(Cigarette, aes(x = avgprs)) +
  geom_histogram(fill = "red")

# Creiamo un istogramma per il consumo medio di pacchetti per capita
ggplot(Cigarette, aes(x = packpc)) +
  geom_histogram(fill = "red")


# Creiamo un grafico a dispersione per visualizzare la relazione tra prezzo medio e consumo di sigarette
ggplot(Cigarette, aes(x = avgprs, y = packpc)) +
  geom_point(color = "red") +
  labs(title = "Relazione tra Prezzo Medio e Consumo di Sigarette", x = "Prezzo Medio ($)", y = "Consumo (Pacchetti pro capite)")

# Calcoliamo la covarianza e la correlazione tra prezzo medio e consumo di sigarette
cov(Cigarette$avgprs, Cigarette$packpc)
cor(Cigarette$avgprs, Cigarette$packpc)

# Creiamo un grafico a dispersione per visualizzare la relazione tra tassazione totale e consumo di sigarette
ggplot(Cigarette, aes(x = taxs, y = packpc)) +
  geom_point(color = "purple") +
  labs(title = "Relazione tra Tassazione Totale e Consumo di Sigarette", x = "Tassazione Totale ($)", y = "Consumo (Pacchetti pro capite)")

# Calcoliamo la correlazione tra tassazione totale e consumo di sigarette
cor(Cigarette$taxs, Cigarette$packpc)

# Creiamo un modello di regressione lineare per predire il consumo di sigarette in base alla tassazione totale
model <- lm(packpc ~ taxs, data=Cigarette)
model
summary(model)

# Creiamo il grafico a dispersione con la linea di regressione
ggplot(Cigarette, aes(x = taxs, y = packpc)) +
  geom_point(color = "purple") +
  geom_abline(intercept = coefficients(model)[1], slope=coefficients(model)[2]) +
  labs(title = "Relazione tra Tassazione Totale e Consumo di Sigarette", x = "Tassazione Totale ($)", y = "Consumo (Pacchetti pro capite)")

# Visualizziamo il sommario della variabile 'taxs'
summary(Cigarette$taxs)

# Calcoliamo il consumo di sigarette stimato con una tassazione di 50 e 100
consumo_pre = coefficients(model)[1] + coefficients(model)[2] * 50
consumo_post = coefficients(model)[1] + coefficients(model)[2] * 100



predict(model, data.frame(taxs = (c(50, 75, 100, 125))))
