file <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
file <- as.tbl(file)
file2 <- file %>% select(Date, Global_active_power, Sub_metering_1:Sub_metering_3) %>%
  mutate(date = as.Date(Date, format = "%d/%m/%Y"), globalActivePower = as.numeric(Global_active_power)) %>%
  filter(date == "2007-02-01" | date == "2007-02-02") %>% 
  mutate(sub1=as.numeric(Sub_metering_1),sub2=as.numeric(Sub_metering_2),
         sub3=as.numeric(Sub_metering_3))

png("plot3.png")
plot(file2$sub1, type= "l", ylab="Energy sub metering")
lines(file2$sub2, type="l", col = "blue")
lines(file2$sub3, type="l", col = "red")
text(0, 6, "Thu")
text(1440, 6, "Fri")
text(2880, 6, "Sat")
dev.off()