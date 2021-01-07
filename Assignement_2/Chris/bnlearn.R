library(bnlearn)
library(dagitty)
library(qgraph)
dataset = read.csv("IST_corrected_processed.csv")
dataset = dataset[ , -which(names(dataset) %in% c("ddiagun","dnostrk"))]

dataset$age = cut(dataset$age, breaks = c(-Inf,seq(-1,99,by=10),Inf),labels=seq(-10,100,by=10))
dataset$age = as.numeric(dataset$age.bin)

dataset$rsbp = cut(dataset$rsbp, breaks = c(-Inf,seq(50,300,by=25),Inf),labels=seq(50-25,300,by=25))
dataset$rsbp = as.numeric(dataset$rsbp.bin)

df = data.frame(dataset)
col_names <- names(df)
# to do it for some names in a vector named 'col_names'
df[col_names] <- lapply(df[col_names] , factor)
#cextend
DAG = pc.stable(df,test="smc-x2",alpha=0.05,B=1000,undirected = FALSE,debug=FALSE)
#plot(DAG)

qgraph(DAG,curveAll = TRUE)
chisq.test(dataset$rdef4, dataset$rdef3)
