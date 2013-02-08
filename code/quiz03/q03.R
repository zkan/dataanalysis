library(datasets)
data(iris)

myvars <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
irisSubset <- iris[myvars]

distIrisSubset <- dist(irisSubset)
hClustering <- hclust(distIrisSubset)
plot(hClustering)

table(cutree(hClustering, h = 3))


