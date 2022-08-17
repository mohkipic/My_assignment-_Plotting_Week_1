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
![plot1](/plot1.png)


##  Plot2.R (Code)
```
library("data.table")
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)
plot(x = powerDT[, dateTime], y = powerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
```

### Plot 2
![plot2](/plot2.png)

##  Plot3.R (Code)
```

```

### Plot 3

##  Plot4.R (Code)
```

```

### Plot 4

