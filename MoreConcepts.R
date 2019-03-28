# Download each of the data sets for 2006, 2007, 2008
df1 <- read.csv("~/Documents/r-datasci/2006.csv")
df2 <- read.csv("~/Documents/r-datasci/2007.csv")
df3 <- read.csv("~/Documents/r-datasci/2008.csv")
myDF <- rbind(df1,df2,df3)
dim(myDF)
rm(df1,df2,df3)
head(myDF)
tail(myDF)
unique(myDF$Year)

# Quiz #17 - Answer: 686993
sum(myDF$Origin == "LAX")

# 4.3: Efficiently Storing Origin-to-Destination Flight Paths
myTable <- table(list(myDF$Origin, myDF$Dest))
head(myTable)

# My Table has 315 rows and 321 columns
dim(myTable)
# How many entries are zeros? 94849!
sum(myTable == 0)
# How many entries are not zeros? 6266!
sum(myTable != 0)

myNewTable <- table(paste(myDF$Origin, myDF$Dest))
length(myNewTable)
# sum(myDF$Origin == "IND", myDF$Origin == "ORD")
# Q2Table <- table(list(myDF$Origin == "BOS", myDF$Origin == "DEN"))

plot(myNewTable)
dotchart(myNewTable)

dotchart(sort(myNewTable))

plot(myTable["IND",])
dotchart(myTable["IND",])

# Save flight data into a vector
v <- myTable["IND",]


# 4.5: Visualizing Flight Paths
# Dot chart plot of flights from IND to airports that have at least one flight
dotchart(sort(v[v != 0]))
# IND destinations with at least 4000 flights
dotchart(sort(v[v > 4000]))

MyV <- myTable["JFK",]
dotchart(sort(MyV[MyV > 5000]))

# 4.6 Incorporating Auxiliary Data about Airports
# Importing data about the airports
airportsDF <- read.csv("~/Documents/r-datasci/airports.csv")
dim(airportsDF)
head(airportsDF$iata)
airportsDF[airportsDF$iata == "IND",]

# 4.7: Incorporating Auxiliary Data about Airports
# Store airport, city and state of Airports in a vector
w <- paste(airportsDF$airport, airportsDF$city, airportsDF$state, sep=", ")
head(w)
tail(w)

names(w) <- airportsDF$iata
w[c("IND", "ORD", "MDW")]
w["CMH"]
w["Chicago"]

# Quiz #19
sum(airportsDF$city == "Chicago", na.rm = T)

# 4.9 Revising Visualizations of Flight Paths
v[v > 4000]
names(v[v > 4000])
w["ORD"]

myVec <- v[v > 4000]
names(myVec) <- w[names(v[v > 4000])]
myVec
dotchart(myVec)
dotchart(sort(myVec))

# 4.10 Identifying Airports with Commercial Flights
head(airportsDF)
table(airportsDF$state)

subset(airportsDF, state == "IN")

indyairports <- subset(airportsDF, state == "IN")

# we can make a table that shows all of the flight counts
# (as origins) for all airports in the full data set
# from 2006 to 2008 (not just Indiana airports)
table(myDF$Origin)
table(myDF$Origin)["IND"]
table(myDF$Origin)["ORD"]

# These are the 3-letter airport codes for the airports in Indiana
as.character(indyairports$iata)
table(myDF$Origin)[as.character(indyairports$iata)]
v <- table(myDF$Origin)[as.character(indyairports$iata)]
v[!is.na(v)]
names(v[!is.na(v)])
subset(airportsDF, iata %in% names(v[!is.na(v)]))


# 4.12 Creating and Applying Functions Built by the Learner
mystate <- "IN"
myairports <- subset(airportsDF, state == mystate)
myairports
table(myDF$Origin)[as.character(myairports$iata)]

activeairports <- function(mystate) {
  myairports <- subset(airportsDF, state == mystate)
  v <- table(myDF$Origin)[as.character(myairports$iata)]
  subset(airportsDF, iata %in% names(v[!is.na(v)]))
}

activeairports("IN")
activeairports("IL")
activeairports("CA")
sapply(state.abb,function(x) 
dim(activeairports(x))[1])
