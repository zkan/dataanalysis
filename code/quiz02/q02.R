# Question 2

con <- url("http://simplystatistics.tumblr.com/", "r")
simplyStats <- readLines(con, 150)
close(con)

numChars <- nchar(simplyStats)
