data<-  read.table('household_power_consumption.txt', sep=';', header=TRUE) %>%
       mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
       mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
       filter(Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00'))

png(filename = "plot4.png")

par(mfcol=c(2,2))
## First plot
plot(data$Time, as.numeric(data$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", 
     xlab = "Time")
## Secondplot
plot(data$Time, as.numeric(data$Sub_metering_1), xaxt="n", type="l", ylab="Energy Sub Metering", 
     xlab = "Time")
lines(data$Time, as.numeric(data$Sub_metering_2), col="red")
lines(data$Time, as.numeric(data$Sub_metering_3), col="blue")
legend('topright', legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1))
## Third plot
plot(data$Time, as.numeric(data$Voltage), type="l", ylab="Voltage", 
     xlab = "DateTime")
## Forth plot
plot(data$Time, as.numeric(data$Global_reactive_power), type="l", ylab="Global Reactive Power", 
     xlab = "DateTime")

dev.off()

