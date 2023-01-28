library(lmtest)
library(dplyr)

rm(list=ls()) # Clean the global environment
data <- read.csv("bank-full.csv" ) #load dataset
I = length(data[,1])
sub = sample(1:I, 1*I/10)
data = data[sub,]
#data <- read.csv("bank'full.csv" ) #load dataset
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


dicc = c()
t = data.frame(table(marital))
i = 1
for (b in t$marital) {
  dicc[b] = i
  i = i + 1
}

marital.cod = list()
for (x in marital) {
  as.numeric(dicc[x])
  marital.cod = c(marital.cod, as.numeric(dicc[x]))
}
marital.cod =  as.numeric(marital.cod)

dicc = c()
t = data.frame(table(education))
i = 1
for (b in t$education) {
  dicc[b] = i
  i = i + 1
}

education.cod = list()
for (x in education) {
  as.numeric(dicc[x])
  education.cod = c(education.cod, as.numeric(dicc[x]))
}
education.cod =  as.numeric(education.cod)

df = data.frame(
  age,
  job.cod,
  marital.cod,
  education.cod,
  duration
)

#ANOVA#########################################################
boxplot(duration ~ marital.cod, data = df)
boxplot(duration ~ age, data = df)
plot(duration ~ job.cod, data = df)
plot(duration ~ education.cod, data = df)
plot(df) 
marital.anova = aov(
  df$duration ~ df$marital.cod + df$age + df$job.cod + df$education.cod,
  data = df
)
summary(marital.anova)
res = marital.anova$residuals
plot(res)
hist(res)
qqnorm(res)
qqline(res, col = 2)
shapiro.test(res) 
bartlett.test(res, marital.cod) 
dwtest(marital.anova) 


###############################################################
