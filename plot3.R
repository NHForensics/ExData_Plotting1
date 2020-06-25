rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format="%H:%M:%S")

mydata <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

with(mydata, plot(datetime, 
                  as.numeric(Sub_metering_1), 
                  ylab = "Energy sub metering",
                  xlab = "", 
                  type = "l"))

points(mydata$datetime, as.numeric(mydata$Sub_metering_2), col = "red", type = "l")
points(mydata$datetime, as.numeric(mydata$Sub_metering_3), col = "blue", type = "l")

legend("topright", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1)

dev.copy(png, file = "plot3.png")
dev.off()