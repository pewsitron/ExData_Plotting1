data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                 colClasses = c(rep("character", 2), rep("numeric", 7)))
data$Date <- paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")
data <- subset(data, select = -Time)
data <- subset(data, subset = Date >= "2007-02-01" & Date < "2007-02-03")
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(x = data$Date,
     y = data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
plot(x = data$Date,
     y = data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")
plot(x = range(data$Date),
     y = range(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3),
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_1, col = "black")
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       bty = "n")
plot(x = data$Date,
     y = data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()