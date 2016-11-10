data<-  read.table('household_power_consumption.txt', sep=';', header=TRUE) %>%
       mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
       mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
       filter(Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00'))

png(filename = "plot3.png")
plot(data$Time, as.numeric(data$Sub_metering_1), xaxt="n", type="l", ylab="Energy Sub Metering", 
     xlab = "Time")
lines(data$Time, as.numeric(data$Sub_metering_2), col="red")
lines(data$Time, as.numeric(data$Sub_metering_3), col="blue")
legend('topright', legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                     col=c("black", "red", "blue"), lty=c(1,1,1))

dev.off()

