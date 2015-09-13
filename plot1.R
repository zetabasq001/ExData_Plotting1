file <- read.csv2("household_power_consumption.txt", stringsAsFactors=FALSE)
file <- as.tbl(file)
file0 <- file %>% select(Date:Global_active_power) %>%
  mutate(date = as.Date(Date, format = "%d/%m/%Y"), globalActivePower = as.numeric(Global_active_power)) %>%
  filter(date == "2007-02-01" | date == "2007-02-02")

png("plot1.png")
plot1 <- hist(file0$globalActivePower, xlim=c(0,6), ylim=c(0,1200),
              main="Global Active Power", xlab="Global Active Power(kilowatts)",
              col="red")
dev.off()