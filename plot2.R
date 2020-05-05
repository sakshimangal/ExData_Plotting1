# reading the data file
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors=FALSE)
# subsetting the data based on dates
subsetData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]

# plot in png device
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
# type = l for line graph
plot(datetime, as.numeric(subsetData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()