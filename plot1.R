########################################################################

# Script Plot 1

########################################################################

# Load data
power <- read.csv("household_power_consumption.txt", sep = ";")

########################################################################

# Pre process data
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Global_active_power <- as.numeric(power$Global_active_power)

########################################################################

# Subset on dates2007-02-01 to 2007-02-02 inclusive
df <- subset(power, Date >= '2007-02-01' & Date <= '2007-02-02')

########################################################################

# Define figure
png("plot1.png", width = 480, height = 480)

# Draw plot
hist(df$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)",
     ylab = "Frequency")

# Close grafic device
dev.off()

########################################################################
