data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                 colClasses = c(rep("character", 2),"numeric", rep("NULL", 6)))
data$Date <- paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")
data <- subset(data, select = -Time)
data <- subset(data, subset = Date >= "2007-02-01" & Date < "2007-02-03")
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
