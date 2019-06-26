
banco<-read.csv("https://raw.githubusercontent.com/VictorGuevaraP/ME-Machine-Learning/master/banco.csv",sep=",")
head(banco)
dim(banco)

str(banco)

banco<-banco[,2:20]
head(banco)
str(banco)#Cambiamos el tipo de dato del target
banco$suscrito<-as.factor(banco$suscrito)
summary(banco)


############################################################
#VERIFICACIÓN DE VALORES PERDIDOS

#Verificamos las columnas que tienen valores perdidos
which(colSums(is.na(banco))!=0)

colperd=c(1,9,17)
#Calculamos valores perdidos por columna
porcentajeper=100*colSums(is.na(banco[,colperd]))/dim(banco)[1]
porcentajeper

#Verificamos las filas que tienen valores perdidos
a<-which(rowSums(is.na(banco))!=0)
length(a)*100/dim(banco)[1]



#Verificamos si hay patrón de los datos faltantes 
library(VIM)
library(mice)
missingraf=aggr(banco,numbers=T)
missingraf
summary(missingraf)
#Agregando 
missingraf2<- aggr(banco, col=mdc(1:2), numbers=T, sortVars=T,
                   labels=names(banco), cex.axis=.7, gap=1, 
                   ylab=c("Proporción de valores perdidos","Patrón de valores missing"))
#diagrama de márgenes
marginplot(banco[,c("duracion", "Nueva_cuenta")])
marginplot(banco[, c("duracion", "Nueva_cuenta")], cex.numbers = 1, pch =15)
marginplot(banco[, c("duracion", "empleo")], cex.numbers = 1, pch =15)
marginplot(banco[, c("Nueva_cuenta", "empleo")], cex.numbers = 1, pch =15)
