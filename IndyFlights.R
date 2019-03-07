# JP - 2019-03-01
# Import CSV (Mac file path)
myDF <- read.csv("~/Documents/r-datasci/2008.csv")

head(myDF$Origin)
tail(myDF$Origin)

head(myDF$Dest)
tail(myDF$Dest)

head(myDF$Origin == "IND")

sum(myDF$Origin == "IND")
sum(myDF$Dest == "IND")

sum(myDF$Origin == "JFK")
sum(myDF$Dest == "JFK")

sum(myDF$Origin == "ORD")
sum(myDF$Dest == "ORD")

sum((myDF$Origin == "IND") & (myDF$Dest == "ORD"))

MyIndyOrigins <- subset(myDF, myDF$Origin == "IND")
MyIndyDests <- subset(myDF, myDF$Dest == "IND")
head(MyIndyOrigins)
head(MyIndyDests)

table(MyIndyOrigins$Month)
plot(table(MyIndyOrigins$Month))
plot(table(MyIndyDests$Month))

sum(MyIndyOrigins$DepTime < 600, na.rm = TRUE) 
sum(MyIndyOrigins$DepTime < 1200, na.rm = TRUE) 
sum(MyIndyOrigins$DepTime < 1800, na.rm = TRUE) 
sum(MyIndyOrigins$DepTime < 2400, na.rm = TRUE) 

sum(is.na(MyIndyOrigins$DepTime)) 

# Quiz #5
sum((myDF$Dest == "LAX") & (myDF$Year == 2008))
sum((myDF$Dest == "LAX") & (myDF$Origin == "ATL") & (myDF$Year == 2008))
myATL2LAX <- subset(myDF, (myDF$Origin == "ATL") & (myDF$Dest == "LAX"))
sum(myATL2LAX$Year == 2008)
sum(myATL2LAX$DepTime < 1200, na.rm = TRUE) 
table(myDF$Origin)
sort(table(myDF$Origin))


seq(0, 2400, by=100)
cut(myDF$DepTime, breaks=seq(0, 2400, by=100))
table(cut(myDF$DepTime, breaks=seq(0, 2400, by=100)))
plot(table(cut(myDF$DepTime, breaks=seq(0, 2400, by=100))))

#Quiz #6
sum(table(paste(myDF$Origin, "to", myDF$Dest)) == 1)

