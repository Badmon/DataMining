#AVANCE DE PROYECTO FINAL

#CARGAMOS LA DATA
juegosOlimpicos<-read.csv("C:/Users/user/Documents/DataMining/dataMineria.csv",sep=";")

#REDEFINIMOS LAS VARIABLES A UTILIZAR
juegosOlimpicos<-juegosOlimpicos[,3:11]
summary(juegosOlimpicos)
str(juegosOlimpicos)

