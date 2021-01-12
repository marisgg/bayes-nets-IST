library(bnlearn)
library(dagitty)
library(qgraph)




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
str_graph = tolower(str_graph)
golden_network = model2network(toString(dagitty(str_graph),"bnlearn"))



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

dataset = read.csv("IST_corrected_processed.csv")
dataset = dataset[ , -which(names(dataset) %in% c("ddiagun","dnostrk"))]

names(golden_network$nodes) = tolower(names(golden_network$nodes))
names(dataset) = tolower(names(dataset))

dataset$age = cut(dataset$age, breaks = c(-Inf,seq(-1,99,by=10),Inf),labels=seq(-10,100,by=10))
dataset$age = as.numeric(dataset$age)

dataset$rsbp = cut(dataset$rsbp, breaks = c(-Inf,seq(50,300,by=25),Inf),labels=seq(50-25,300,by=25))
dataset$rsbp = as.numeric(dataset$rsbp)

df = data.frame(dataset)




col_names <- names(df)
# to do it for some names in a vector named 'col_names'
df[col_names] <- lapply(df[col_names] , factor)
#cextend
#smc-x2
DAG_X2 = pc.stable(df,test="x2",alpha=0.05,B=1000,undirected = FALSE,debug=FALSE)
DAG_SMC_X2 = pc.stable(df,test="mc-x2",alpha=0.05,B=1000,undirected = FALSE,debug=FALSE)
#plot(DAG)

golden_network.graph = graphviz.plot(golden_network,shape = "rectangle")
DAG_X2.graph = graphviz.plot(DAG_X2,shape = "rectangle")
DAG_SMC_X2.graph = graphviz.plot(DAG_SMC_X2,shape = "rectangle")

#DAG.graph@renderInfo@nodes = golden_network.graph@renderInfo@nodes


ham_dist_x2 = hamming(golden_network,DAG_X2)
shd_dist_x2 = shd(golden_network,DAG_X2)
ham_dist_smc = hamming(golden_network,DAG_SMC_X2)
shd_dist_smc = shd(golden_network,DAG_SMC_X2)

renderGraph(DAG_SMC_X2.graph)
renderGraph(DAG_X2.graph)
renderGraph(golden_network.graph)
