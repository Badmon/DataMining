#AVANCE DE PROYECTO FINAL

getwd()

#2
# a) COMPRESIÓN DE LOS DATOS

#CARGAMOS LA DATA
juegosOlimpicos<-read.csv("C:/Users/user/Documents/DataMining/DATA/dataMineria.csv",sep=";")

#id=Identificador de los jugadores
#name=Nombre del jugador
#nationality=Nacionalidad del jugador
#sex=sexo del jugador
#dob= fecha de nacimiento
#height=altura
#weight=peso
#sport=deporte
#gol,silver,bronze=medallas

# b)Exploración de los datos
head(juegosOlimpicos)
summary(juegosOlimpicos)
str(juegosOlimpicos)

# c)Verificación de calidad de datos
str(juegosOlimpicos)

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
colperd=c(6,7)
porcentajeper=100*colSums(is.na(juegosOlimpicos[,colperd]))/dim(juegosOlimpicos)[1]
porcentajeper

#Verificamos las filas que tienen valores perdidos
a<-which(rowSums(is.na(juegosOlimpicos))!=0)
length(a)*100/dim(juegosOlimpicos)[1]

#VALORES FUERA DE RANGO
boxplot(sqrt(juegosOlimpicos$sport),col="skyblue")
boxplot(juegosOlimpicos$sport,col="skyblue",main="DIAGRAMA DE CAJA")

plot(juegosOlimpicos,pch=19,col=rainbow(10))

plot(juegosOlimpicos$height,juegosOlimpicos$weight,col="red")

######
library(mice)
library(VIM)

missingraf=aggr(juegosOlimpicos,numbers=T)
summary(missingraf)

names(juegosOlimpicos)

library(Amelia)
missmap(juegosOlimpicos)


