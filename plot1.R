source("load_data.R")
data <- load_data()
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()