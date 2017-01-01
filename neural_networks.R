library(nnet)
nn.iris <- nnet(Species~.,data=iris,size=2,rang=0.1,decay=5e-4,maxit=200)
summary(nn.iris)
library(devtools)

#library 설치 후 시각화, 시도 해봤는데 안됨
library(clusterGeneration)
library(scales)
library(reshape)
plot(nn.iris)

#소스를 연결해 plot 
source_url('http://gist.githubusercontent.com/Peque/41a9e20d6687f2f3108d/raw/85e14f3a292e126f1454864427e3a189c2fe33f3/nnet_plot_updata.r')
plot.nnet(nn.iris)

#신경망 모형에 대한 정오분류표(confusion matrix)
table(iris$Species, predict(nn.iris, iris, type="class"))
