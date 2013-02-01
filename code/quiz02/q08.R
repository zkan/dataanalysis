# Question 8

data <- read.table("../../data/input/ss06hid.csv", sep = ",", header = TRUE)

res <- strsplit(names(data), "wgtp")[123]

