library(ElemStatLearn)
data(zip.train)

im8 = zip2image(zip.train, 8)
im18 = zip2image(zip.train, 18)

svd8 <- svd(im8)
svd18 <- svd(im18)

par(mfrow = c(2, 2))
image(im8)
image(im18)
plot(svd8$d^2/sum(svd8$d^2), xlab = "Column", ylab = "Percent of variance explained", pch = 19)
plot(svd18$d^2/sum(svd18$d^2), xlab = "Column", ylab = "Percent of variance explained", pch = 19)


