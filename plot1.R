##Exploratory data analysis
##Author: vinicius
##Plot1.R

#Read input
data <- read.csv('household_power_consumption.txt', sep = ';' , header = TRUE, stringsAsFactors = FALSE)

filtered <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007' )

#Create histogram in png file
png(filename = 'plot1.png', width = 480, height = 480)

hist(as.double(filtered$Global_active_power), xlab = 'Global Active Power (kilowatts)',
     col = 'red', main = 'Global Active Power')

dev.off()