## Read household power consumption file replacing ? with NA values
pwrCons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"), stringsAsFactors=FALSE)

## Reduce data to only include data to from Feb 1-2, 2007
pwrCons <- subset(pwrCons, (Date == "1/2/2007" | Date == "2/2/2007"))

## Combine Date and Time columns to create a DateTime column
pwrCons$DateTime <- as.POSIXct(paste(pwrCons$Date, pwrCons$Time), format="%d/%m/%Y %H:%M:%S")

## Plot 1

png("plot1.png", width=8, height=8, units="in", res=480)
hist(pwrCons$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)", axes = FALSE)
axis(1, at=seq(0, 6, by=2), labels=c("0", "2", "4", "6"))
axis(2, at=seq(0, 1200, by=200), labels=c("0", "200", "400", "600", "800", "1000", "1200"))
dev.off()

