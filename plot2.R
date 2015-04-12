##Exploratory data analysis
##Author: vinicius
##Plot2.R

#Read input
data <- read.csv('household_power_consumption.txt', sep = ';' , header = TRUE, stringsAsFactors = FALSE)

filtered <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007' )

#Create new variable weekday
weekday <- strptime(paste(filtered$Date, filtered$Time), format='%d/%m/%Y %H:%M:%S')
dateTimeToSeconds <- as.POSIXct(weekday)

filtered$Weekday <- dateTimeToSeconds

#Create plot weekday x global active power
png(filename = 'plot2.png', width = 480, height = 480)

plot(filtered$Weekday, filtered$Global_active_power, 
     xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()

