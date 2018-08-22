# Creating Plot 1

# Reading the input data
fileAddress <- "\\data\\household_power_consumption.txt"
rData <- read.table(sep = ";", file = fileAddress, header = T)

# Subsetting the data
s <- with (rData, subset (x = rData, Date == "1/2/2007"| Date == "2/2/2007" ))

# Type modification
s$Global_active_power <- as.numeric(s$Global_active_power)
s$DateTimed <- strptime(paste (s$Date, s$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

#Initialising the graphic device
par (mfrow = c(2,2), mar = c(4, 4, 2, 2))

# creating plots
plot (s$DateTimed, s$Global_active_power, col = "black", type = "l", ylab = "Global Active Power", xlab = "")
plot (s$DateTimed, as.numeric(s$Voltage), col = "black", type = "l", xlab = "datetime", ylab = "Voltage")
plot (s$DateTimed, sub1, col = "black", type = "l", ylab = "Energy sub metering", xlab = "", ylim = c (-1, 35))
lines (s$DateTimed, sub2, col = "red")
lines (s$DateTimed, sub3, col = "blue")
legend("topright", bty = "n", text.width = strwidth("1,000,000,000,000,000,000"),lty = 1, col = c ("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot (s$DateTimed, as.numeric(s$Global_reactive_power), col = "black", type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Saving to file
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")

#Closing the device
dev.off()
