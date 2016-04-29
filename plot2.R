data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                 colClasses = c(rep("character", 2),"numeric", rep("NULL", 6)))
data$Date <- paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")
data <- subset(data, select = -Time)
data <- subset(data, subset = Date >= "2007-02-01" & Date < "2007-02-03")
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
plot(x = data$Date,
     y = data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()