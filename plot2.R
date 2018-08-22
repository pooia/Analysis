
# Creating Plot 1

# Reading the input data
fileAddress <- "\\data\\household_power_consumption.txt"
rData <- read.table(sep = ";", file = fileAddress, header = T)

# Subsetting the data
s <- with (rData, subset (x = rData, Date == "1/2/2007"| Date == "2/2/2007" ))

# Type modification
s$Global_active_power <- as.numeric(s$Global_active_power)
s$DateTimed <- strptime(paste (s$Date, s$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

# Initialising the graphic device
par (mfrow = c (1,1), mar = c(4, 4, 1, 1))

# Creating the line plot
plot (s$DateTimed, s$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# saving to file
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")

# closing the device
dev.off()
