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
