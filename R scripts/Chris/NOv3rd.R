str_graph = 'dag {
"rdef unknown" [pos="1.010,-0.783"]
age [pos="-0.231,-1.360"]
ddead [pos="-0.810,0.699"]
ddiagha [pos="0.435,-0.419"]
ddiagisc [pos="-1.506,-0.446"]
dpe [pos="-0.332,0.183"]
drsh [pos="-0.069,0.480"]
drsisc [pos="-1.314,0.531"]
lacs [pos="-0.863,-0.192"]
occode [pos="-0.392,1.250"]
oth [pos="-0.475,-0.196"]
pacs [pos="-1.630,-0.196"]
pocs [pos="-1.250,-0.192"]
rdef1 [pos="-1.077,-0.772"]
rdef2 [pos="-0.827,-0.773"]
rdef3 [pos="-0.577,-0.775"]
rdef4 [pos="-0.324,-0.777"]
rdef5 [pos="-0.077,-0.779"]
rdef6 [pos="0.173,-0.779"]
rdef7 [pos="0.420,-0.779"]
rdef8 [pos="0.664,-0.783"]
rsbp [pos="-1.834,-0.777"]
rxasp [pos="-2.142,0.203"]
rxhep [pos="0.390,0.209"]
sex [pos="-0.874,-1.347"]
tacs [pos="-2.033,-0.194"]
"rdef unknown" -> ddiagha
"rdef unknown" -> ddiagisc
age -> "rdef unknown"
age -> rdef1
age -> rdef2
age -> rdef3
age -> rdef4
age -> rdef5
age -> rdef6
age -> rdef7
age -> rdef8
age -> rsbp
ddead -> occode
ddiagha -> dpe
ddiagha -> drsh
ddiagha <-> ddiagisc
ddiagisc -> lacs
ddiagisc -> oth
ddiagisc -> pacs
ddiagisc -> pocs
ddiagisc -> tacs
dpe -> occode
drsh -> ddead
drsh -> occode
drsisc -> ddead
drsisc -> occode
lacs -> dpe
lacs -> drsisc
lacs <-> oth
lacs <-> pocs
oth -> dpe
oth -> drsisc
pacs -> dpe
pacs -> drsisc
pacs <-> pocs
pacs <-> tacs
pocs -> dpe
pocs -> drsisc
rdef1 -> ddiagha
rdef1 -> ddiagisc
rdef2 -> ddiagha
rdef2 -> ddiagisc
rdef3 -> ddiagha
rdef3 -> ddiagisc
rdef4 -> ddiagha
rdef4 -> ddiagisc
rdef5 -> ddiagha
rdef5 -> ddiagisc
rdef6 -> ddiagha
rdef6 -> ddiagisc
rdef7 -> ddiagha
rdef7 -> ddiagisc
rdef8 -> ddiagha
rdef8 -> ddiagisc
rsbp -> ddiagha
rsbp -> ddiagisc
rxasp -> ddead
rxasp -> drsh
rxasp -> drsisc
rxasp -> occode
rxhep -> ddead
rxhep -> drsh
rxhep -> drsisc
rxhep -> occode
sex -> age
sex -> rdef1
sex -> rdef2
sex -> rdef3
sex -> rdef4
sex -> rdef5
sex -> rdef6
sex -> rdef7
sex -> rdef8
sex -> rsbp
tacs -> dpe
tacs -> drsisc
}
'

str_graph = 'dag {
Age [pos="-0.231,-1.360"]
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
Age -> rdef1
Age -> rdef2
Age -> rdef3
Age -> rdef4
Age -> rdef5
Age -> rdef6
Age -> rdef7
Age -> rdef8
Age -> rsbp
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
Sex -> Age
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
library( bayesianNetworks )


data = read.csv("IST_corrected_processed.csv")
data = data[ , -which(names(data) %in% c("ddiagun","dnostrk"))]
names(data) = tolower(names(data))

str_graph <- tolower(str_graph)
g1 = dagitty(str_graph)
g2 = graphLayout(g1)

sort(names(data))
sort(names(g1))


options(max.print=1000000)
output = localTests(g1, data, type="cis.chisq", max.conditioning.variables=16)
sink('analysis-output.txt', append=FALSE)
output
sink()

sink('implied_indep.txt', append=FALSE)
impliedConditionalIndependencies(g1)
sink()

c(-Inf,seq(0,100,by=10),Inf)
data$age.bin = cut(data$age, breaks = c(-Inf,seq(-1,99,by=10),Inf),labels=seq(-10,100,by=10))
data$age.bin = as.numeric(data$age.bin)

data$rsbp.bin = cut(data$rsbp, breaks = c(-Inf,seq(50,300,by=25),Inf),labels=seq(50-25,300,by=25))
data$rsbp.bin = as.numeric(data$rsbp.bin)
hist(data$rsbp.bin)
data$rsbp.bin






m.optbayes <- optimal_bayes(occode~sex+age,data=as.data.frame(data))
m.glm <- glm(occode~rxasp+age,data=as.data.frame(data),family="binomial")

tbl_m <- expand.grid( age=seq(1, 100, by=10), sex=c(0))
tbl_f <- expand.grid( age=seq(1, 100, by=10), sex=c(1))

p.b <- predict(m.optbayes,newdata = tbl_f)[,2]
p.g <- predict(m.glm,newdata = tbl_f,type="response")


par(mfrow=c(1,1))
plot(g1)

head(data)


print(chisq);print(df)
pchisq(chisq,df,lower.tail = FALSE)

chisq.test(data$rdef1,data$rdef3)

source("funcitons.R")

dep.matrix = matrix(nrow = 8, ncol = 8,0)

n=1

dep.matrix[1,1] <- chisq_given(data, data$rdef1, data$rdef1 ,data$sex,data$age.bin)[n]
dep.matrix[1,2] <- chisq_given(data, data$rdef1, data$rdef2 ,data$sex,data$age.bin)[n]
dep.matrix[1,3] <- chisq_given(data, data$rdef1, data$rdef3 ,data$sex,data$age.bin)[n]
dep.matrix[1,4] <- chisq_given(data, data$rdef1, data$rdef4 ,data$sex,data$age.bin)[n]
dep.matrix[1,5] <- chisq_given(data, data$rdef1, data$rdef5 ,data$sex,data$age.bin)[n]
dep.matrix[1,6] <- chisq_given(data, data$rdef1, data$rdef6 ,data$sex,data$age.bin)[n]
dep.matrix[1,7] <- chisq_given(data, data$rdef1, data$rdef7 ,data$sex,data$age.bin)[n]
dep.matrix[1,8] <- chisq_given(data, data$rdef1, data$rdef8 ,data$sex,data$age.bin)[n]
dep.matrix[2,1] <- chisq_given(data, data$rdef2, data$rdef1 ,data$sex,data$age.bin)[n]
dep.matrix[2,2] <- chisq_given(data, data$rdef2, data$rdef2 ,data$sex,data$age.bin)[n]
dep.matrix[2,3] <- chisq_given(data, data$rdef2, data$rdef3 ,data$sex,data$age.bin)[n]
dep.matrix[2,4] <- chisq_given(data, data$rdef2, data$rdef4 ,data$sex,data$age.bin)[n]
dep.matrix[2,5] <- chisq_given(data, data$rdef2, data$rdef5 ,data$sex,data$age.bin)[n]
dep.matrix[2,6] <- chisq_given(data, data$rdef2, data$rdef6 ,data$sex,data$age.bin)[n]
dep.matrix[2,7] <- chisq_given(data, data$rdef2, data$rdef7 ,data$sex,data$age.bin)[n]
dep.matrix[2,8] <- chisq_given(data, data$rdef2, data$rdef8 ,data$sex,data$age.bin)[n]
dep.matrix[3,1] <- chisq_given(data, data$rdef3, data$rdef1 ,data$sex,data$age.bin)[n]
dep.matrix[3,2] <- chisq_given(data, data$rdef3, data$rdef2 ,data$sex,data$age.bin)[n]
dep.matrix[3,3] <- chisq_given(data, data$rdef3, data$rdef3 ,data$sex,data$age.bin)[n]
dep.matrix[3,4] <- chisq_given(data, data$rdef3, data$rdef4 ,data$sex,data$age.bin)[n]
dep.matrix[3,5] <- chisq_given(data, data$rdef3, data$rdef5 ,data$sex,data$age.bin)[n]
dep.matrix[3,6] <- chisq_given(data, data$rdef3, data$rdef6 ,data$sex,data$age.bin)[n]
dep.matrix[3,7] <- chisq_given(data, data$rdef3, data$rdef7 ,data$sex,data$age.bin)[n]
dep.matrix[3,8] <- chisq_given(data, data$rdef3, data$rdef8 ,data$sex,data$age.bin)[n]
dep.matrix[4,1] <- chisq_given(data, data$rdef4, data$rdef1 ,data$sex,data$age.bin)[n]
dep.matrix[4,2] <- chisq_given(data, data$rdef4, data$rdef2 ,data$sex,data$age.bin)[n]
dep.matrix[4,3] <- chisq_given(data, data$rdef4, data$rdef3 ,data$sex,data$age.bin)[n]
dep.matrix[4,4] <- chisq_given(data, data$rdef4, data$rdef4 ,data$sex,data$age.bin)[n]
dep.matrix[4,5] <- chisq_given(data, data$rdef4, data$rdef5 ,data$sex,data$age.bin)[n]
dep.matrix[4,6] <- chisq_given(data, data$rdef4, data$rdef6 ,data$sex,data$age.bin)[n]
dep.matrix[4,7] <- chisq_given(data, data$rdef4, data$rdef7 ,data$sex,data$age.bin)[n]
dep.matrix[4,8] <- chisq_given(data, data$rdef4, data$rdef8 ,data$sex,data$age.bin)[n]
dep.matrix[5,1] <- chisq_given(data, data$rdef5, data$rdef1 ,data$sex,data$age.bin)[n]
dep.matrix[5,2] <- chisq_given(data, data$rdef5, data$rdef2 ,data$sex,data$age.bin)[n]
dep.matrix[5,3] <- chisq_given(data, data$rdef5, data$rdef3 ,data$sex,data$age.bin)[n]
dep.matrix[5,4] <- chisq_given(data, data$rdef5, data$rdef4 ,data$sex,data$age.bin)[n]
dep.matrix[5,5] <- chisq_given(data, data$rdef5, data$rdef5 ,data$sex,data$age.bin)[n]
dep.matrix[5,6] <- chisq_given(data, data$rdef5, data$rdef6 ,data$sex,data$age.bin)[n]
dep.matrix[5,7] <- chisq_given(data, data$rdef5, data$rdef7 ,data$sex,data$age.bin)[n]
dep.matrix[5,8] <- chisq_given(data, data$rdef5, data$rdef8 ,data$sex,data$age.bin)[n]
dep.matrix[6,1] <- chisq_given(data, data$rdef6, data$rdef1 ,data$sex,data$age.bin)[n]
dep.matrix[6,2] <- chisq_given(data, data$rdef6, data$rdef2 ,data$sex,data$age.bin)[n]
dep.matrix[6,3] <- chisq_given(data, data$rdef6, data$rdef3 ,data$sex,data$age.bin)[n]
dep.matrix[6,4] <- chisq_given(data, data$rdef6, data$rdef4 ,data$sex,data$age.bin)[n]
dep.matrix[6,5] <- chisq_given(data, data$rdef6, data$rdef5 ,data$sex,data$age.bin)[n]
dep.matrix[6,6] <- chisq_given(data, data$rdef6, data$rdef6 ,data$sex,data$age.bin)[n]
dep.matrix[6,7] <- chisq_given(data, data$rdef6, data$rdef7 ,data$sex,data$age.bin)[n]
dep.matrix[6,8] <- chisq_given(data, data$rdef6, data$rdef8 ,data$sex,data$age.bin)[n]
dep.matrix[7,1] <- chisq_given(data, data$rdef7, data$rdef1 ,data$sex,data$age.bin)[n]
dep.matrix[7,2] <- chisq_given(data, data$rdef7, data$rdef2 ,data$sex,data$age.bin)[n]
dep.matrix[7,3] <- chisq_given(data, data$rdef7, data$rdef3 ,data$sex,data$age.bin)[n]
dep.matrix[7,4] <- chisq_given(data, data$rdef7, data$rdef4 ,data$sex,data$age.bin)[n]
dep.matrix[7,5] <- chisq_given(data, data$rdef7, data$rdef5 ,data$sex,data$age.bin)[n]
dep.matrix[7,6] <- chisq_given(data, data$rdef7, data$rdef6 ,data$sex,data$age.bin)[n]
dep.matrix[7,7] <- chisq_given(data, data$rdef7, data$rdef7 ,data$sex,data$age.bin)[n]
dep.matrix[7,8] <- chisq_given(data, data$rdef7, data$rdef8 ,data$sex,data$age.bin)[n]
dep.matrix[8,1] <- chisq_given(data, data$rdef8, data$rdef1 ,data$sex,data$age.bin)[n]
dep.matrix[8,2] <- chisq_given(data, data$rdef8, data$rdef2 ,data$sex,data$age.bin)[n]
dep.matrix[8,3] <- chisq_given(data, data$rdef8, data$rdef3 ,data$sex,data$age.bin)[n]
dep.matrix[8,4] <- chisq_given(data, data$rdef8, data$rdef4 ,data$sex,data$age.bin)[n]
dep.matrix[8,5] <- chisq_given(data, data$rdef8, data$rdef5 ,data$sex,data$age.bin)[n]
dep.matrix[8,6] <- chisq_given(data, data$rdef8, data$rdef6 ,data$sex,data$age.bin)[n]
dep.matrix[8,7] <- chisq_given(data, data$rdef8, data$rdef7 ,data$sex,data$age.bin)[n]
dep.matrix[8,8] <- chisq_given(data, data$rdef8, data$rdef8 ,data$sex,data$age.bin)[n]

dep.matrix.rbsp = matrix(1,8)
dep.matrix.rbsp[1,1]<-chisq_given(data, data$rsbp.bin, data$rdef1 ,data$sex,data$age.bin)[3]
dep.matrix.rbsp[2,1]<-chisq_given(data, data$rsbp.bin, data$rdef2 ,data$sex,data$age.bin)[3]
dep.matrix.rbsp[3,1]<-chisq_given(data, data$rsbp.bin, data$rdef3 ,data$sex,data$age.bin)[3]
dep.matrix.rbsp[4,1]<-chisq_given(data, data$rsbp.bin, data$rdef4 ,data$sex,data$age.bin)[3]
dep.matrix.rbsp[5,1]<-chisq_given(data, data$rsbp.bin, data$rdef5 ,data$sex,data$age.bin)[3]
dep.matrix.rbsp[6,1]<-chisq_given(data, data$rsbp.bin, data$rdef6 ,data$sex,data$age.bin)[3]
dep.matrix.rbsp[7,1]<-chisq_given(data, data$rsbp.bin, data$rdef7 ,data$sex,data$age.bin)[3]
dep.matrix.rbsp[8,1]<-chisq_given(data, data$rsbp.bin, data$rdef8 ,data$sex,data$age.bin)[3]


chisq.test(  data$rxhep,  data$rxasp )


source("funcitons.R")
chisq_given(data, data$occode, data$sex ,data$tacs,data$pacs,data$pocs,data$lacs,data$oth,data$rxhep,data$rxasp,data$ddiagha)


pchisq(7.181912e+02  ,2.100000e+01,lower.tail = F)
