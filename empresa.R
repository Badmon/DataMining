#La Data
empresa<-read.csv("https://raw.githubusercontent.com/VictorGuevaraP/Mineria-de-datos/master/Perdida%20de%20clientes.csv",sep = ";")

#Los 6 primeros datos
head(empresa)

#En el conjunto de datos tenemos 3333 observaciones con 6 variables la variable principal es desafiliado
str(empresa)

#Relizamos un resumen de los datos
summary(empresa)

