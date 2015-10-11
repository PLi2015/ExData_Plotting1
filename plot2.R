library(data.table)
my_data <- fread("household_power_consumption.txt", stringsAsFactors = TRUE, header = TRUE, sep = ";", na.strings = "?")
my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
my_data2 <- subset(my_data, my_data$Date>="2007-02-01" & my_data$Date<="2007-02-02", na.omit=TRUE)
my_data2$timetemp <- paste(my_data2$Date, my_data2$Time)

datacopy <- as.data.frame(my_data2)
datacopy$Time <- strptime(datacopy$timetemp, format = "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")

plot(datacopy$Time, datacopy$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts" )

dev.off()
