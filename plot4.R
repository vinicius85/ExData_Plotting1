##Exploratory data analysis
##Author: vinicius
##Plot4.R

#Read input
data <- read.csv('household_power_consumption.txt', sep = ';' , header = TRUE, stringsAsFactors = FALSE)

filtered <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007' )

#Create new variable weekday
weekday <- as.POSIXct(strptime(paste(filtered$Date, filtered$Time), format='%d/%m/%Y %H:%M:%S'))

filtered$Weekday <- weekday

#Plotting 4 graphics
png(filename = 'plot4.png', width = 480, height = 480)

par(mfrow = c(2,2))

with(filtered, {
  plot(filtered$Weekday, filtered$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
  
  plot(filtered$Weekday, filtered$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
  
  plot(filtered$Weekday,filtered$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
  lines(filtered$Weekday,filtered$Sub_metering_2, type = "l", col = "blue")
  lines(filtered$Weekday,filtered$Sub_metering_3, type = "l", col = "red")
  legend("topright", pch = NA, lty=1 ,lwd = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  plot(filtered$Weekday, filtered$Global_reactive_power, xlab = "datetime", ylab = "Global Reactive Power", type = "l")
})

dev.off()