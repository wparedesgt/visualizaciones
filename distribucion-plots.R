#Plots de distribución
library(tidyverse)
library(ggthemes)


#cargando la data

faithful=read.csv("data/faithful.csv")

#creando el plot

faithful %>% ggplot(aes(x=waiting)) + geom_histogram()
ggsave("plots/histograma.png")

#Creando el histograma relleno con color azul y agregando bindwidth

faithful %>% ggplot(aes(x=waiting)) +
  geom_histogram(binwidth=5, fill="blue", colour="black")

ggsave("plots/histograma-azul.png")


#Histograma con curvas de densidad

faithful %>% ggplot(aes(x=waiting, y=..density..)) +
  geom_histogram(fill="cornsilk", colour="grey60", size=.2) +
  geom_density() +
  xlim(35, 105)

ggsave("plots/histograma-curvas-densidad.png")


