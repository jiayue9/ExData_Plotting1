library(lubridate)
power_consumption <- read.table("household_power_consumption.txt", 
                                header = TRUE, sep = ";", na.strings = "?")
two_day_data <- subset(power_consumption, 
                       (dmy(Date) == ymd("2007-02-01") | dmy(Date) == ymd("2007-02-02")))
two_day_data$DateTime <- strptime(paste(two_day_data$Date, two_day_data$Time, sep = " "), 
                           format="%d/%m/%Y %H:%M:%S")

png("plot1.png", width = 480, height = 480)
hist(two_day_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power")
dev.off()