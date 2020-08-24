data_path <- "household_power_consumption.txt"
Data <- read.table(data_path, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- subset(Data, Data$Date == "1/2/2007" 
                      | Data$Date == "2/2/2007")


GAP <- as.numeric(subset_data$Global_active_power)
date_time <- paste(subset_data$Date, subset_data$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S") 
png(filename = "plot2.png", width = 480, height = 480)
plot(date_time, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
