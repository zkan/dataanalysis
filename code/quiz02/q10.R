# Question 10

housingData <- read.table("../../data/input/ss06hid.csv", sep = ",", header = TRUE)
populationData <- read.table("../../data/input/ss06pid.csv", sep = ",", header = TRUE)

mergedData <- merge(housingData, populationData, by.x = "SERIALNO", by.y = "SERIALNO", all = TRUE)

numRows <- dim(mergedData)[1]
numCols <- dim(mergedData)[2]

