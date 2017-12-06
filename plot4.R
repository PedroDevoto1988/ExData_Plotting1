## Read data into R (default save in current working directory)
hpc <- read.table("household_power_consumption.txt", 
                  header = TRUE, 
                  sep = ";", 
                  na.strings = "?")

hpc$date_time <- paste(hpc$Date, 
                       hpc$Time, 
                       sep = "/")

hpc$Date <- strptime(hpc$Date, 
                     format= "%d/%m/%Y")

hpc$date_time <- strptime(hpc$date_time, 
                          format = "%d/%m/%Y/%H:%M:%S")
hpc <- subset(hpc, 
              Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 4
png(filename = "plot4.png", 
    height = 480, 
    width = 480, 
    units = "px")

par(mfrow = c(2,2))

plot(hpc$date_time,
     hpc$Global_active_power, 
     type= "l", 
     xlab = "", 
     ylab = "Global Active Power")

plot(hpc$date_time,
     hpc$Voltage, 
     type= "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(hpc$date_time, 
     hpc$Sub_metering_1, 
     type="l",
     xlab = "", 
     ylab = "Energy Sub Metering")

lines(hpc$date_time,
      hpc$Sub_metering_2, 
      col = "red")

lines(hpc$date_time, 
      hpc$Sub_metering_3, 
      col = "blue")

legend("topright",
       legend= c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), 
       col = c("black","red","blue"))

plot(hpc$date_time,
     hpc$Global_reactive_power, 
     type= "l",
     xlab = "datetime")

dev.off()