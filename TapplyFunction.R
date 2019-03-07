# JP - 2019-03-01
# Import CSV (Mac file path)
myDF <- read.csv("~/Documents/r-datasci/2008.csv")

#Introduction to the Tapply Function - tapply(vector, index, function)
#Can add an extra param e.g. na.rm=TRUE
tail(sort(tapply(myDF$DepDelay, myDF$Origin, mean, na.rm=TRUE)))
head(sort(tapply(myDF$DepDelay, myDF$Origin, mean, na.rm=TRUE)))

#Quiz #7
tail(sort(tapply(myDF$Distance, myDF$Origin, mean, na.rm=TRUE)))
#Answer - SJU
tail(sort(tapply(myDF$Distance, myDF$Dest, mean)))

#Arrival Delays by Day of the Week
plot(tapply(myDF$ArrDelay, myDF$DayOfWeek, mean, na.rm=TRUE))

tapply(myDF$ArrDelay[myDF$Dest == "IND"], myDF$DayOfWeek[myDF$Dest == "IND"], mean, na.rm=TRUE)
sum(myDF$Dest == "IND")

#When Should You Fly?
tapply(myDF$ArrDelay, myDF$UniqueCarrier, mean, na.rm=TRUE)
#How many flights per month?
tapply(myDF$Month, myDF$Month, length)

#Quiz #8
tapply(myDF$DepDelay, myDF$UniqueCarrier, mean, na.rm=TRUE)
tail(sort(tapply(myDF$DepDelay, myDF$UniqueCarrier, mean, na.rm=TRUE)))
#Answer United Airlines Inc. (UA 14.1125766)

#Arrival Delays by Day of the Year
myDates <- paste(myDF$Month, myDF$DayofMonth, myDF$Year, sep = "/")

length(myDF$ArrDelay)
length(myDates)
length(tapply(myDF$ArrDelay, myDates, mean, na.rm=TRUE))

#Quiz #9

