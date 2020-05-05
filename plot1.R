# reading the data file
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors=FALSE)
# subsetting the data based on dates
subsetData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]

# plot in png device
png("plot1.png", width=480, height=480)
hist(as.numeric(subsetData$Global_active_power),
     col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
    )
dev.off()