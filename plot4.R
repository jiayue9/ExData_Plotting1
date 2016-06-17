library(lubridate)
power_consumption <- read.table("household_power_consumption.txt", 
                                header = TRUE, sep = ";", na.strings = "?")
two_day_data <- subset(power_consumption, 
                       (dmy(Date) == ymd("2007-02-01") | dmy(Date) == ymd("2007-02-02")))
two_day_data$DateTime <- strptime(paste(two_day_data$Date, two_day_data$Time, sep = " "), 
                                  format="%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")


png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

#plot top left
with(two_day_data, plot(DateTime, Global_active_power, type = "l", xlab = "",
                        ylab = "Global Active Power (kilowatts)"))

#plot top right
with(two_day_data, plot(DateTime, Voltage, type = "l", xlab = "datetime"))

#plot bottom left
plot(two_day_data$DateTime, two_day_data$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
lines(two_day_data$DateTime, two_day_data$Sub_metering_1, col = "black")
lines(two_day_data$DateTime, two_day_data$Sub_metering_2, col = "red")
lines(two_day_data$DateTime, two_day_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c("black", "red", "blue"))

#plot bottom left
with(two_day_data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()