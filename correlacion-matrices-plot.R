#Matrices de correlacion
library(tidyverse)
library(corrplot)
library(reshape2)
library(ggthemes)

#cargando la base de datos y cambiandole nombre a las filas

mtcars <- read.csv("data/mtcars.csv")
rownames(mtcars) <- mtcars$X
mtcars$X <- NULL

#Asignando matriz de correlacion numerica

mtcars_cor <- cor(mtcars, method = "pearson")

#Imprimiendo redondeandolo a dos digitos

round(mtcars_cor, digits=2)

#generando un plot de correlacion

corrplot(mtcars_cor)

#Agregando etiquetas y rotando

corrplot(mtcars_cor, method="shade", shade.col=NA, tl.col="black", tl.srt=45)

##agregando valores de color a una variable

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

##Usando la variable para ajustar el plot

corrplot(mtcars_cor, method="shade", shade.col=NA, tl.col="black", tl.srt=45,
         col=col(200), addCoef.col="black", addcolorlabel="no", order="AOE")

#Usando ggplot2

melted_cormat <- melt(mtcars_cor)
melted_cormat %>% ggplot(aes(x= Var1, y= Var2, fill = value)) + geom_tile() + theme_economist()

ggsave("plots/correlacion-matrix-ggplot01.png")

