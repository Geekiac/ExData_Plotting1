## plot3.R
## Exploratory Data Analysis
## Course Project 1
library(lubridate)

## Download file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "household_power_consumption.zip"
download.file(url, destfile=zipfile)

## unzip file to get at data text file
unzip(zipfile)

## read data
dat <- read.csv("household_power_consumption.txt",sep=";", na.strings = "?")

## subset data to a the first two days of February 2007
feb <- subset(dat, dmy(dat$Date) %in% c(dmy("1/2/2007"), dmy("2/2/2007")))

## free up memory by removing orginal data
remove(dat)

## open png device
png(file="plot3.png", width = 480, height = 480)
## initialise to a single plot per device
par(mfrow = c(1,1))
## plot line 1
plot(dmy_hms(paste(feb$Date, feb$Time)), feb$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
## plot line 2
points(dmy_hms(paste(feb$Date, feb$Time)), feb$Sub_metering_2, type = "l", col = "red")
## plot line 3
points(dmy_hms(paste(feb$Date, feb$Time)), feb$Sub_metering_3, type = "l", col = "blue")
## create legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = c(2,2,2))
## close device
dev.off()
