#Gathering required data
data <- read.table("~/Coursera/Exploratory-Data/Week-1/exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", na.strings = "?", colClass = c(rep("character", 2), rep("numeric", 7)), header = TRUE)
select <- (data[,1]=="2/2/2007")|(data[,1]=="1/2/2007")
data <- subset(data, select)

#Getting date and time as single variable
datetime <- paste(data[,1],data[,2])
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

#Plotting Global Active Power v/s date & time
png("plot2.png", bg = "transparent")
plot(datetime, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

#Cleaning up
dev.off()
rm(data, select, datetime)
gc()