# reading the data file
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors=FALSE)
# subsetting the data based on dates
subsetData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]

# plot in png device
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
# type = l for line graph
plot(datetime, as.numeric(subsetData$Sub_metering_1), type = "l", ylab = "Energy sub metering")
with(lines(datetime, as.numeric(subsetData$Sub_metering_2), col = "red"))
with(lines(datetime, as.numeric(subsetData$Sub_metering_3), col = "blue"))
legend("topright", pch = "-", lwd = 2.5, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
