## Introduction

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:

Dataset: Electric power consumption [20Mb]

Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

##  Plot1.R (Code)
```
library("data.table")
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?") 
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")] 
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")] 
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")] 
png("plot1.png", width=480, height=480) 
hist(powerDT$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
dev.off() 
```
### Plot 1





### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

