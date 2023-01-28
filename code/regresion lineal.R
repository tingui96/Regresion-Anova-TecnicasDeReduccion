library(lmtest)
library(dplyr)

data <- head(read.csv("bank-full.csv"),5000)
attach(data)

dicc = c()
t = data.frame(table(job))
i = 1
for (b in t$job) {
  dicc[b] = i
  i = i + 1
}

job.cod = list()
for (x in job) {
  as.numeric(dicc[x])
  job.cod = c(job.cod, as.numeric(dicc[x]))
}
job.cod =  as.numeric(job.cod)

multi.fit = data.frame(balance, job.cod, age)
plot(multi.fit)
cor(multi.fit)

modelo_multilineal = lm(balance ~ age + job.cod, data)
summary(modelo_multilineal)

#residue analysis
resid = modelo_multilineal$residuals

prediccion = modelo_multilineal$fitted.values

#1- La media de los errores es cero y la suma de los errores es cero.
mean(resid)
sum(resid)

#2- Errores normalmente distribuidos
shapiro.test(resid)

#3- Independencia de los residuos
dwtest(modelo_multilineal)   #test Durbin-Watson

#4- Supuesto de Homocedasticidad.
bptest(modelo_multilineal)    #prueba de Breusch-Pagan

#multiple regresion residual plots
layout(matrix(c(1, 2, 3, 4), 2, 2, byrow = T))
plot(
  prediccion,
  rstandard(modelo_multilineal),
  main = "Multi fit standarized residuals",
  xlab = "Predictions",
  ylab = "Standarized Redid",
  ylim = c(-2.5, 2.5)
)
abline(h=0,lty=2)
plot(balance, resid, main="Residuals vs Balance", xlab="Duration", ylab="Residuals")
abline(h=0,lty=2)
hist(resid, main="Hist of Residuals")
qqnorm(resid)
qqline(resid)
