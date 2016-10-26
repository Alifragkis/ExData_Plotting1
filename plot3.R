# Step 1 - load data, define date and time format and subset the data that will be used in analysis
mydata <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
cleanData <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
cleanData$DateTime <- strptime(paste(cleanData$Date, cleanData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# set numeric class to the data
cleanData$Global_active_power <- as.character(cleanData$Global_active_power)
cleanData$Global_active_power <- as.numeric(cleanData$Global_active_power)

# Step 2 - create a png device, draw the plot and close the device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(cleanData$DateTime, cleanData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(cleanData$DateTime, cleanData$Sub_metering_2, col = "red")
lines(cleanData$DateTime, cleanData$Sub_metering_3, col = "blue")
dev.off()