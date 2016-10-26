library(lubridate) #load the lubridate library to define date and time format

# Step 1 - load data, define date and time format and subset the data that will be used in analysis
mydata <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")
mydata$Date <- dmy(mydata$Date)
mydata$Time <- hms(mydata$Time)
mydata <- subset(mydata, mydata$Date >= "2007-02-01")
mydata <- subset(mydata, mydata$Date <= "2007-02-02")

# set numeric class to the data
mydata$Global_active_power <- as.character(mydata$Global_active_power)
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)

# Step 2 - create a png device, draw the plot and close the device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(mydata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()