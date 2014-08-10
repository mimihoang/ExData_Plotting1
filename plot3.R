#Read file and pick a specic date range used to plot the data
file <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
file$DateTime <- strptime(paste(file$Date,file$Time), "%d/%m/%Y %H:%M:%S")
file$Date <- as.Date(file$Date, format='%d/%m/%Y')

#Only pick data for dates between 2/1/2007-2/2/2007
df <- subset(file, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Create Plot 3 and write to .png file
with(df,{     
        plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
        points(DateTime, Sub_metering_2, col="red", type="l")
        points(DateTime, Sub_metering_3, col="blue", type="l")
        legend("topright", pch="l", cex = .7, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off() 