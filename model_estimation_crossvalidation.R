#교차검증

data(iris)
set.seed(1234)
k=10
sample(nrow(iris))
iris<-iris[sample(nrow(iris)),]
fold <- cut(seq(1,nrow(iris)),breaks=k,labels=FALSE) #k개로 나누는 작업
traindata = list(0)
testdata = list(0)
for(i in 1:k){
  testIdx <- which(fold==i,arr.ind = TRUE)
  testdata[[i]] <- iris[testIdx,]
  traindata[[i]]<-iris[-testIdx,]
  
}
head(testdata[[1]])
head(traindata[[1]])

