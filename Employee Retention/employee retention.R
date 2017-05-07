getwd()
setwd("/Users/michellecarney/Documents/I School/2017 Spring/Data Science Directed Study/Employee Retention/")
dir()
library(ggplot2)
library("rjson")
result <- fromJSON(file = "logins.json")

data <- read.csv("employee retention.csv", header=TRUE, stringsAsFactors=FALSE)
head(data)

data$country <- as.factor(data$country)

summary(data)