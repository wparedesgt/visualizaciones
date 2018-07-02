#mapas de calor sobre mapas geo espaciales
library(tidyverse)
library(ggmap)
library(maps)


#cargando los datos (tartu estonia)

tartu_housing_data <- read.csv("data/tartu_housing.csv", sep=";")

#cargando el mapa desde google

tartu_map <- get_map(location="tartu", maptype="satellite", zoom = 12)

#cargando la informacion geo espacial 

tartu_map %>% ggmap(extent='device') +
  geom_point(aes(x=lon, y=lat), colour="yellow", alpha=0.1, size=2, data=tartu_housing_data)


ggsave("plots/mapa-calor-geoespacial.png")


##Generando un plot de densidad
#Cambiando los parametros

tartu_map_g <- get_map(location="tartu", zoom = 13) 

tartu_map_g %>% ggmap(extent='device') + geom_density2d(data=tartu_housing_data, aes(x=lon, y=lat), size=.3) +
  stat_density2d(data=tartu_housing_data,
                 aes(x=lon, y=lat,  fill = ..level.., alpha = ..level..), 
                 size = 0.01, bins = 16, 
                 geom = 'polygon')+
  scale_fill_gradient(low = "green", high = "red") +
  scale_alpha(range = c(0, 0.30), guide = FALSE)

ggsave("plot/mapa-calor-geoespacial02.png")
