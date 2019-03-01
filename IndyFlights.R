myDF <- read.csv("~/Documents/r-datasci/2008.csv")

head(myDF$Origin)
tail(myDF$Origin)

head(myDF$Dest)
tail(myDF$Dest)

head(myDF$Origin == "IND")

sum(myDF$Origin == "IND")
