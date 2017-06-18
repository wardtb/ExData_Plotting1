raw <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE)
raw$Date <- as.Date(raw$Date, "%d/%m/%Y")
df <- subset(raw,(Date == "2007-02-01" | Date == "2007-02-02"))
format(df$Time, format="%H:%M:%S")
df$DT <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(df$DT,df$Sub_metering_1,col = "black",type = "l",xlab = "",ylab = "Energy sub metering")
lines(df$DT,df$Sub_metering_2,col = "red", type = "l")
lines(df$DT,df$Sub_metering_3,col = "blue", type = "l")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()