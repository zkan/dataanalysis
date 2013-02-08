load("../data/input/quiz3question4.rda")

plot(dataSet)

kmeansObj <- kmeans(dataSet, centers = 2)
par(mar = rep(0.2, 4))
plot(dataSet$x, dataSet$y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:2, pch = 3, cex = 3, lwd = 3)

