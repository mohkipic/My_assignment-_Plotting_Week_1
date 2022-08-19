library(sqldf)
#Reading text file and filtering data as per requested date.
df1 <- read.csv.sql("household_power_consumption.txt", sql="select * from file 
        where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
#Parsing the date.
df1$dateTime = as.POSIXct(paste(df1$Date,df1$Time), format = "%d/%m/%Y %H:%M:%S")
# Open a png file
png("plot4.png",width = 480, height = 480) 
par(mfrow=c(2,2))
# 2. Create a plot

plot(x= df1$dateTime
     ,y=df1$Global_active_power
     ,type ='l',
     xlab = " ", ylab = "Global Active Power")
plot(x= df1$dateTime
     ,y=df1$Voltage
     ,type ='l',
     xlab = "datetime", ylab = "Voltage")

plot(df1$dateTime,df1$Sub_metering_1,type ='l',col="black",xlab="",ylab = "Energy sub metering")
lines(df1$dateTime,df1$Sub_metering_2,col = "red")
lines(df1$dateTime,df1$Sub_metering_3, col = "blue")
# Adding legend to the graph.
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
       , lty=c(1,1)
       , bty="n"
       , cex=1) 
plot(x= df1$dateTime
     ,y=df1$Global_reactive_power
     ,type ='l',
     xlab = "datetime", ylab = "Global_reactive_power")
# Close the png file.
dev.off()
str(df1)
