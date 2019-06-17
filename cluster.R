data(iris)

#Para que la data pertenezca a análsis no supervisado
newiris<-iris[,1:4]
head(newiris)

#Distancias entre los datos
dist(newiris)
?dist

dist(newiris, method = "manhattan")
dist(newiris, method = "minkowski")

library(cluster)
daisy(newiris)

#Aplicamos el análisis cluster
set.seed(111)
agrupacion<-kmeans(newiris, 2)
agrupacion$cluster
agrupacion

plot(newiris[,1], col=agrupacion$cluster)

set.seed(111)
agrupacion2<-kmeans(newiris, 3)
table(agrupacion2$cluster)
agrupacion2$cluster
plot(newiris, col=agrupacion2$cluster)
plotcluster(newiris, agrupacion2$cluster)

table(agrupacion2$cluster)
?kmeans

library(rgl)
a<-plot3d(newiris[,1:3], col =agrupacion2$cluster,type = "s", radius = 0.1 )
play3d(spin3d(a), duration = 20)

library(aplpack)
faces(newiris[1:30,])

###############
#Numero de cluster´s necesarios
valor<-numeric()
for(k in 2:10){
  clus<-kmeans(newiris,k)
  valor[k-1]<-clus$tot.withinss
}

plot(2:10, valor, type = "b")

################
#Silueta
irisscal<-daisy(scale(newiris))
par(mfrow=c(1,3))
for(k in 2:4){
  clus<-kmeans(irisscal,k)
  valor[k-1]<-clus$tot.withinss
  plot(silhouette(clus$cluster, irisscal))
}

#Graficar el cluster
irisscal1<-kmeans(scale(newiris),3)
plotcluster(newiris, irisscal1$cluster)

###########################################
#ALGORITMO PAM
library(cluster)
clust2<-pam(newiris, 3)
clust2$clustering

plotcluster(newiris, clust2$clustering)
plot(clust2)

parapam<-numeric()
for(k in 2:10){
  clus<-pam(newiris,k)
  parapam[k-1]<-clus$silinfo$avg.width
}

plot(2:10, parapam, type = "b")

###########################################
#ALGORITMO CLARA
clust3<-clara(newiris, 3)
clust3$clustering

plot(clust3)


###########################################
#ALGORITMO FANNY
clust4<-fanny(newiris, 3)
clust4$clustering

plot(clust4)






