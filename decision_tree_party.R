#party패키지 ctree()함수를 이용하여 의사결정나무모형

#146명의 전립선 암환자의 자료. 7개의 예측변수를 이용하여 범주형의 반응변수(ploidy)
library(party)
data("stagec")
str(stagec)

#결측값 제거 과정
stagec1 <- subset(stagec, !is.na(g2))
stagec2 <- subset(stagec1, !is.na(gleason))
stagec3 <- subset(stagec2, !is.na(eet))
str(stagec3)

#train, test 자료 분리
library(caret)
set.seed(1234)
ind <- createDataPartition(y=stagec3$ploidy,p=0.7, list=FALSE)
train <- stagec3[ind,]
test <-stagec3[-ind,]

#train 자료에 ctree() 적용
tree <- ctree(ploidy~.,data=train)
tree
plot(tree)

testPred <- predict(tree,newdata=test)
table(testPred,test$ploidy)
