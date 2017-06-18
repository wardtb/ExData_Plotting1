raw <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE)
raw$Date <- as.Date(raw$Date, "%d/%m/%Y")
df <- subset(raw,(Date == "2007-02-01" | Date == "2007-02-02"))
format(df$Time, format="%H:%M:%S")
df$DT <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(df$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.off()