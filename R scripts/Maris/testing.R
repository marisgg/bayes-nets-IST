library(dagitty)
library(bayesianNetworks)
library(dagitty)

# Read network dag definition from file and parse using daggity
dag_string <- readr::read_file('../network.txt')
dag_string <- tolower(dag_string)
network <- dagitty(dag_string)
plot(network)

impliedConditionalIndependencies(network)

# Read and hotfix dataset
dataset <- read.csv('../../IST_corrected_processed.csv')
dataset = dataset[ , -which(names(dataset) %in% c("ddiagun","dnostrk"))]
names(dataset) <- tolower(names(dataset))

# Should be independent due to randomisation
chisq.test(dataset$rxasp, dataset$rxhep)

# Two independencies from implied independencies
# TODO: see warning
chisq.test(dataset$age, dataset$rxasp)
chisq.test(dataset$age, dataset$rxhep)

# this doesn't work with a dataset this big
localTests(graphLayout(network), dataset, type="cis.chisq")

# Stubbed code from the companion
chisq <- 0; df <- 0
for(x in unique(dataset$ddia)) {
  tst <- chisq.test(dataset$oth[dataset$ddia==x], dataset$sex[dataset$ddia==x])
  chisq <- chisq + tst$statistic
  df <- df + tst$parameter
}
chisq; df
