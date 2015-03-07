#Gathering required data
data <- read.table("~/Coursera/Exploratory-Data/Week-1/exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?", colClass = c(rep("character", 2), rep("numeric", 7)), header = TRUE)
select <- (data[,1]=="2/2/2007")|(data[,1]=="1/2/2007")
data <- subset(data, select)

#Collecting date and time in a single variable
datetime <- paste(data[,1],data[,2])
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

#Preparing for four different plots in one device
png("plot4.png", bg = "transparent")
par(mfcol = c(2,2))

#Plot 1: Frequency v/s Global active power
plot(datetime, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

#Plot 2: Energy sub meter(s) v/s date & time
plot(datetime, data$Sub_metering_1, type = "l", col = "black", xlab = " ", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty = "n", cex = 0.85)

#Plot 3: Voltage v/s date & time
plot(datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot 4: Global reactive power v/s date & time
plot(datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Cleaning up
dev.off()
rm(data, select, datetime)
gc()