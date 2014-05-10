# Plot3
# Place this R file in the same directory as the file "household_power_consumption.txt"

# Load the data 2,075,259 rows and 9 columns
epc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

#Only use data from 2007-02-01 and 2007-02-02
epc1 <- subset(epc, epc$Date == "1/2/2007" | epc$Date == "2/2/2007")

# Create DateTime column
epc1$DateTime <- paste(epc1$Date, epc1$Time)
epc1$DateTime <- strptime(epc1$DateTime, format="%d/%m/%Y %H:%M:%S")

# Create plot and save as png
png(filename = "plot3.png", width = 480, height = 480)
par(mfrow=c(1,1))
plot(epc1$DateTime, as.numeric(epc1$Sub_metering_1), type="n", xlab="", ylab="Energy sub metering")
points(epc1$DateTime, as.numeric(epc1$Sub_metering_1), type="l", col= "black")
points(epc1$DateTime, as.numeric(epc1$Sub_metering_2), type="l", col= "red")
points(epc1$DateTime, as.numeric(epc1$Sub_metering_3), type="l", col= "blue")
legend("topright",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=c(1,1,1))
dev.off()