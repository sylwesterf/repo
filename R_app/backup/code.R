setwd("C://Users//Sylwester//Documents/R_app")

data <- read.csv("alcohol_consumption.csv", sep=";")

year <- 1960:2013
rownames(data) <- year

plot(year, data[,10], type="l")
country <- names(data)

plot(year, data[,3], 
     type="l", xlab = "Year", ylab = "Alcohol consumption (liters per capita)", 
     col="blue", lwd = 3)
lines(year, data[,6], col="red", lwd = 2)



plot(year, data[,4], 
     type="s", xlab = "Year", ylab = "Alcohol consumption (liters per capita)",
     ylim=c(1,20))
text(1980, 15, "blue = ")
