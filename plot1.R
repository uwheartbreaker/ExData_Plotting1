## Set Working Directory
setwd("~/Desktop/Course Project 1")
file        <- "~/Desktop/Course Project 1/household_power_consumption.txt"
EPC         <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Grab Necessary Data
EPC_Subset  <- EPC[EPC$Date %in% c("1/2/2007", "2/2/2007"), ]
plot1 <- as.numeric(EPC_Subset$Global_active_power)

## Png Data Plot
png("plot1.png", width = 480, height = 480)
hist(plot1, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()