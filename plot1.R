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

## Plot 1
png(filename = "plot1.png", 
    height = 480, 
    width = 480, 
    units = "px")

hist(hpc$Global_active_power, 
     col ="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
