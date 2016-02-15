## Set Working Directory
setwd("~/Desktop/Course Project 1")
file        <- "~/Desktop/Course Project 1/household_power_consumption.txt"
EPC         <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
EPC_Subset  <- EPC[EPC$Date %in% c("1/2/2007", "2/2/2007"), ]

## Grab Necessary Data
DateTime            <- strptime(paste(EPC_Subset$Date, EPC_Subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Sub_metering_1      <- as.numeric(EPC_Subset$Sub_metering_1)
Sub_metering_2      <- as.numeric(EPC_Subset$Sub_metering_2)
Sub_metering_3      <- as.numeric(EPC_Subset$Sub_metering_3)

## Png Data Plot
png("plot3.png", width = 480, height = 480)
plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(DateTime, Sub_metering_2, type = "l", col = "red")
lines(DateTime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5)
dev.off()