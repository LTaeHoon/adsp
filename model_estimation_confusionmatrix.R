#오분류표를 통해 신경망 모형, 의사결정나무 모형 비교

iris <- subset(iris, Species=="setosa"|Species =="versicolor")
iris$Species <- factor(iris$Species)
set.seed(1234)
iris <- iris[sample(nrow(iris)),]
traindata <- iris[1:(nrow(iris)*0.7),]
testdata <- iris[((nrow(iris)*0.7)+1):nrow(iris),]
nrow(traindata)

library(nnet)
library(rpart)
nn.iris <- nnet(Species~.,data=traindata,size=2, rang=0.1, decay=5e-4,maxit=200)
dt.iris <- rpart(Species~.,data=traindata)

nn_pred <- predict(nn.iris, testdata, type="class")
dt_pred <- predict(dt.iris, testdata, type="class")

library(caret)
nn_con = confusionMatrix(nn_pred, testdata$Species)
dt_con = confusionMatrix(dt_pred, testdata$Species)

nn_con$table
dt_con$table

accuracy <-c(nn_con$overall["Accuracy"],dt_con$overall["Accuracy"]) # TP+TN/P+N
precision <-c(nn_con$byClass["Pos Pred Value"],dt_con$byClass["Pos Pred Value"])
recall <-c(nn_con$byClass["Sensitivity"],dt_con$byClass["Sensitivity"])
f1 <-2*((precision*recall)/(precision+recall))
result <- data.frame(rbind(accuracy,precision,recall,f1))
names(result)<-c("Nueral Network","Decision Tree")
result
