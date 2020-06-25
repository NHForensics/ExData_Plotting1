rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format="%H:%M:%S")

mydata <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2, 2))

with(mydata, plot(datetime, as.numeric(Global_active_power),
                  ylab = "Global Active Power(kilowatts)",
                  xlab = "", 
                  type = "l"))



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
       lty = 1,
       cex = .5)


with(mydata, plot(datetime, as.numeric(Voltage),
                  ylab = "Voltage",
                  xlab = "datetime", 
                  type = "l"))


with(mydata, plot(datetime, as.numeric(Global_reactive_power),
                  ylab = "Global_reactive_power",
                  xlab = "datetime", 
                  type = "l"))

dev.copy(png, file = "plot4.png")
dev.off()