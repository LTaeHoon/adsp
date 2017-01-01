library(cluster)
agn1 <- agnes(USArrests, metric = "manhattan", stand=TRUE)
agn1
par(mfrow=c(1,2))
plot(agn1)

agn2 <- agnes(daisy(USArrests),diss = TRUE,method = "complete")
plot(agn2)

agn3 <- agnes(USArrests, method = "flexible", par.meth=0.6)
plot(agn3)
par(mfrow=c(1,1))