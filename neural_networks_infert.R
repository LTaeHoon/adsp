data(infert,package = "datasets")
str(infert)
install.packages("neuralnet")
library(neuralnet)
net.infert <- neuralnet(case~age+parity+induced+spontaneous, data=infert, hidden=2,err.fct="ce",linear.output=FALSE,likelihood=TRUE)
net.infert
plot(net.infert)

names(net.infert)

