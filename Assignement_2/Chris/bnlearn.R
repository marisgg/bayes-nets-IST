library(bnlearn)
library(dagitty)
library(qgraph)
dataset = read.csv("C:\\Users\\mosse\\Documents\\GitHub\\bayes-nets-IST\\Assignement_2\\Chris\\IST_corrected_processed.csv")
dataset = dataset[ , -which(names(dataset) %in% c("ddiagun","dnostrk"))]
df = data.frame(dataset)
col_names <- names(df)
# to do it for some names in a vector named 'col_names'
df[col_names] <- lapply(df[col_names] , factor)

DAG = pc.stable(df,test="x2",alpha=1,undirected = FALSE,max.sx = 100)
#plot(DAG)

qgraph(DAG,curveAll = TRUE)
chisq.test(dataset$rdef4, dataset$rdef3)
