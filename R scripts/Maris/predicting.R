source("testing.R")
library(bnlearn)

dataset$age = cut(dataset$age, breaks = c(-Inf,seq(-1,99,by=10),Inf),labels=seq(-10,100,by=10))
dataset$age = as.numeric(dataset$age)

output_bin_age = localTests(graphLayout(network), dataset, type="cis.chisq")
printVariableOutputToLogFile("localTests_age_bin.log", output_bin_age)

dataset$rsbp = cut(dataset$rsbp, breaks = c(-Inf,seq(50,300,by=25),Inf),labels=seq(50-25,300,by=25))
dataset$rsbp = as.numeric(dataset$rsbp)

output_bin_age_rsbp = localTests(graphLayout(network), dataset, type="cis.chisq")
printVariableOutputToLogFile("localTests_age_rsbp_bin.log", output_bin_age_rsbp)

# dataset = dataset[ , -which(names(dataset) %in% c("age","rsbp"))]

variables <- occode ~ age + sex + rsbp + rxhep + rxasp

model.lr <- glm(variables,
                data=as.data.frame(dataset),
                family="binomial"
                )

model.optimal_bayes <- optimal_bayes(variables,
                                     data=as.data.frame(dataset)
                                     )

tbl <- expand.grid(sex=c(0,1), rxasp=c(0,1), rxhep=c(0,1), age=seq(-1, 99, by=10), rsbp=seq(50,300,by=25))

data.for.bnlearn <- as.data.frame(lapply(dataset, factor))
tbl.for.bnlearn <- as.data.frame(lapply(tbl, factor))

prob.lr <- predict( model.lr, newdata=tbl, type="response")
prob.optimal_bayes <- predict(model.optimal_bayes, newdata=tbl)[,2]


prob.lr

# BNLEARN model from dagitty

bn.net <- model2network(toString(network,"bnlearn"))
plot(bn.net)

m.bn <- bn.fit(bn.net, data.for.bnlearn)
prob.bn <- predict(m.bn, 
                   node="occode", 
                   data=tbl.for.bnlearn,
                   method="bayes-lw",
                   prob=TRUE,
                   n=10000
                   )
