#rpart패키지 rpart()를 사용한 의사결정트리 

library(rpart)
c<-rpart(Species~., data=iris)
c
plot(c,compress = T,margin = 0.3)
text(c, cex=1.5)

#의사결정트리를 시각화 하기위한 패키지 prp()
library(rpart.plot)
prp(c,type=4, extra=2)

#과적합을 막기 위해 적합한 트리 사이즈를 찾는 과정
#xerror가 가장 작은 cp값을 찾아 prune()를 통해 의사결정 모델 

ls(c)
opt <- which.min(c$cptable[,"xerror"])
opt
cp <- c$cptable[opt,"CP"]
prune.c <- prune(c, cp=cp)
plot(prune.c)
text(prune.c,use.n=T)

plotcp(c)