library("bnlearn")
library("pcalg")

data = read.csv("IST_corrected_processed.csv")



data(data)
V <- colnames(data$rdef1)
## define sufficient statistics
suffStat <- list(dm = data$rdef1, nlev = c(0,1), adaptDF = FALSE)

suffStat = list(C = cor(data), n = nrow(data))
## estimate CPDAG
GM <- pcalg::pc(suffStat,
           ## independence test: G^2 statistic
           indepTest = gaussCItest, alpha = 0.05, p=ncol(data),labels =colnames(data), verbose = TRUE)

plot(GM)

