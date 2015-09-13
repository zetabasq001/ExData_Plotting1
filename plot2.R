file <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
file <- as.tbl(file)
file1 <- file0 %>% mutate(day = as.factor(format(date, "%a")))

png("plot2.png")
plot(file1$globalActivePower, ylab="Global Active Power(kilowatts)", type="l")
abline(v=0, col="blue")
abline(v=1440, col = "green")
abline(v=2880, col = "red")
text(0, 6, "Thu")
text(1440, 6, "Fri")
text(2880, 6, "Sat")

dev.off()
