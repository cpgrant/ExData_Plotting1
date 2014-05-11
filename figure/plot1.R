# Plot 1
# Place this R file in the same directory as the file "household_power_consumption.txt"

# Load the data 2,075,259 rows and 9 columns
epc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

#Only use data from 2007-02-01 and 2007-02-02
epc1 <- subset(epc, epc$Date == "1/2/2007" | epc$Date == "2/2/2007")

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
# The default size is width = 480, height = 480
# Please note that the reference plot has a transparent background
# bg = "transparent" specifies a transparent background 

png(filename = "plot1.png", bg = "transparent")
?png
hist(as.numeric(epc1$Global_active_power), 
     col = "red",
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     xlim = c(0, 6),
     breaks=22)
dev.off()
