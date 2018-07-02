#Etiquetado y leyendas
library(tidyverse)
library(ggthemes)


#cargando la data
toothgrowth <- read.csv("data/ToothGrowth.csv")

#Creando un boxplot

p <- toothgrowth %>%   ggplot(aes(x=dose, y=len)) + geom_boxplot() 


#Aplicando leyendas

p + ggtitle("Tooth groth Length vs Dose(mg/day) ") +
  xlab("Dose of Vitamin C(mg/day)") + 
  ylab("Tooth Length")



p_leg <- ggplot(toothgrowth, aes(x=dose, y=len, fill=as.factor(dose))) + geom_boxplot() 
p_leg + labs(fill = "Dose (mg)")

ggsave("plots/plots.png")

p_leg + labs(fill = "Dose (mg)")+  theme(legend.position="top")

p_leg + guides(fill=FALSE)


# Aplicando temas


p + theme_bw() # balck and white

p + theme_dark()

p + theme_grey() # Grey back ground and white lines

p + theme(plot.background = element_rect(fill = "darkblue"))

p + theme(axis.text.x = element_text(face="bold", color="#993333", 
                                     size=14, angle=45),
          axis.text.y = element_text(face="bold", color="#993333", 
                                     size=14, angle=45))

p + theme(panel.border = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())


