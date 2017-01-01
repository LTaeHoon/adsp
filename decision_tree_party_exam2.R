library(party)
airq <- subset(airquality, !is.na(Ozone))
head(airq)

airct <- ctree(Ozone~.,data=airq)
airct

plot(airct)

head(predict(airct, data=airq))

#자료가 속하는 해당 최종마디의 번호출력
predict(airct, data=airq,type='node')

