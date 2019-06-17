setwd("C:/Users/user/Desktop/Mineria de Datos")
getwd()

target<-read.csv("gender_submission.csv", sep=",")
test<-read.csv("test.csv", sep=",")
train<-read.csv("train.csv", sep=",")

###CUANDO HAY TARGET
head(target)
head(test)
head(train)

str(train)
summary(train)


testnew<-cbind(test,target)
head(testnew)
testnew$PassengerId<-NULL
titan<-rbind(train,testnew)
head(titan)


########################

titan2<-rbind(train[,-2],test)
head(titan2)


#TRANSFORMAR DATA
str(titan2)
titan2$PassengerId<-as.factor(titan2$PassengerId)
titan2$Pclass<-as.factor(titan2$Pclass)

summary(titan2)
#IFELSE
titan2$Pclass<-ifelse(titan2$Pclass==1,"Superior",ifelse(titan2$Pclass==2,"Medio","Inferior"))
titan2$Pclass<-as.factor(titan2$Pclass)
#Solo agregar si los valores requieren order
titan2$Pclass<-factor(titan2$Pclass, levels= c("Superior","Medio","Inferior"),ordered =TRUE)
summary(titan2)


library(VIM)
#DATOS PERDIDOS(La mayor parte e concentra en el centro)
aggr(titan2, numbers=TRUE)
?aggr

#MAPA DE PERDIDA
library(Amelia)
missmap(titan2)

#Imputación de datos
library(DMwR)
titan2imp<-centralImputation(titan2)
summary(titan2imp)

#Imputación multivariante
#K-Vecinos mas cercanos
titan2kvec<-knnImputation(titan2)
summary(titan2kvec)

#Analisis exploratorio de datos
trainreal<-titan2kvec[1:891,]
testreal<-titan2kvec[892:1309,]

#trainrealcompleto<-cbind(trainreal,train[,2]) otro modo pero aparecera con el [,2]
trainrealcompleto<-cbind(trainreal,train$Survived)
summary(trainrealcompleto)

#El target esta en number, lo cambiamos a factor
trainrealcompleto$`train$Survived`<-ifelse(trainrealcompleto$`train$Survived`==1,"Si","No")
trainrealcompleto$`train$Survived`<-as.factor(trainrealcompleto$`train$Survived`)
summary(trainrealcompleto)

#Graficando para ver la data con respecto al target(Survived)
library(ggplot2)
ggplot(data=trainrealcompleto)+
  geom_bar(mapping = aes(x=Pclass, fill=train$Survived))

#Para ver la cantidad de datos del grafico
tra<-trainrealcompleto
table(tra$Pclass, tra$`train$Survived`)

#Para ver en porcentaje la cantidad de datos del grafico
library(gmodels)
CrossTable(tra$Pclass, tra$`train$Survived`, format = "SPSS")
#Para ver la chi cuadrada  Sig<0.05
CrossTable(tra$Pclass, tra$`train$Survived`, format = "SPSS", chisq=T)

#Comprobando de que no hay relacion con PassengerId
CrossTable(tra$PassengerId, tra$`train$Survived`, format = "SPSS", chisq=T)


summary(trainrealcompleto)
ggplot(data=trainrealcompleto)+
  geom_bar(mapping = aes(x=Name, fill=train$Survived))

ggplot(data=tra)+
  geom_bar(mapping = aes(x=Sex, fill=train$Survived))

ggplot(data=tra)+
  geom_histogram(mapping = aes(x=Age, fill=train$Survived))

ggplot(data=tra)+
  geom_bar(mapping = aes(x=SibSp, fill=train$Survived))

ggplot(data=tra)+
  geom_histogram(mapping = aes(x=Fare, fill=train$Survived))

boxplot(tra$Fare)

ggplot(data=tra)+
  geom_bar(mapping = aes(x=Cabin, fill=train$Survived))

ggplot(data=tra)+
  geom_bar(mapping = aes(x=Embarked, fill=train$Survived))

summary(tra)
names(tra)


library(rpart.plot)

modelo1<-rpart(train$Survived~Pclass+Sex, data = tra, method="class")
modelo1
#PREDICCIONES
predicciones<-predict(modelo1,testreal, type="class")
head(predicciones)

predicciones2<-predict(modelo1,testreal, type="prob")
head(predicciones2)
class(target)
table(predicciones,target$Survived)

prp(modelo1)

prp(modelo1,type=1,extra=1)
modelo2<-rpart(train$Survived~Pclass+Sex, data = tra, method="class")
modelo2
