#mapas de calor

library(tidyverse)
library(corrplot)
library(reshape2)
library(ggthemes)

#cargando la base de datos y cambiandole nombre a las filas

mtcars=read.csv("data/mtcars.csv")
rownames(mtcars) <- mtcars$X
mtcars$X <- NULL

#Asignando matriz de correlacion numerica

mtcars_cor <- cor(mtcars, method = "pearson")

#Imprimiendo redondeandolo a dos digitos

round(mtcars_cor, digits=2)

#Craendo las funciones lower, upper y reorder


get_lower_triangle<-function(cormat){
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}
get_upper_triangle <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
}

reorder_cormat <- function(cormat){
  # Use correlation between variables as distance
  dd <- as.dist((1-cormat)/2)
  hc <- hclust(dd)
  cormat <-cormat[hc$order, hc$order]
}

##reordenando la matriz de correlacion y mesclandola

cormat <- reorder_cormat(mtcars_cor)
upper_tri <- get_upper_triangle(cormat)
melted_cormat <- melt(upper_tri, na.rm = TRUE)

#Reordenando y visualizando los datos

melted_cormat %>% ggplot(aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1))+
  coord_fixed()

ggsave("plots/heatmaps01.png")

