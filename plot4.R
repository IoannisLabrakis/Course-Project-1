data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." ,na.strings = "?")
subset_data<- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
datetime <- strptime(paste(subset_data$Date, subset_data$Time,sep = " "), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height=480)
par(mfrow = c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(datetime, subset_data$Global_active_power,xlab = "", ylab = "Global Active Power",type = "l")

plot(datetime, subset_data$Voltage, xlab = "datetime", ylab = "Voltage",type = "l")

plot(datetime,subset_data$Sub_metering_1, type = "l", col= "black", ylab="Energy sub metering", xlab="")
lines(datetime,subset_data$Sub_metering_2, col= "red")
lines(datetime,subset_data$Sub_metering_3, col= "blue")
legend("topright", col= c("black","red","blue"),lty = 1,lwd = 2, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(datetime, subset_data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()