## Set Working Directory
setwd("~/Desktop/Course Project 1")
file        <- "~/Desktop/Course Project 1/household_power_consumption.txt"
EPC         <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
EPC_Subset  <- EPC[EPC$Date %in% c("1/2/2007", "2/2/2007"), ]

## Grab Necessary Data
Global_Active_Power   <- as.numeric(EPC_Subset$Global_active_power)
DateTime              <- strptime(paste(EPC_Subset$Date, EPC_Subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Sub_metering_1        <- as.numeric(EPC_Subset$Sub_metering_1)
Sub_metering_2        <- as.numeric(EPC_Subset$Sub_metering_2)
Sub_metering_3        <- as.numeric(EPC_Subset$Sub_metering_3)
Voltage               <- as.numeric(EPC_Subset$Voltage)
Global_Reactive_Power <- as.numeric(EPC_Subset$Global_reactive_power)

## Png Data Plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

# Plot 1
plot(DateTime, Global_Active_Power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

# Plot 2
plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

# Plot 3
plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
lines(DateTime, Sub_metering_2, type = "l", col = "red")
lines(DateTime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5, bty="n")

# Plot 4
plot(DateTime, Global_Reactive_Power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.off()