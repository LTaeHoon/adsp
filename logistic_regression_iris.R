data(iris)
a<- subset(iris, Species =="setosa" | Species == "versicolor")
a$Species <- factor(a$Species)
str(a)

b<- glm(Species~Sepal.Length,data=a,family = binomial)
summary(b)
coef(b)
exp(coef(b)['Sepal.Length'])

fitted(b)[c(1:5,96:100)]
predict(b, newdata=a[c(1,50,51,100),],type="response")

cdplot(Species~Sepal.Length, data=a)

plot(a$Sepal.Length,a$Species,xlab="Sepal.Length")
x=seq(min(a$Sepal.Length),max(a$Sepal.Length),0.1)
lines(x,1+(1/(1+(1/exp(-27.831+5.140*x)))),type="l",col="red")