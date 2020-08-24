data_path <- "household_power_consumption.txt"
Data <- read.table(data_path, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- subset(Data, Data$Date == "1/2/2007" 
                      | Data$Date == "2/2/2007")

date_time <- paste(subset_data$Date, subset_data$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S") 
subMet1 <- as.numeric(subset_data$Sub_metering_1)
subMet2 <- as.numeric(subset_data$Sub_metering_2)
subMet3 <- as.numeric(subset_data$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480)
plot(date_time, subMet1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(date_time, subMet2, type = "l", col = "red")
lines(date_time, subMet3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 1, col = c("black", "red", "blue"))

dev.off()
