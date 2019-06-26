
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
marginplot(banco[, c("duracion", "Nueva_cuenta")], cex.numbers = 1, pch =19)
marginplot(banco[, c("duracion", "empleo")], cex.numbers = 1, pch =15)
marginplot(banco[, c("Nueva_cuenta", "empleo")], cex.numbers = 1, pch =15)


#representación matricial missing
matrixplot(banco)
matrixplot(banco, interactive = TRUE)

#Otra forma de representación
library(mice)
md.pattern(banco,rotate.names = T)

library(Amelia)
missmap(banco)

#Visualización diferenciando tipo de dato
library(visdat)
vis_dat(banco)
vis_miss(banco)
vis_miss(banco, 
         cluster = TRUE)
vis_miss(banco,
         sort_miss = TRUE)

library(naniar)
gg_miss_var(banco)

##################################################################
#Correción de missing

#Eliminado todos los valores missing
banco1<- na.omit(banc)
library(VIM)
aggr(banco1)

#################################################################
#Aplicando técnicas de imputación
#Imputación por medidas de tendencia central
library(DMwR)
bancoc<-centralImputation(banco) #DMwR, mediana (númerico), moda(no númerico)
summary(bancoc)
library(VIM)
bancoc2<-initialise(banco,method="median") #media (continuos) mediana (discretos), moda(no númerico)
summary(bancoc2)

# K-Vecinos más cercanos
bancoknn<-knnImputation(banco, k=10)
summary(bancoknn)

#Metodos no paramétricos
library(missForest)
bancomiss<-missForest(banco)
summary(bancomiss)
head(bancomiss$ximp)


#Metodos de regresión
# IRMI
bancoirmi<- irmi(banco[,1:7])
summary(bancoirmi)
