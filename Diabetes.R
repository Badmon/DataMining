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


#SELECCIONAMOS LA DATA
str(data)



