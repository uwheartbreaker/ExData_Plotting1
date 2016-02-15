## Set Working Directory
setwd("~/Desktop/Course Project 1")
file        <- "~/Desktop/Course Project 1/household_power_consumption.txt"
EPC         <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
EPC_Subset  <- EPC[EPC$Date %in% c("1/2/2007", "2/2/2007"), ]

## Grab Necessary Data
Global_Active_Power <- as.numeric(EPC_Subset$Global_active_power)
DateTime            <- strptime(paste(EPC_Subset$Date, EPC_Subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Png Data Plot
png("plot2.png", width = 480, height = 480)
plot(DateTime, Global_Active_Power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()