data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." ,na.strings = "?")
subset_data<- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
datetime <- strptime(paste(subset_data$Date, subset_data$Time,sep = " "), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(datetime,subset_data$Sub_metering_1, type = "l", col= "black", ylab="Energy sub metering", xlab="")
lines(datetime,subset_data$Sub_metering_2, col= "red")
lines(datetime,subset_data$Sub_metering_3, col= "blue")
legend("topright", col= c("black","red","blue"),lty = 1,lwd = 2.5, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
