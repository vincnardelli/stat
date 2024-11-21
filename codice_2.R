library(ISLR2)
data("Carseats")

cor(Carseats[,c("Sales", "Price", "CompPrice")])

model = lm(Sales ~ CompPrice, data=Carseats)
summary(model)

confint(model)

model = lm(Sales ~ Price, data=Carseats)
summary(model)

confint(model)



model = lm(Sales ~ Price+CompPrice, data=Carseats)
summary(model)
confint(model)


model = lm(Sales ~ US+Price, data=Carseats)
summary(model)
confint(model)


model = lm(Sales ~ ShelveLoc, data=Carseats)
summary(Carseats$ShelveLoc)
levels(Carseats$ShelveLoc)
summary(model)
confint(model)


summary(lm(Sales ~ .-Population-Education-Urban-US, data=Carseats))

# Forward selection tra CompPrice, Population, Price

summary(lm(Sales ~ 1, data=Carseats)) #2.824

summary(lm(Sales ~ CompPrice, data=Carseats)) #2.822
summary(lm(Sales ~ Population, data=Carseats)) #2.824
summary(lm(Sales ~ Price, data=Carseats)) #2.532

summary(lm(Sales ~ Price+CompPrice, data=Carseats)) #2.269
summary(lm(Sales ~ Price+Population, data=Carseats)) #2.532

summary(lm(Sales ~ Price+Population+CompPrice, data=Carseats)) #2.258



summary(lm(Sales ~ Price+Population+CompPrice, data=Carseats)) #2.258
summary(lm(Sales ~ Price+Population+CompPrice+Education+Urban, data=Carseats)) #2.257



model = lm(Sales ~ Price+CompPrice, data=Carseats)
summary(model)


pred(model)
predict(model, interval="confidence")
predict(model, interval="prediction")
