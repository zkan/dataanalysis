# Question 5

data <- read.table("../../data/input/ss06hid.csv", sep = ",", header = TRUE)

numRows3BDSand4RMS <- nrow(subset(data, BDS == 3 & RMS == 4))
numRows2BDSand5RMS <- nrow(subset(data, BDS == 2 & RMS == 5))
numRows2BDSand7RMS <- nrow(subset(data, BDS == 2 & RMS == 7))

