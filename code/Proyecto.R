library(lmtest)
library(dplyr)

rm(list=ls()) # Clean the global environment
data <- read.csv("bank-full.csv" ) #load dataset
I = length(data[,1])
sub = sample(1:I, 1*I/4)
data = data[sub,]
#data <- read.csv("smartphone_category.csv" ) #load dataset
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
  balance,
  duration
)

df.std = df %>% mutate_all ( ~ (scale (.) %>% as.vector))
#distance matrix with Euclidean distance
d = dist(df.std, method = "euclidean")
# full adjustment
fit = hclust(d, method = "complete")
d2 = as.dendrogram(fit)
plot(fit)
rect.hclust(fit, k = 20, border = "red")

fit.k1 = kmeans(df.std, 20)
fit.k1

#K-means with 8 plotting the clusters by variable
plot(df.std, col = fit.k1$cluster)

#some examples two to two
plot(df.std$job.cod,
     df.std$duration,
     col = fit.k1$cluster,
     lwd = 2)
points(fit.k1$centers,
       col = 1:12,
       pch = 6,
       lwd = 2)

plot(df.std$age,
     df.std$duration,
     col = fit.k1$cluster,
     lwd = 2)
points(fit.k1$centers,
       col = 1:12,
       pch = 6,
       lwd = 2)

