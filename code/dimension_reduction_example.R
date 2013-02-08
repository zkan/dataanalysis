set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

# Cluster the data
par(mar = rep(0.2, 4))
heatmap(dataMatrix)

# Add a pattern 
set.seed(678910)
for(i in 1:40) {
    # flip a coin
    coinFlip <- rbinom(1, size = 1, prob = 0.5)
    # if coin is heads add a common pattern to that row
    if(coinFlip) {
        dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5)
    }
}

par(mar = rep(0.2, 4)
heatmap(dataMatrix)

hh <- hclus(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]
plot(rowMeans(dataMatrixOrder), 40:1, , xlab = "Row", ylab = "Row Mean", pch = 19)
plot(colMeans(dataMatrixOrder), xlab = "Column", ylab = "Column Mean", pch = 19)

svd1 <- svd(scale(dataMatrixOrdered))
names(svd1)
pca1 <- prcomp(dataMatrixOrdered, scale = TRUE)
plot(pca1$rotaion[, 1], svd1$v[, 1], pch = 19)

# one way to deal with missing values -- use imputing
library(impute)
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100, size = 40, replace = F)] <- NA
dataMatrix2 <- impute.knn(dataMatrix2)$data
svd1 <- svd(scale(dataMatrixOrdered))
svd2 <- svd(scale(dataMatrix2))
par(mfrow = c(1, 2))
plot(svd1$v[, 1], pch = 19)
plot(svd2$v[, 1], pch = 19)





