library(dagitty)
library(batyesianNetworks)
library(bnlearn)
library( bayesianNetworks )
library(lavaan)
source("funcitons.R")

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
rdef1 -> TACS
rdef1 -> PACS
rdef1 -> POCS
rdef1 -> LACS
rdef1 -> OTH
rdef2 -> TACS
rdef2 -> PACS
rdef2 -> POCS
rdef2 -> LACS
rdef2 -> OTH
rdef3 -> TACS
rdef3 -> PACS
rdef3 -> POCS
rdef3 -> LACS
rdef3 -> OTH
rdef4 -> TACS
rdef4 -> PACS
rdef4 -> POCS
rdef4 -> LACS
rdef4 -> OTH
rdef5 -> TACS
rdef5 -> PACS
rdef5 -> POCS
rdef5 -> LACS
rdef5 -> OTH
rdef6 -> TACS
rdef6 -> PACS
rdef6 -> POCS
rdef6 -> LACS
rdef6 -> OTH
rdef7 -> TACS
rdef7 -> PACS
rdef7 -> POCS
rdef7 -> LACS
rdef7 -> OTH
rdef8 -> TACS
rdef8 -> PACS
rdef8 -> POCS
rdef8 -> LACS
rdef8 -> OTH
}
'

dag <- dagitty(str_graph)
dag <- tolower(dag)

data = read.csv("IST_corrected_processed.csv")


age.bin = cut(data$age, breaks = c(-Inf,seq(-1,99,by=10),Inf),labels=seq(-10,100,by=10))
data$age = data$age/100

rsbp.bin = cut(data$rsbp, breaks = c(-Inf,seq(50,300,by=25),Inf),labels=seq(50-25,300,by=25))
data$rsbp = data$rsbp/100

data = data[ , -which(names(data) %in% c("ddiagun","dnostrk","rsbp","age"))]
names(data) = tolower(names(data))

head(data)

vartable(data)

M <- lavCor(data)

M



plot(dag)


fit <- sem( toString(dag,"lavaan"), sample.cov=M, sample.nobs=nrow(data) )

ordered(row.names(M))
ordered(names(data))
ordered(names(dag))
