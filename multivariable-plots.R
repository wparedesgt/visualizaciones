#Plots multivariables

library(tidyverse)
library(GGally)

#Cargando los datos

bike <- read.csv("data/daily-bike-rentals.csv")

#Cambiando los nombres de las variables

bike$season <- factor(bike$season, levels = c(1,2,3,4), 
                      labels = c("Primavera", "Verano", "Otoño", "Invierno"))
bike$weathersit <- factor(bike$weathersit, levels = c(1,2,3), 
                          labels = c("Despejado", "Nublado", "Nieve Ligera"))
bike$windspeed.fac <- cut(bike$windspeed, breaks=3, 
                          labels=c("Bajo", "Medio", "Alto"))
bike$weekday <- factor(bike$weekday, levels = c(0:6), 
                       labels = c("Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"))
#Cargando la data a memoria

attach(bike)


#Creando la variable a dibujar

plot <- bike %>% ggplot(aes(temp,cnt))

#generando el plot

plot + geom_point(size=3, aes(color=factor(windspeed))) + geom_smooth(method="lm", se=FALSE, col="red") + facet_grid(weekday ~ season) + theme(legend.position="bottom")

#Leyendo otra data

auto <- read.csv("data/auto-mpg.csv", stringsAsFactors=FALSE)
auto$cylinders <- factor(auto$cylinders,labels=c("3cyl","4cyl", "5cyl","6cyl","8cyl"))
ggpairs(auto[,2:5])


ggpairs(auto[,2:5], aes(colour = cylinders, alpha = 0.4 ), title = "Multivariate Analysis") + theme(plot.title = element_text(hjust = 0.5))

ggpairs(auto[,2:5], aes(colour = cylinders, alpha = 0.4 ), title = "Multivariate Analysis", upper = list(continuous = "density"), lower = list(combo = "denstrip")) + theme(plot.title = element_text(hjust = 0.5))

