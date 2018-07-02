#visualizaciones de red
library(tidyverse)
library(igraph)

#especificando los valores para un grafico dirigido

graph_directed <- graph(edges=c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6, 5,6),n=6)
graph_undirected <- graph(edges=c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6, 5,6),n=6, directed=FALSE)

#estableciendo las vistas del plot 

par(mfrow=c(1,2))

#realizando el plot

plot(graph_directed)
plot(graph_undirected)


#Lista de bordes que tenga nombres de vértices y también mencione la lista de nombres aislados:


graph_isolation <- graph( c( "Kuntal", "Maulim", "Maulim", "Yana","Yana","Kuntal", "Ranadeep", "Rabindrika","Ranadeep", "Kuntal"), 
                          
                          isolates=c("Suman", "Arunava", "Raja", "Manish","Gina") )  



plot(graph_isolation, edge.arrow.size=.5, vertex.color="gold", vertex.size=15, 
     vertex.frame.color="gray", vertex.label.color="black", 
     vertex.label.cex=0.8, vertex.label.dist=2, edge.curved=0.2) 


set.seed(100)
plot(graph_directed)
