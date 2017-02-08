## load dataset in R
## load data from the dates 2007-02-01 and 2007-02-02
## convert the Date and Time variables to Date/Time classes in R using 
## the strptime() and as.Date() functions
## in this dataset missing values are coded as ?

load_data <- function() {
        
## Change working directory
setwd("D:/Study/DS/04_ExploratoryAnalysis/W1")

## Download dataset
if (!file.exists("household_power_consumption.txt")) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        temp <- "./temp.zip"
        download.file(url,temp)
        unzip(temp,exdir = ".")
        file.remove(temp)
}

## load dataset in R
library(data.table)
files <- "./household_power_consumption.txt"
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), 
                   sep = ';',
                   na = "?",
                   col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

# convert data and time to specific format
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Time <- as.POSIXct(paste(data$Date, data$Time))


return(data)
}