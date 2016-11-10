data<-  read.table('household_power_consumption.txt', sep=';', header=TRUE) %>%
       mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
       mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
       filter(Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00'))

png(filename = "plot1.png")
hist(as.numeric(data$Global_active_power), main = "Global Active Power", col="red",
                                          xlab= "Global Active Power (kilowatts)")
dev.off()

plot(data$Time, as.numeric(data$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", 
                            xlab = "Time")