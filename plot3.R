library(lubridate)
power_consumption <- read.table("household_power_consumption.txt", 
                                header = TRUE, sep = ";", na.strings = "?")
two_day_data <- subset(power_consumption, 
                       (dmy(Date) == ymd("2007-02-01") | dmy(Date) == ymd("2007-02-02")))
two_day_data$DateTime <- strptime(paste(two_day_data$Date, two_day_data$Time, sep = " "), 
                                  format="%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

png("plot3.png", width = 480, height = 480)

plot(two_day_data$DateTime, two_day_data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(two_day_data$DateTime, two_day_data$Sub_metering_1, col = "black")
lines(two_day_data$DateTime, two_day_data$Sub_metering_2, col = "red")
lines(two_day_data$DateTime, two_day_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"))

dev.off()