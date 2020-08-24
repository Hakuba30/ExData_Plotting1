data_path <- "household_power_consumption.txt"
Data <- read.table(data_path, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- subset(Data, Data$Date == "1/2/2007" 
                      | Data$Date == "2/2/2007")

GAP <- as.numeric(subset_data$Global_active_power)
date_time <- paste(subset_data$Date, subset_data$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S") 
subMet1 <- as.numeric(subset_data$Sub_metering_1)
subMet2 <- as.numeric(subset_data$Sub_metering_2)
subMet3 <- as.numeric(subset_data$Sub_metering_3)
GRP <- as.numeric(subset_data$Global_reactive_power)
Voltage <- as.numeric(subset_data$Voltage) 

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c (2, 2))

plot(date_time, GAP, type = "l", xlab = "", ylab = "Global Active Power")

plot(date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(date_time, subMet1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, subMet2, type = "l", col = "red")
lines(date_time, subMet3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 1, col = c("black", "red", "blue"))

plot(date_time, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
