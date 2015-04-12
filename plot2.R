## Read household power consumption file replacing ? with NA values
pwrCons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"), stringsAsFactors=FALSE)

## Reduce data to only include data to from Feb 1-2, 2007
pwrCons <- subset(pwrCons, (Date == "1/2/2007" | Date == "2/2/2007"))

## Combine Date and Time columns to create a DateTime column
pwrCons$DateTime <- as.POSIXct(paste(pwrCons$Date, pwrCons$Time), format="%d/%m/%Y %H:%M:%S")

## Plot 2

png("plot2.png", width=8, height=8, units="in", res=480)
with(pwrCons, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()