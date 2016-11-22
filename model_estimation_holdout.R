#모델 평가를 위해 훈련용 및 테스트 데이터를 추출하는데 이방법에 여러가지 방법이 있다.
#먼저, holdout 방법 : 주어진 원천데이터에서 보통 70:30비율로 데이터를 랜덤추출하는 방법

data(iris)
nrow(iris)
set.seed(1234)
idx <- sample(2, nrow(iris),replace=TRUE,prob=c(0.7,0.3))
traindata <- iris[idx==1,]
testdata <- iris[idx==2,]
nrow(traindata)
nrow(testdata)
