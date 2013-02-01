# Question 7

data <- read.table("../../data/input/ss06hid.csv", sep = ",", header = TRUE)

agricultureLogical <- data["ACR"] == 3 & data["AGS"] == 6
indexes = which(agricultureLogical)
subsetData = data[indexes,]
numMissingValues <- length(which(is.na(subsetData$MRGX)))

