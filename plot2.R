########################################################################

# Script Plot 2

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

# Define figure
png("plot2.png", width = 480, height = 480)

# Draw plot
plot(x = df$DateTime,
     y = df$Global_active_power,
     type = "l",
     main = "Global Active Power vs Time",
     xlab = "",
     ylab = "Global Active Power (Kilowatts)")

# Close grafic device
dev.off()

########################################################################
