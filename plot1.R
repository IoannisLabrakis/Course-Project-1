data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec="." ,na.strings = "?")
subset_data<- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")

png("plot1.png", width=480, height=480)

hist(subset_data$Global_active_power,main= "Global Active Power",col = "red", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")

dev.off()