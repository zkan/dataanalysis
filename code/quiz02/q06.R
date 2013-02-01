# Question 6

data <- read.table("../../data/input/ss06hid.csv", sep = ",", header = TRUE)

agricultureLogical <- data["ACR"] == 3 & data["AGS"] == 6
res <- which(agricultureLogical)

