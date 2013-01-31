# Question 3

data <- read.table("../../data/input/ss06hid.csv", sep = ",", header = TRUE)

numRows <- nrow(subset(data, VAL >= 24))

