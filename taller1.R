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



