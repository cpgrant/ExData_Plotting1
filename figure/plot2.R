# Plot 2
# Place this R file in the same directory as the file "household_power_consumption.txt"

# Load the data 2,075,259 rows and 9 columns
epc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

#Only use data from 2007-02-01 and 2007-02-02
epc1 <- subset(epc, epc$Date == "1/2/2007" | epc$Date == "2/2/2007")

# Create DateTime column
epc1$DateTime <- paste(epc1$Date, epc1$Time)
epc1$DateTime <- strptime(epc1$DateTime, format="%d/%m/%Y %H:%M:%S")

# Create plot and save as png
png(filename = "plot2.png", width = 480, height = 480)
plot(epc1$DateTime, as.numeric(epc1$Global_active_power),
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowats)")
dev.off()
