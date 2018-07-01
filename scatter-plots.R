#scatter plots
library(tidyverse)
library(ggthemes)


auto <- read.csv("data/auto-mpg.csv", stringsAsFactors=FALSE)
auto$cylinders <- factor(auto$cylinders,labels=c("3cyl","4cyl",
                                                 "5cyl","6cyl","8cyl"))


auto %>% ggplot(aes(weight, mpg)) 

plot <- auto %>% ggplot(aes(weight, mpg))

plot + geom_point() + theme_solarized()

ggsave("plots/scatter-plot.png")

plot + geom_point(alpha=1/2, size=5, aes(color=factor(cylinders))) +
  geom_smooth(method="lm", se=FALSE, col="green") +
  facet_grid(cylinders~.) + 
  labs(x = "Weight") +
  labs(y = "Miles Per Gallon") + 
  labs(title = "MPG Vs Weight")

ggsave("plots/mpg-vs-weight.png")


qplot(weight, mpg, data=auto, geom=c("point", "smooth"), method="lm", formula=y~x, color=cylinders, main="Regression of MPG on Weight")

ggsave("plots/regresion-MPG.png")
