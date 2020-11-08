library(rlist)
chisq_given <- function(data,x,y,...)
{
  chisq <- 0 ; df <- 0
  values.dep = list(...)
  values.dep.u <- list()
  for(e in list(...))
  {
    values.dep.u  <- list.append(values.dep.u,sort(unique(e)))
  }
  
  cmbs <- expand.grid(values.dep.u)
  
  for(row in 1:nrow(cmbs))
  {
    prb.marginal <- (values.dep[[1]]==cmbs[row,1]) 
    prb.marginal <- prb.marginal & (values.dep[[2]]==cmbs[row,2]) 
    
    cmbx = x[prb.marginal]
    cmby = y[prb.marginal]
    #print(sum(prb.marginal))
    if((length(unique(cmbx))>1) && (length(unique(cmby))>1))
    {
      tst <- chisq.test(  cmbx,  cmby )
      chisq <- chisq + tst$statistic
      df <- df + tst$parameter
    }
  }
  
  
  #print(chisq);print(df);print(pchisq(chisq,df=df,lower.tail = FALSE))
  return(c(chisq,df,pchisq(chisq,df=df,lower.tail = FALSE)))
}