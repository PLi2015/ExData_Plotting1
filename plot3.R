my_data <- read.table("household_power_consumption.txt", stringsAsFactors = TRUE, header = TRUE, sep = ";", na.strings = "?")
my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")


my_data2 <- subset(my_data, my_data$Date>="2007-02-01" & my_data$Date<="2007-02-02", na.omit=TRUE)
my_data2$timetemp <- paste(my_data2$Date, my_data2$Time)

datacopy <- as.data.frame(my_data2)
datacopy$Time <- strptime(datacopy$timetemp, format = "%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")

with(datacopy, plot(Time, Sub_metering_2, type = "n", ylim = c(0, 40), ylab = "Energy sub metering"))
with(datacopy, lines(Time, Sub_metering_1, col="black"))
with(datacopy, lines(Time, Sub_metering_2, col="red"))
with(datacopy, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
