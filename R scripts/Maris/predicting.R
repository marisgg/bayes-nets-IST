source("testing.R")

bn.dataset <- read.csv("../../IST_corrected_processed.csv",colClasses=rep("double",4))
bn.dataset <- bn.dataset[ , -which(names(bn.dataset) %in% c("ddiagun","dnostrk"))]
names(bn.dataset) <- tolower(names(bn.dataset))

library(dagitty)
dag_string <- readr::read_file('../network.txt')
dag_string <- tolower(dag_string)
network <- dagitty(dag_string)

library(bnlearn)

bn.dataset$age = cut(bn.dataset$age, breaks = c(-Inf,seq(-1,99,by=10),Inf),labels=seq(-10,100,by=10))
bn.dataset$age = as.numeric(bn.dataset$age)

dataset$age = cut(dataset$age, breaks = c(-Inf,seq(-1,99,by=10),Inf),labels=seq(-10,100,by=10))
dataset$age = as.numeric(dataset$age)

# output_bin_age = localTests(graphLayout(network), bn.dataset, type="cis.chisq")
# printVariableOutputToLogFile("localTests_age_bin.log", output_bin_age)

bn.dataset$rsbp = cut(bn.dataset$rsbp, breaks = c(-Inf,seq(50,300,by=25),Inf),labels=seq(50-25,300,by=25))
bn.dataset$rsbp = as.numeric(bn.dataset$rsbp)

dataset$rsbp = cut(dataset$rsbp, breaks = c(-Inf,seq(50,300,by=25),Inf),labels=seq(50-25,300,by=25))
dataset$rsbp = as.numeric(dataset$rsbp)

# output_bin_age_rsbp = localTests(graphLayout(network), bn.dataset, type="cis.chisq")
# printVariableOutputToLogFile("localTests_age_rsbp_bin.log", output_bin_age_rsbp)

# bn.dataset = bn.dataset[ , -which(names(bn.dataset) %in% c("age","rsbp"))]


# 
# model.optimal_bayes <- optimal_bayes(variables,
#                                      data=as.data.frame(bn.dataset)
#                                      )
# 
# tbl <- expand.grid(sex=c(0,1), rxasp=c(0,1), rxhep=c(0,1), age=seq(-1, 99, by=10), rsbp=seq(50,300,by=25))
# 
# data.for.bnlearn <- as.data.frame(lapply(bn.dataset, as.factor))
# tbl.for.bnlearn <- as.data.frame(lapply(tbl, as.factor))
# 
# prob.lr <- predict( model.lr, newdata=tbl, type="response")
# prob.optimal_bayes <- predict(model.optimal_bayes, newdata=tbl)[,2]
# 
# 
# prob.lr

# SPLIT DATA IN TO TRAINING AND TEST

require(caTools)

set.seed(123) 
sample = sample.split(bn.dataset[,1], SplitRatio = .75)
train.bn = subset(bn.dataset, sample == TRUE)
test.bn  = subset(bn.dataset, sample == FALSE)

sample = sample.split(dataset[,1], SplitRatio = .75)
train = subset(dataset, sample == TRUE)
test  = subset(dataset, sample == FALSE)

# LR

variables <- occode ~ age + sex + rsbp + rxhep + rxasp + ddead + dpe + drsh + drsisc + ddiagisc + ddiagha
variables_less <- occode ~ age + sex + rsbp + rxhep + rxasp
lrdisc <- ddiagisc ~ age + sex + rxasp + rxhep
# variables <- ddiagisc ~ age + rxasp + rxhep

model.lr <- glm(variables_less,
                data=as.data.frame(train),
                family="binomial"
)

ddiagisc.lr <- glm(lrdisc,
                data=as.data.frame(train),
                family="binomial"
)

# BNLEARN model from dagitty

bn.net <- model2network(toString(network,"bnlearn"))
# plot(bn.net)

# m.bn <- bn.fit(bn.net, data.for.bnlearn)
# prob.bn <- predict(m.bn, 
#                    node="occode", 
#                    data=tbl.for.bnlearn,
#                    method="bayes-lw",
#                    prob=TRUE,
#                    n=10000
#                    )


train.fit <- bn.fit(bn.net, (as.data.frame(lapply(train,factor))))
fit <- bn.fit(bn.net, train.bn)

fit.chris <- bn.fit(bn.net, as.data.frame((bn.dataset)))
fit.prob.chris <- 

# predict(fit, node="ddiagisc", data=data.frame(age=as.double(1:100),ddead=0,rxasp=0,rxhep=0,dpe=0,drsh=0,drsisc=0))

vals = as.double(c(0,1))

# CHRIS

dataframe.chris = data.frame(expand.grid(age=as.double(seq(-10,100,by=10)),sex=vals,rxasp=vals,rxhep=vals))
p.chris = predict(fit.chris,node="ddiagisc",method="bayes-lw",data=dataframe.chris)
p.prob.chris = predict(fit.chris,node="ddiagisc",method="bayes-lw",data=dataframe.chris)
p.lr.chris = predict(ddiagisc.lr, newdata=dataframe.chris, type="response")
plot(p.chris, col="red")
plot(p.chris)
plot(p.lr.chris)
points(p.lr.chris, col="blue")
# END CHRIS

dataframe = data.frame(expand.grid(age=as.double(seq(-10,100,by=10)),sex=vals,rxasp=vals,rxhep=vals))
dataframe_14 = data.frame(expand.grid(
  age=as.double(seq(-1, 99, by=10)),sex=vals,rxasp=vals,rxhep=vals,dpe=vals,drsh=vals,drsisc=vals,ddead=vals,dpe=vals))
prob.lr.morevar <- predict(model.lr, newdata=test, type="response")
prob.lr <- predict(model.lr, newdata=test, type="response")
new.p = predict(train.fit,node="occode",method="bayes-lw",data=as.data.frame(lapply(test,factor)),n=10000,prob=TRUE)
plot(new.p)
plot(attr(new.p, "prob")[2,], 
     xlab="Patient", ylab="OCCODE")
title(main="OCCODE prediction (Bayesian Inference)")
plot(prob.lr, 
     xlab="Patient", ylab="OCCODE")
title(main="OCCODE prediction (Linear Regression)")
p.ddiagisc = predict(fit,node="ddiagisc",method="bayes-lw",data=test.bn,n=10000) 
p.lr.ddiagisc

# occode.p.bn <- attr(p, 'prob')[2,]
# plot(occode.p.bn)
# plot(dataset$occode)
# 
# p
# plot(p)
# prob.lr
# plot(prob.lr)


