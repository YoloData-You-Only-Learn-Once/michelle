getwd()
setwd("/Users/michellecarney/Documents/I School/2017 Spring/Data Science Directed Study/Uber Question/")
dir()
library(ggplot2)
library("rjson")
result <- fromJSON(file = "logins.json")

head(result)

z <- as.POSIXct(result,format="%Y-%m-%dT%H:%M:%OS")
op <- options(digits.secs = 3)
z

y <- data.frame(z)
head(z)
head(y)

### from https://www.r-bloggers.com/plot-weekly-or-monthly-totals-in-r/

library(scales)
log <- y

log$z <- as.Date(log$Date, "%Y/%m/%d") # tabulate all the options here
str(log)
log$Month <- as.Date(cut(log$z, breaks = "month"))
log$Week <- as.Date(cut(log$z, breaks = "week", start.on.monday = FALSE)) # changes weekly break 
log$Day <- as.Date(cut(log$z, breaks = "day"))

set.seed(1)
tt <- sample(log$Day,22447,rep=FALSE)
df_tt <- data.frame(table(tt))

head(df_tt)

df_tt$tt <- as.factor(df_tt$tt)
df_tt$Freq <- as.numeric(df_tt$Freq)

plot(df_tt)

sum(df_tt$Freq)

ggplot(data=df_tt, aes(x=tt, y=Freq, group=1)) +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))+
  geom_line()+
  geom_point()
################ graph by week

set.seed(1)
tt_w <- sample(log$Week,22447,rep=FALSE)
df_tt_w <- data.frame(table(tt_w))

tail(df_tt_m)

df_tt_w$tt_w <- as.factor(df_tt_w$tt_w)
df_tt_w$Freq <- as.numeric(df_tt_w$Freq)

plot(df_tt_m)

sum(df_tt_w$Freq)

ggplot(data=df_tt_w, aes(x=tt_w, y=Freq, group=1)) +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))+
  geom_line()+
  geom_point()


#### graph by month
set.seed(1)
tt_m <- sample(log$Month,22447,rep=FALSE)
df_tt_m <- data.frame(table(tt_m))

tail(df_tt_m)

df_tt_m$tt_m <- as.factor(df_tt_m$tt_m)
df_tt_m$Freq <- as.numeric(df_tt_m$Freq)

plot(df_tt_m)

sum(df_tt_m$Freq)

ggplot(data=df_tt_m, aes(x=tt_m, y=Freq, group=1)) +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))+
  geom_line()+
  geom_point()

#### graph by day
set.seed(1)
tt_d <- sample(log$Day,22447,rep=FALSE)
df_tt_d <- data.frame(table(tt_d))

tail(df_tt_d)

df_tt_d$tt_d <- as.factor(df_tt_d$tt_d)
df_tt_d$Freq <- as.numeric(df_tt_d$Freq)

plot(df_tt_d)

sum(df_tt_d$Freq)

ggplot(data=df_tt_d, aes(x=tt_d, y=Freq, group=1)) +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))+
  geom_line()+
  geom_point()

head(df_tt_d)

lines(lowess(df_tt_d$Freq~df_tt_d$tt_d), col="red")


scatterplot.matrix(~tt_d|Freq, data=df_tt_d,
                   main="Three Cylinder Options")
