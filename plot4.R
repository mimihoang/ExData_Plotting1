#Read file and pick a specic date range used to plot the data
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
file$DateTime <- strptime(paste(file$Date,file$Time), "%d/%m/%Y %H:%M:%S")
file$Date <- as.Date(file$Date, format='%d/%m/%Y')

#Only pick data for dates between 2/1/2007-2/2/2007
df <- subset(file, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Create Plot 4 and write to .png file
par(mfrow = c(2, 2), mar = c(4,4,2,1))
with(df, {
        plot(DateTime, Global_active_power, ylab="Global Active Power", xlab="", type="l")
        plot(DateTime, Voltage, ylab="Voltage", xlab="", type="l")
        plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
        points(DateTime, Sub_metering_2, col="red", type="l")
        points(DateTime, Sub_metering_3, col="blue", type="l")
        legend("topright", pch="l", cex = .9, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(DateTime, Global_reactive_power, ylab="Global Reactive Power", xlab="", type="l")
})
dev.copy(png, file = "plot4.png") 
dev.off() 