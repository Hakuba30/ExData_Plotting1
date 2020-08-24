data_path <- "household_power_consumption.txt"
Data <- read.table(data_path, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- subset(Data, Data$Date == "1/2/2007" 
                      | Data$Date == "2/2/2007")


GAP <- as.numeric(subset_data$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
