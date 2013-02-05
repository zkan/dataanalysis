# Example graph plot

pData <- read.csv("../data/input/ss06pid.csv")

# Boxplots

boxplot(pData$AGEP, col = "blue")

boxplot(pData$AGEP ~ as.factor(pData$DDRS), col = "blue")

boxplot(pData$AGEP ~ as.factor(pData$DDRS), col = c("blue", "orange"), names = c("yes", "no"), varwidth = TRUE)

# Barplots

barplot(table(pData$CIT), col = "blue")

# Histograms

hist(pData$AGEP, col = "blue")

hist(pData$AGEP, col = "blue", breaks = 100, main = "Age")

# Density plots

dens <- density(pData$AGEP)
plot(dens, lwd = 3, col = "blue") # lwd -- line thickness

dens <- density(pData$AGEP)
densMales <- density(pData$AGEP[which(pData$SEX == 1)])
plot(dens, lwd = 3, col = "blue")
lines(densMales, lwd = 3, col = "orange")

# Scatterplots

plot(pData$JWMNP, pData$WAGP, pch = 19, col = "blue") # pch = 19 -- close circle

plot(pData$JWMNP, pData$WAGP, pch = 19, col = "blue", cex = 0.5) # cex -- size of the point

plot(pData$JWMNP, pData$WAGP, pch = 19, col = pData$SEX, cex = 0.5)

percentMaxAge <- pData$AGEP / max(pData$AGEP)
plot(pData$JWMNP, pData$WAGP, pch = 19, col = "blue", cex = percentMaxAge * 0.5)

plot(pData$JWMNP, pData$WAGP, pch = 19, col = "blue", cex = 0.5)
lines(rep(100, dim(pData)[1]), pData$WAGP, col = "grey", lwd = 5)
points(seq(0, 200, length = 100), seq(0, 20e5, length = 100), col = "red", pch = 19)

library(Hmisc)
ageGroups <- cut2(pData$AGEP, g = 5)
plot(pData$JWMNP, pData$WAGP, pch = 19, col = ageGroups, cex = 0.5)

x <- rnorm(1e5)
y <- rnorm(1e5)
sampledValues <- sample(1:1e5, size = 1000, replace = FALSE)
plot(x[sampledValues], y[sampledValues], pch = 19)

smoothScatter(x, y)

library(hexbin)
hbo <- hexbin(x, y)
plot(hbo)

# QQ-plots

x <- rnorm(20)
y <- rnorm(20)
qqplot(x, y)
abline(c(0, 1)) # c(0, 1) means 45 degree line

# Matplot and spaghetti -- good when we wanna see time series data

X <- matrix(rnorm(20 * 5), nrow = 20)
matplot(X, type = "b")

# Heatmaps

image(1:10, 161:236, as.matrix(pData[1:10, 161:236]))

newMatrix <- as.matrix(pData[1:10, 161:236])
newMatrix <- t(newMatrix)[, nrow(newMatrix):1]
image(161:236, 1:10, newMatrix)

# Maps

library(maps)
map("world")
lat <- runif(40, -180, 180)
lon <- runif(40, -90, 90)
points(lat, lon, col = "blue", pch = 19)

# Missing values and plots

x <- c(NA, NA, NA, 4, 5, 6, 7, 8, 9, 10)
y <- 1:10
plot(x, y, pch = 19, xlim = c(0, 11), ylim = c(0, 11))

x <- rnorm(100)
y <- rnorm(100)
y[x < 0] <- NA
boxplot(x ~ is.na(y))

# Axes label

plot(pData$JWMNP, pData$WAGP, pch = 19, col = "blue", cex = 0.5, 
     xlab = "Travel time (min)", ylab = "Last 12 month wages (dollars)")


plot(pData$JWMNP, pData$WAGP, pch = 19, col = "blue", cex = 0.5, 
     xlab = "Travel time (min)", ylab = "Last 12 month wages (dollars)", 
     cex.lab = 2, cex.asix = 1.5)


plot(pData$JWMNP, pData$WAGP, pch = 19, col = "blue", cex = 0.5, 
     xlab = "TT (min)", ylab = "Wages (dollars)")
legend(100, 200000, legend = "All surveyed", col = "blue", pch = 19, cex = 0.5)

plot(pData$JWMNP, pData$WAGP, pch = 19, col = pData$SEX, cex = 0.5, 
     xlab = "TT (min)", ylab = "Wages (dollars)")
legend(100, 200000, legend = c("men", "women"), col = "blue", pch = 19, cex = 0.5)


plot(pData$JWMNP, pData$WAGP, pch = 19, col = "blue", cex = 0.5, 
     xlab = "CT (min)", ylab = "Wages (dollars)", 
     main = "Wages earned versus commute time") 
legend(100, 200000, legend = "All surveyed", col = "blue", pch = 19, cex = 0.5)

par(mfrow = c(1, 2)) # one row and two columns
hist(pData$JWMNP, xlab = "CT (min)", col = "blue", breaks = 100, main = "")
mtext(text = "(a)", side = 3, line = 1)
plot(pData$JWMNP, pData$WAGP, pch = 19, cex = 0.5, xlab = "CT (min)",
     ylab = "Wages (dollars)", col = pData$SEX)
legend(100, 200000, legend = c("men", "women"), col = c("black", "red"), 
       pch = c(19, 19), cex = c(0.5, 0.5))
mtext(text = "(b)", side = 3, line = 1)

# pdf

pdf(file = "twoPanel.pdf", height = 4, width = 8)
par(mfrow = c(1, 2)) # one row and two columns
hist(pData$JWMNP, xlab = "CT (min)", col = "blue", breaks = 100, main = "")
mtext(text = "(a)", side = 3, line = 1)
plot(pData$JWMNP, pData$WAGP, pch = 19, cex = 0.5, xlab = "CT (min)",
     ylab = "Wages (dollars)", col = pData$SEX)
legend(100, 200000, legend = c("men", "women"), col = c("black", "red"), 
       pch = c(19, 19), cex = c(0.5, 0.5))
mtext(text = "(b)", side = 3, line = 1)
dev.off()

# png

png(file = "twoPanel.png", height = 480, width = (2 * 480))
par(mfrow = c(1, 2)) # one row and two columns
hist(pData$JWMNP, xlab = "CT (min)", col = "blue", breaks = 100, main = "")
mtext(text = "(a)", side = 3, line = 1)
plot(pData$JWMNP, pData$WAGP, pch = 19, cex = 0.5, xlab = "CT (min)",
     ylab = "Wages (dollars)", col = pData$SEX)
legend(100, 200000, legend = c("men", "women"), col = c("black", "red"), 
       pch = c(19, 19), cex = c(0.5, 0.5))
mtext(text = "(b)", side = 3, line = 1)
dev.off()

# dev.copy2pdf -- tweak the graph and save it to pdf

dev.copy2pdf(file = "twoPanelv2.pdf")






