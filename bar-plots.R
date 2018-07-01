#Graficos de Barras
library(tidyverse)
library(ggthemes)

#Cargamos la data

bike <- read.csv("data/daily-bike-rentals.csv")

#Cambiamos las estaciones por factor y las etiquetamos

bike$season <- factor(bike$season, levels = c(1,2,3,4),labels = c("Primavera", "Verano", "Otoño", "Invierno"))

#Cambiamos los dias de trabajo,los dias libres y los factorizamos

bike$workingday <- factor(bike$workingday, levels = c(0,1),labels = c("Día Laboral", "Día Libre"))

#Agregamos y factorizamos el tipo de dia 

bike$weathersit <- factor(bike$weathersit, levels = c(1,2,3),labels = c("Claro", "Nublado", "Nieve Ligera"))


#Cargamos bike a la memoria

attach(bike)

#agrupamos por estacion y dia de trabajo sumamos cantidad

bike.sum =bike %>% 
  group_by(season, workingday) %>% 
  summarize(rental = sum(cnt))

#Creamos el plot

bike.sum %>% ggplot(aes(x= season, y= rental)) + geom_bar(show.legend = TRUE, stat = "identity") + labs(title = "Rentas por temporada y dia")

ggsave("plots/ventas-x-temprada-x-dia.png")


#Agregando escalas texto y leyendas

bike.sum %>% ggplot(aes(x= season, y= rental, fill = workingday,label = scales::comma(rental))) + 
  geom_bar(show.legend = TRUE, stat = "identity") + 
  labs(title = "Rentas ´pr estación y día") + 
  scale_y_continuous(labels = scales::comma) + 
  geom_text(size = 3, position = position_stack(vjust = 0.5))

ggsave("plots/rentas-x-temporada-x-dia.png")


#cambiando los colores y forma

bike.sum %>%  ggplot(aes(x= season, y= rental)) + geom_bar(show.legend = TRUE, stat = "identity", fill="lightblue", colour="black"
) + labs(title = "Rentas por estación y día")

ggsave("plots/rentas-x-temporada-x-dia-colorligero.png")

