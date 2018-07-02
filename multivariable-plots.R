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

plot + geom_point(size=3, aes(color=factor(windspeed))) + 
  geom_smooth(method="lm", se=FALSE, col="red") + 
  facet_grid(weekday ~ season) + theme(legend.position="bottom")
