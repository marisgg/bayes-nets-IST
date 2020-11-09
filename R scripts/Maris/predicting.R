source("testing.R")
library(bnlearn)

dataset$age.bin = cut(dataset$age, breaks = c(-Inf,seq(-1,99,by=10),Inf),labels=seq(-10,100,by=10))
dataset$age.bin = as.numeric(dataset$age.bin)

dataset$rsbp.bin = cut(dataset$rsbp, breaks = c(-Inf,seq(50,300,by=25),Inf),labels=seq(50-25,300,by=25))
dataset$rsbp.bin = as.numeric(dataset$rsbp.bin)

dataset = dataset[ , -which(names(dataset) %in% c("age","rsbp"))]

variables <- occode ~ age.bin + sex + rsbp.bin + rxhep + rxasp

model.lr <- glm(variables,
                data=dataset,
                family="binomial"
                )

model.optimal_bayes <- optimal_bayes(variables,
                                     data=dataset
                                     )

tbl <- expand.grid(sex=c(0,1), rxasp=c(0,1), rxhep=c(0,1), age.bin=seq(-1, 99, by=10), rsbp.bin=seq(50,300,by=25))

data.for.bnlearn <- as.data.frame(lapply(dataset, factor))
tbl.for.bnlearn <- as.data.frame(lapply(tbl, factor))

prob.lr <- predict( model.lr, newdata=tbl, type="response")
prob.optimal_bayes <- predict(model.optimal_bayes, newdata=tbl)[,2]

# How to get BNLEARN model from dagitty?
