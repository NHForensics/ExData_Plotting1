rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format="%H:%M:%S")

mydata <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

with(mydata, plot(datetime, as.numeric(Global_active_power),
                  ylab = "Global Active Power(kilowatts)",
                  xlab = "", 
                  type = "l"))

dev.copy(png, file = "plot2.png")
dev.off()