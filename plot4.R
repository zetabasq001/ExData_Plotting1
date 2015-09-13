file <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
file <- as.tbl(file)
file1 <- file0 %>% mutate(day = as.factor(format(date, "%a")))
file3 <- file %>% select(Global_active_power, Date, Voltage, Global_reactive_power) %>%
  mutate(date = as.Date(Date, format = "%d/%m/%Y"),
         globalActivePower = as.numeric(Global_active_power),
         globalReactivePower = as.numeric(Global_reactive_power)) %>%
  filter(date == "2007-02-01" | date == "2007-02-02") 

png("plot4.png")
par(mfcol=c(2, 2), mar=c(1,4,1,2))

plot(file1$globalActivePower, ylab="Global Active Power(kilowatts)", type="l")
abline(v=0, col="blue")
abline(v=1440, col = "green")
abline(v=2880, col = "red")
text(0, 6, "Thu")
text(1440, 6, "Fri")
text(2880, 6, "Sat")

plot(file2$sub1, type= "l", ylab="Energy sub metering")
lines(file2$sub2, type="l", col = "blue")
lines(file2$sub3, type="l", col = "red")
text(0, 6, "Thu")
text(1440, 6, "Fri")
text(2880, 6, "Sat")

plot(file3$Voltage, ylab="Voltage", type="l", lwd=1)
text(0, 246, "Thu")
text(1440, 246, "Fri")
text(2880, 246, "Sat")

plot(file3$globalReactivePower, ylab="Global reactive power", type="l", lwd=1)
text(0, 0.5, "Thu")
text(1440, 0.5, "Fri")
text(2880, 0.5, "Sat")

dev.off()