## plot2.R
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
png(file="plot2.png", width = 480, height = 480)
## initialise to a single plot per device
par(mfrow = c(1,1))
## plot a line graph
plot(dmy_hms(paste(feb$Date, feb$Time)), feb$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
## close device
dev.off()

