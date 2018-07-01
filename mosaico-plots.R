#Plots de mosaico
library(tidyverse)
library(ggthemes)
library(stats)


#cargando los datos

mtcars <- read.csv("data/mtcars.csv")

#Generando el plot

mosaicplot(~ gear + carb, data = mtcars, color = 2:5, las = 1)

