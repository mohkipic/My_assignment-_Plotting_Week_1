########################################################################

# Script Plot 3

########################################################################

# Load data
power <- read.csv("household_power_consumption.txt", sep = ";")

########################################################################

# Pre process data
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$DateTime <- as.POSIXct(paste(power$Date, power$Time),
                             format="%Y-%m-%d %H:%M:%S")
power$Global_active_power <- as.numeric(power$Global_active_power)

########################################################################

# Subset on dates2007-02-01 to 2007-02-02 inclusive
df <- subset(power, Date >= '2007-02-01' & Date <= '2007-02-02')

########################################################################

# Load library
library(tidyverse)

# Define temp df
df_temp <- df[,c(7,8,9,10)]
df_temp$Sub_metering_1 <- as.numeric(df_temp$Sub_metering_1)
df_temp$Sub_metering_2 <- as.numeric(df_temp$Sub_metering_2)
df_temp$Sub_metering_3 <- as.numeric(df_temp$Sub_metering_3)

########################################################################

# Define figure
png("plot3.png", width = 480, height = 480)

# Draw plot
plot(x = df_temp$DateTime,
     y = df_temp$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy Sub Metering")
lines(x = df_temp$DateTime,
      y = df_temp$Sub_metering_2,
      col = "red")
lines(x = df_temp$DateTime,
      y = df_temp$Sub_metering_3,
      col = "blue")
legend("topright", 
       c("Sub_metering_1",
         "Sub_metering_2",
         "Sub_metering_3"),
       col = c("black","red","blue"),
       lwd = 1,
       lty = c(1,1,1))

# Close grafic device
dev.off()

########################################################################
