#Graficos lineares
library(tidyverse)
library(ggthemes)

#cargando la data

mtcars <- read.csv("data/mtcars.csv", stringsAsFactors=FALSE)

plot <- mtcars %>% ggplot(aes(wt, mpg))

plot + geom_line()


ggsave("data/peso-vrs-mpg.png")

plot + geom_line(linetype = "dashed",color="red")

ggsave("data/peso-vrs-mpg-redline.png")

plot + geom_line(aes(color=as.factor(carb)))

ggsave("data/peso-vrs-mpg-cylinders.png")


