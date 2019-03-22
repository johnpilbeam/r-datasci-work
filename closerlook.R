# Import CSV (Mac file path)
myDF <- read.csv("~/Documents/r-datasci/2008.csv")
sort(table(myDF$Origin))
?sort

# Most popular 10 aiports according to number of flights
sort(table(myDF$Origin), decreasing = T)[1:10]
dim(myDF)

mostpopular <- names(sort(table(myDF$Dest), decreasing = T)[1:10])
sum(myDF$Origin %in% mostpopular)

leastpopular <- names(sort(table(myDF$Dest), increasing = T)[1:10])
sum(myDF$Origin %in% leastpopular)

myDF$Origin[1:100]
(myDF$Origin %in% mostpopular)[1:100]
class(mostpopular)
names(table(myDF$Origin))
table(myDF$Origin)[c("IND","ORD","JFK","EWR","IAD")]

myairports <- c("IND","ORD","JFK","EWR","IAD")
table(myDF$Origin)[myairports]

WAairports <- c("DCA","IAD")
table(myDF$Origin, myDF$Year == 2008)[WAairports]

# 3.10 Revisiting a Plot in R

# How many flights occur during each hour of the day
v <- table(cut(myDF$DepTime, breaks = seq(0,2400,by=100)))
# An alternate way of doing the same thing
w <- table(ceiling(myDF$DepTime / 100))
# Check results of both methods match
sum(v == w)
plot(w)

# Break data in DepDelay vector down by month of city of origin
tapply(myDF$DepDelay, myDF$Month, length)
tapply(myDF$DepDelay, myDF$Origin, length)

# Total of flights from Indiana in June (3852)
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)["IND",6]
# Total of flights from Atanta in June (36098)
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)["ATL",3]

tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)[c("ATL","AUS","BDL"), c(7:10)]
# sum(myDF$Origin, myDF$Month)[c("ATL","AUS","BDL"), c(7:10)]

# O'Hare all months (leave blank for unspecified month e.g ["ORD",])
tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)[c("IND","ORD"),]
class(tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)[c("IND","ORD"),])
dim(tapply(myDF$DepDelay, list(myDF$Origin,myDF$Month), length)[c("IND","ORD"),])

# Just playing with maps package :-)
map(regions=c("UK","Iceland","Spain","France","Germany","Portugal","Italy","Switzerland","Austria","Andorra" ), fill=TRUE, col=c("dark green"))

# 3.14 Calculating Percentages of Flights with Long Delays
longdelayDF <- subset(myDF, myDF$DepDelay > 30)
dim(longdelayDF)
head(longdelayDF$DepDelay)

tapply(longdelayDF$DepDelay, list(longdelayDF$Origin,longdelayDF$Month), length)[c("IND","ORD"),]




