#AVANCE DE PROYECTO FINAL
#CARGAMOS LA DATA
juegosOlimpicos<-read.csv("C:/Users/user/Documents/DataMining/dataMineria.csv",sep=";")

#2.- COMPRESIÓN DE LOS DATOS

head(juegosOlimpicos)

#id=Identificador de los jugadores
#name=Nombre del jugador
#nationality=Nacionalidad del jugador
#sex=sexo del jugador
#dob

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


#Verificamos las columnas que tienen valores perdidos
which(colSums(is.na(juegosOlimpicos))!=0)

#Calculamos valores perdidos por columna
colperd=c(4,5)
porcentajeper=100*colSums(is.na(juegosOlimpicos[,colperd]))/dim(juegosOlimpicos)[1]
porcentajeper

#Verificamos las filas que tienen valores perdidos
a<-which(rowSums(is.na(juegosOlimpicos))!=0)
length(a)*100/dim(juegosOlimpicos)[1]








