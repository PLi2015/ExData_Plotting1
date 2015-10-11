  ##setwd("C:/Users/SPPB/Desktop/R/ExplorData/exdata-data-household_power_consumption")
  my_data <- fread("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
  my_data2 <- subset(my_data, my_data$Date>="2007-02-01" & my_data$Date<="2007-02-02", na.omit=TRUE)
  
  png(file = "plot1.png")
  hist(my_data2$Global_active_power, col= "red", main = "Global_active_power", xlab = "Global_active_power(kilowatts)")
  dev.off()
  
  
  