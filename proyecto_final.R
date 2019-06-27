#AVANCE DE PROYECTO FINAL

#CARGAMOS LA DATA
juegosOlimpicos<-read.csv("C:/Users/user/Documents/DataMining/dataMineria.csv",sep=";")

#REDEFINIMOS LAS VARIABLES A UTILIZAR
juegosOlimpicos<-juegosOlimpicos[,3:11]
summary(juegosOlimpicos)
str(juegosOlimpicos)

#TRANSFORMAMOS LA DATA
juegosOlimpicos$nationality<-as.numeric(juegosOlimpicos$nationality)
juegosOlimpicos$sex<-as.numeric(juegosOlimpicos$sex)
juegosOlimpicos$sport<-as.numeric(juegosOlimpicos$sport)
juegosOlimpicos$dob<-as.Date(juegosOlimpicos$dob,"%d/%m/%Y")
str(juegosOlimpicos)

#
which(colSums(is.na(juegosOlimpicos))!=0)

colperd=c(6,7)



