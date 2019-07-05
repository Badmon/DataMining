#E4
#DATA
data<-read.csv("https://raw.githubusercontent.com/VictorGuevaraP/Mineria-de-datos/master/E4_FILA_B.csv",sep=";")

#1) COMPRENSIÓN DE LOS DATOS
table(data$Salida)
#- SALIDA 0=No 1=Si / Diabetico

#2) EXPLORACION DE LOS DATOS
#-
head(data)
str(data)
summary(data)

#3) VERIFICACIÓN DE LA DATA
#Verificamos las columnas que tienen valores perdidos
which(colSums(is.na(data))!=0)

a<-which(rowSums(is.na(data))!=0)
length(a)*100/dim(data)[1]

library(VIM)
missingraf=aggr(data,numbers=T)




data$Sexo<-NULL
data$Salida<-as.factor(data$Salida)
str(data)


muestra<-sample(510,219)
train<-data[-muestra,]
test<-data[muestra,]

library(rpart)
modelo1<-rpart(Salida~. , data = data, method = "class")
modelo1

library(partykit)
plot(as.party(modelo1))

library(rpart.plot)
prp(modelo1, type = 1, extra = 1)

#predecimos en la data de prueba
predichos1<-predict(modelo1, test, type = "class")
table(predichos1,test$Salida)

library(caret)
confusionMatrix(predichos11, test$Salida)


#REDES NEURONALES
library(nnet)
modelo2<-nnet(Salida~., train ,size=10, maxit=100, trace=F)
predichos2<-predict(modelo2, test, type = "class")

predichos2<-as.factor(predichos2)
confusionMatrix(predichos2, test$Salida)


#############################