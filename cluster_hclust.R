#군집분석- hclust()를 이용하여 계층적 군집을 수행한다

data("USArrests")
str(USArrests)
d <- dist(USArrests, method = "euclidean")
fit <- hclust(d, method = "ave")
par(mfrow=c(1,2))
plot(fit)
plot(fit, hang=-1)
par(mfrow=c(1,1))
groups <- cutree(fit, k=6)
groups

plot(fit)
rect.hclust(fit,k=6,border = "red")

hca <- hclust(dist(USArrests))
plot(hca)
rect.hclust(hca, k=3, border="red")
rect.hclust(hca, h=50, which=c(2,7),border = 3:4)
