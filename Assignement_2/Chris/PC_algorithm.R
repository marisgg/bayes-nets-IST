library("bnlearn")
library("pcalg")
library("qgraph")
data = read.csv("IST_corrected_processed.csv")


data = data[ , -which(names(data) %in% c("ddiagun","dnostrk"))]

rdef1=0+1
rdef2=1+1
rdef3=2+1
rdef4=3+1
rdef5=4+1
rdef6=5+1
rdef7=6+1
rdef8=7+1
rxasp=8+1
rxhep=9+1
ddiagisc=10+1
ddiagha=11+1
ddiagun=12+1
dnostrk=13+1
drsisc=14+1
drsh=15+1
dpe=16+1
ddead=17+1
age=18+1
sex=19+1
rsbp=20+1
occode=21+1
LACS=22+1
OTH=23+1
PACS=24+1
POCS=25+1
TACS=26+1

GMlayout = layout=matrix(-1,100,100)


GMlayout[10,1] = sex
GMlayout[10,2] = age
GMlayout[10,3] = rsbp
GMlayout[20,1] = rdef1
GMlayout[20,2] = rdef2
GMlayout[20,3] = rdef3
GMlayout[20,4] = rdef4
GMlayout[20,5] = rdef5
GMlayout[20,6] = rdef6
GMlayout[20,7] = rdef7
GMlayout[20,8] = rdef8
GMlayout[30,1] = ddiagha
GMlayout[30,2] = ddiagisc
GMlayout[40,1] = TACS
GMlayout[40,2] = PACS
GMlayout[40,3] = POCS
GMlayout[40,4] = LACS
GMlayout[40,5] = OTH
GMlayout[50,1] = rxasp
GMlayout[50,2] = dpe
GMlayout[50,3] = rxhep
GMlayout[60,1] = drsisc
GMlayout[60,2] = drsh
GMlayout[70,1] = ddead
GMlayout[80,1] = occode

GMlayout[90,1] = dnostrk
GMlayout[90,2] = ddiagun






suffStat = list(C = cor(data), n = nrow(data))
## estimate CPDAG
GM <- pc(suffStat,
                ## independence test: G^2 statistic
                indepTest = gaussCItest , alpha = 0.05, p=ncol(data),labels =colnames(data), verbose = TRUE)


curvelayout = matrix(0,28,28)
qgraph(GM,layout = GMlayout,curve=0,curveAll = TRUE)

