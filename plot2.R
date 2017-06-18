raw <- read.table("household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE)
raw$Date <- as.Date(raw$Date, "%d/%m/%Y")
df <- subset(raw,(Date == "2007-02-01" | Date == "2007-02-02"))
format(df$Time, format="%H:%M:%S")
df$DT <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")



png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(df$DT,df$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")

dev.off()