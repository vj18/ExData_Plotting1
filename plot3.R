#Gathering required data
data <- read.table("~/Coursera/Exploratory-Data/Week-1/exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?", colClass = c(rep("character", 2), rep("numeric", 7)), header = TRUE)
select <- (data[,1]=="2/2/2007")|(data[,1]=="1/2/2007")
data <- subset(data, select)

#Collecting date and time in a single variable
datetime <- paste(data[,1],data[,2])
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

#Plotting Energy sub meter(s) v/s date & time
png("plot3.png", bg = "transparent")
plot(datetime, data$Sub_metering_1, type = "l", col = "black", xlab = " ", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

#Adding legend for better readability
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

#cleaning up
dev.off()
rm(data, select, datetime)
gc()