#1973~1974년도에 생상된 32종류의 자동차에 대한 11개 변수값을 측정한 데이터
attach(mtcars)
str(mtcars)

# 이항 변수 vs(0:flat engine, 1:straight engine)를 반응변수로, mpg와 am을 예측변수로 하는 로지스틱 회귀모형을 이용
glm.vs <- glm(vs~mpg+am,data=mtcars,family = binomial)
summary(glm.vs)
str(glm.vs)

#예측 변수가 여러개인 모형의 적합시 변수선택법을 적용하기 위해서는 direction=옵션을 사용한다.
#direction옵션에는 "both","backward","forward"가 있으며, 디폴트는 "backward"이다.
step.vs<- step(glm.vs,direction = "backward")

#glm()함수의 결과를 ls(), str()를 통해 확인할 수 있다.
ls(glm.vs) 
str(glm.vs)

#anova()함수는 모형의 적합(변수가 추가되는) 단계별로 이탈도의 감소량과 유의성 검정 결과를 제시해준다.
anova(glm.vs, test="Chisq")
1-pchisq(18.327,1)
1-pchisq(4.887,1)

