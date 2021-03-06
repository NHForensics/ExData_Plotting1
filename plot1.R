rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
mydata <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

hist(as.numeric(as.character(mydata$Global_active_power)), 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()