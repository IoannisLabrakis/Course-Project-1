data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." ,na.strings = "?")
subset_data<- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
datetime <- strptime(paste(subset_data$Date, subset_data$Time,sep = " "), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(datetime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
