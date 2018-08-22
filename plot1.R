# Creating Plot 1

# Reading the input data
fileAddress <-  "\\data\\household_power_consumption.txt" 
rData <- read.table(sep = ";", file = fileAddress, header = T)

# Subsetting the data
s <- with (rData, subset (x = rData, Date == "1/2/2007"| Date == "2/2/2007" ))

# type modification
s$Global_active_power <- as.numeric(s$Global_active_power)
s$DateTimed <- strptime(paste (s$Date, s$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

# Initialising the graphic device
par (mfrow = c (1,1), mar = c(4, 4, 1, 1))

# creating the histogram
with (s, hist (Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))

#Saving to file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

# closing the device
dev.off()
