#앙상블 모형: 여러 개의 분류모형에 의한 결과를 종합하여 분류의 정확도를 높이는 방법
#데이터를 조절하는 대표적인 방법은 배깅(bagging) 부스팅(boosting)
#bagging

library(adabag)
data(iris)
iris.bagging <- bagging(Species~.,data=iris,mfinal=10)
iris.bagging$importance
#bagging 함수는 배깅을 이용하여 분류를 수행함
# plot()함수를 통해 분류 결과를 트리 형태로 볼수 있다
plot(iris.bagging$trees[[10]])
text(iris.bagging$trees[[10]])

pred <- predict(iris.bagging,newdata = iris)
table(pred$class,iris$Species)

#부스팅: 배깅의 과정과 유사하나 붓스트랩 표본을 구성하는 재표본과정에서 각 자료에 동일한 확률을 부여하는 것이 아니라
#분류가 잘못된 데이터에 더 큰 가중을 주어 표본을 추출한다.

boo.adabag <- boosting(Species~.,data=iris,boos=TRUE,mfinal=100)
boo.adabag$importance

plot(boo.adabag$trees[[10]])
text(boo.adabag$trees[[10]])

pred <- predict(boo.adabag, newdata=iris)
tb<- table(pred$class,iris$Species)
tb

error.rpart <- 1-(sum(diag(tb))/sum(tb))
error.rpart

library(ada)
data(iris)
iris[iris$Species!="setosa",]->iris
n <- dim(iris)[1]

trind <- sample(1:n, floor(.6*n),FALSE)
teind <- setdiff(1:n,trind)

iris[,5]<-as.factor((levels(iris[,5])[2:3])[as.numeric(iris[,5])-1])

gdis <- ada(Species~.,data=iris[trind,],iter=20,nu=1,type="discrete")
gdis <- addtest(gdis,iris[teid,-5],iris[teind,5])
gdis

plot(gdis,TRUE,TRUE)

varplot(gdis)

pairs(gdis,iris[trind,-5],maxvar = 4)