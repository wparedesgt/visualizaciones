#mapas de calor sobre mapas geo espaciales
library(tidyverse)
library(ggmap)
library(maps)

#cargando los datos (tartu estonia)

tartu_housing_data <- read.csv("data/tartu_housing.csv", sep=";")

#cargando el mapa desde google

tartu_map <- get_map(location="tartu", maptype="satellite", zoom = 12)

#cargando la informacion geo espacial 

