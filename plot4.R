## Read household power consumption file replacing ? with NA values
pwrCons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"), stringsAsFactors=FALSE)

## Reduce data to only include data to from Feb 1-2, 2007
pwrCons <- subset(pwrCons, (Date == "1/2/2007" | Date == "2/2/2007"))

## Combine Date and Time columns to create a DateTime column
pwrCons$DateTime <- as.POSIXct(paste(pwrCons$Date, pwrCons$Time), format="%d/%m/%Y %H:%M:%S")

## Plot 4

png("plot4.png", width=8, height=8, units="in", res=480)
par(mfrow = c(2, 2))

with(pwrCons, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(pwrCons, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(pwrCons, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(pwrCons, lines(DateTime, Sub_metering_2, col = "red")) 
with(pwrCons, lines(DateTime, Sub_metering_3, col = "blue")) 
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(pwrCons, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()