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

