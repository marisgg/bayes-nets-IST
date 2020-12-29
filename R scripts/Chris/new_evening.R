library(dagitty)
library(bnlearn)


str_graph = 'dag {
age [pos="-0.231,-1.360"]
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
age -> rdef1
age -> rdef2
age -> rdef3
age -> rdef4
age -> rdef5
age -> rdef6
age -> rdef7
age -> rdef8
age -> rsbp
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


g2 <- dagitty(tolower(str_graph))

plot(g2)

net <- model2network(toString(g,"bnlearn"))
net2 <- model2network(toString(g2,"bnlearn"))

data <- read.csv("grades.csv",colClasses=rep("double",4))
data2 <- read.csv("IST_corrected_processed.csv",colClasses=rep("double",4))
data2 <- data2[ , -which(names(data2) %in% c("ddiagun","dnostrk"))]
names(data2) <- tolower(names(data2))

age.bin = cut(data2$age, breaks = c(-Inf,seq(-1,99,by=10),Inf),labels=seq(-10,100,by=10))
age.bin
data2$age <- age.bin

#
sort(names(data2))
sort(names(g2))
sort(names(net2$nodes))

#
fit2 <- bn.fit(net2, as.data.frame(scale(data2)))

predict(fit2,node="occode", data=data.frame(Age=as.double(1:100),ddead=0,rxasp=0,rxhep=0,dpe=0,drsh=0,drsisc=0))


dataframe = data.frame(expand.grid(age=as.double(1:10)*10))
#dataframe = as.data.frame(expand.grid(sex=c(0,1),rxhep=c(0,1),ddead=0, dpe=0, drsh=0, drsisc=0, rxasp=0))
p.isc = predict(fit2,node="ddiagisc",method="bayes-lw",data=dataframe,n=10000)#data.frame(age=as.double(1:100),ddead=0,rxasp=0,rxhep=0,dpe=0,drsh=0,drsisc=0))
p.ha = predict(fit2,node="ddiagha",method="bayes-lw",data=dataframe,n=10000)#data.frame(age=as.double(1:100),ddead=0,rxasp=0,rxhep=0,dpe=0,drsh=0,drsisc=0))
p.tot = p.isc+p.ha


plot(p.isc,col='red')
plot(p.ha,col='blue',add=TRUE)


ylim(-1,1)
plot(x=p.isc,col='red',,pch=19, cex=2,ylim=range(c(-1,1)),main="Probability of getting ischaemic and hemorrhagic stroke with age",xlab="AGE CATEGORY (10-20 ... 90-100) ", sub="ISCEAMIC STROKE (red), HEAMORIC STROKE (blue), TOTAL (green)", ylab="prob" )
points(p.ha,col='blue',pch=19, cex=2)
points(p.tot,col='darkgreen',pch=19, cex=2)

options(max.print=100000)


d_isc = c()
d_ha = c()

for(un in unique(data2$age))
{
  nr = as.numeric(un)
  l_age = length(data2$age[data2$age==nr])
  l_isc_age = length(data2$age[data2$ddiagisc == 1 & data2$age==nr])
  l_he_age = length(data2$age[data2$ddiagha == 1 & data2$age==nr])
  print(c(l_age,l_isc_age,l_he_age,l_isc_age/l_age,l_he_age/l_age))
  d_isc <- append(d_isc,l_isc_age/l_age)
  d_ha <- append(d_ha,l_he_age/l_age)
}

plot(d_isc,ylim=range(c(0,1)))
plot(d_ha)





