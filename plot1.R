#getting required data
data <- read.table("~/exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?", colClass = c(rep("character", 2), rep("numeric", 7)), header = TRUE)
select <- (data[,1]=="2/2/2007")|(data[,1]=="1/2/2007")
data <- subset(data, select)

#Plotting histogram in png device
png("plot1.png", bg = "transparent")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200), main = "Global Active Power")

#Cleaning up
dev.off()
rm(data, select)
gc()