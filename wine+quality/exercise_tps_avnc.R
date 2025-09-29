library(lattice)

install.packages("corrplot")
library(corrplot)

install.packages("caret")
library(caret)


url = 'https://raw.githubusercontent.com/anthoni-pivoto/data_science_exercises/refs/heads/main/wine%2Bquality/winequality-red.csv'
dados <- read.table(url, sep=';', header=T)

class(dados)

dim(dados)

dados$quality <- as.factor(dados$quality)

summary(dados)

str(dados)

#par(mfrow=c(1,3))
#for(i in c(8,9,11)) {
#  hist(dados[,i], main=names(dados)[i])
#}

dados$quality <- as.character(dados$quality)
dados$quality <- as.numeric(dados$quality)

dados$quality_factor <- as.factor(dados$quality)

par(mfrow=c(2,2))
for(i in c(8,9,11,12)) {
 hist(dados[,i], main=names(dados)[i])
}

par(mfrow=c(1,4))
for(i in c(8,9,11,12)) {
  plot(density(dados[,i]), main=names(dados)[i])
}

par(mfrow=c(1,4))
for(i in c(8,9,11,12)) {
  boxplot(dados[,i],main=names(dados)[i])
}

correlations <- cor(dados[,c(8,9,11,12)])
corrplot(correlations, method="circle")

pairs(dados)
#mds q graficos feios

pairs(dados[,c(8,9,11,12)])

pairs(quality_factor~., data=dados, col=dados$quality_factor)

x <- dados[,c(8,9,11,12)]
y <- dados[,13]
y <- as.factor(y)
escalas <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=escalas, auto.key =
              list(columns = 3))

featurePlot(x=x, y=y, plot="box")
