a <- read.csv('~/Documents/hw1_data.csv')
a[1:2,]
nrow(a)
a[152:153,]
tail(a,2)
a[47,]
sum(is.na(a$Ozone))
b <- a$Ozone[!is.na(a$Ozone)]
mean(b)

mean(a[which(a$Ozone > 31 & a$Temp > 90),]$Solar.R)
mean(subset(a,Ozone >31 & Temp > 90, select = c(Solar.R))$Solar.R)
mean(a[a$Ozone > 31 & a$Temp > 90, "Solar.R"][!is.na(a[a$Ozone > 31 & a$Temp > 90, "Solar.R"])])
max(a[which(a$Month == 5),]$Ozone[!is.na(a[which(a$Month == 5),]$Ozone)])
mean(a[which(a$Month == 6),"Temp"][!is.na(a[which(a$Month == 6),"Temp"])])

a[[1:3,]]
