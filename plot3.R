# Creating Plot 1

# Reading the input datafileAddress <-  "\\data\\household_power_consumption.txt"
rData <- read.table(sep = ";", file = fileAddress, header = T)

# Subsetting the data
s <- with (rData, subset (x = rData, Date == "1/2/2007"| Date == "2/2/2007" ))

# Type modification 
s$Global_active_power <- as.numeric(s$Global_active_power)
s$DateTimed <- strptime(paste (s$Date, s$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric (s$Sub_metering_1)
sub2 <- as.numeric (s$Sub_metering_2)
sub3 <- as.numeric (s$Sub_metering_3)

# initialising the graphic device
par (mfrow = c(1,1), mar = c (4, 4, 2, 2))

# creating line plots
plot (s$DateTimed, sub1, col = "black", type = "l", ylab = "Energy sub metering", xlab = "", ylim = c (-1, 35))
lines (s$DateTimed, sub2, col = "red")
lines (s$DateTimed, sub3, col = "blue")

# Drawing the legend
legend("topright", text.width = strwidth("1,000,000,000,000,000"),lty = 1, col = c ("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# saving to file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")

# closing the device
dev.off()
