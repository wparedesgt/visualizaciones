#mapas de arboles

library(tidyverse)
library(treemap)

#creando el data frame

branch=c(rep("branch-1",4),rep("branch-2",2),rep("brach-3",3))
subbranch=paste("subbranch" , c(1,2,3,4,1,2,1,2,3), sep="-")
value=c(13,5,22,12,11,7,3,1,23)
data=data.frame(branch,subbranch,value)

#Creando el Plot


treemap(data,
        index=c("branch","subbranch"),
        vSize="value",
        type="index"
)      


#cargando Datos

post_data=read.csv("data/post-data.csv")


treemap(post_data,
        index=c("category", "comments"),
        vSize="views",
        type="index"
)            



