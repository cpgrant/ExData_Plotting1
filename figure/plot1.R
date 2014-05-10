# Plot 1
# Place this R file in the same directory as the file "household_power_consumption.txt"

# Load the data 2,075,259 rows and 9 columns
epc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

#Only use data from 2007-02-01 and 2007-02-02
epc1 <- subset(epc, epc$Date == "1/2/2007" | epc$Date == "2/2/2007")

# First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. 
# Make sure your computer has enough memory (most modern computers should be fine).

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
#png(filename = "plot1.png", width = 480, height = 480)
png(filename = "plot1.png")
hist(as.numeric(epc1$Global_active_power), 
     col = "red",
     main="Global Active Power",
     xlab = "Global Active Power (Kilowats)",
     ylab = "Frequency",
     xlim = c(0, 6),
     breaks=22)
dev.off()
