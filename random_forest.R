#랜덤 포레스트 예제
install.packages("randomForest")
library(randomForest)
library(rpart)
data(stagec)
stagec3 <- stagec[complete.cases(stagec),]
set.seed(1234)
ind <- sample(2,nrow(stagec3),replace=TRUE,prob=c(0.7,0.3))
traindata <- stagec3[ind==1,]
testdata <- stagec3[ind==2,]
rf <- randomForest(ploidy~.,data=traindata,ntree=100,proximity=TRUE)
table(predict(rf),traindata$ploidy)
print(rf)
