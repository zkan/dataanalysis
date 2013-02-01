# Question 9

data <- read.table("../../data/input/ss06hid.csv", sep = ",", header = TRUE)

res <- quantile(data["YBL"], na.rm = TRUE)

