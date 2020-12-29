str_graph = 'dag {
DDEAD [pos="-0.810,0.699"]
DDIAGHA [pos="0.435,-0.419"]
DDIAGISC [pos="-1.506,-0.446"]
DPE [pos="-0.332,0.183"]
DRSH [pos="-0.069,0.480"]
DRSISC [pos="-1.314,0.531"]
LACS [pos="-0.863,-0.192"]
OCCODE [pos="-0.392,1.250"]
OTH [pos="-0.475,-0.196"]
PACS [pos="-1.630,-0.196"]
POCS [pos="-1.250,-0.192"]
RXASP [pos="-2.142,0.203"]
RXHEP [pos="0.390,0.209"]
Sex [pos="-0.874,-1.347"]
TACS [pos="-2.033,-0.194"]
rdef1 [pos="-1.077,-0.772"]
rdef2 [pos="-0.827,-0.773"]
rdef3 [pos="-0.577,-0.775"]
rdef4 [pos="-0.324,-0.777"]
rdef5 [pos="-0.077,-0.779"]
rdef6 [pos="0.173,-0.779"]
rdef7 [pos="0.420,-0.779"]
rdef8 [pos="0.664,-0.783"]
rsbp [pos="-1.834,-0.777"]
DDEAD -> OCCODE
DDIAGHA -> DPE
DDIAGHA -> DRSH
DDIAGISC -> LACS
DDIAGISC -> OTH
DDIAGISC -> PACS
DDIAGISC -> POCS
DDIAGISC -> TACS
DPE -> OCCODE
DRSH -> DDEAD
DRSH -> OCCODE
DRSISC -> DDEAD
DRSISC -> OCCODE
LACS -> DPE
LACS -> DRSISC
OTH -> DPE
OTH -> DRSISC
PACS -> DPE
PACS -> DRSISC
POCS -> DPE
POCS -> DRSISC
RXASP -> DDEAD
RXASP -> DRSH
RXASP -> DRSISC
RXASP -> OCCODE
RXHEP -> DDEAD
RXHEP -> DRSH
RXHEP -> DRSISC
RXHEP -> OCCODE
Sex -> rdef1
Sex -> rdef2
Sex -> rdef3
Sex -> rdef4
Sex -> rdef5
Sex -> rdef6
Sex -> rdef7
Sex -> rdef8
Sex -> rsbp
TACS -> DPE
TACS -> DRSISC
rdef1 -> DDIAGHA
rdef1 -> DDIAGISC
rdef2 -> DDIAGHA
rdef2 -> DDIAGISC
rdef3 -> DDIAGHA
rdef3 -> DDIAGISC
rdef4 -> DDIAGHA
rdef4 -> DDIAGISC
rdef5 -> DDIAGHA
rdef5 -> DDIAGISC
rdef6 -> DDIAGHA
rdef6 -> DDIAGISC
rdef7 -> DDIAGHA
rdef7 -> DDIAGISC
rdef8 -> DDIAGHA
rdef8 -> DDIAGISC
rsbp -> DDIAGHA
rsbp -> DDIAGISC
}
'

library(dagitty)
library(batyesianNetworks)
library(bnlearn)


str_graph <- tolower(str_graph)
data = read.csv("IST_corrected_processed.csv",colClasses=rep("double",4))
names(data) = tolower(names(data))
data = data[ , -which(names(data) %in% c("ddiagun","dnostrk","age"))]

#age.bin = cut(data$age, breaks = c(seq(10,100,by=10)),labels=c("<10", "10-20","20-30","30-40","40-50","50-60","70-80","80-90","90+"))
#age.bin = cut(data$age, breaks = c(0,40,100),labels=c(0,1))
#rsbp.bin = cut(data$rsbp, breaks = c(0,120,2000),labels=c(0,1))

#data$age <- age.bin
#data$rsbp <- rsbp.bin
#data$age <- as.integer(paste(data$age))
#data$rsbp <- as.integer(paste(data$rsbp))

head(data)

g1 = dagitty(str_graph)
g2 = graphLayout(g1)

net <-model2network(toString(g2,"bnlearn"))
plot(net)
plot(g1)


data$ddead <- as.double(data$ddead)
m.bn <- bn.fit( net, as.data.frame(scale(data)))

lapply(data, class)


head(as.data.frame(lapply(data,factor)))

tbl.bn = as.data.frame(expand.grid(sex=c(0,1),rxhep=c(0,1)))



pr.bn <- predict(m.bn,node='rxasp',data=tbl.bn,method='bayes-lw',prob=TRUE,n=10000)

