## Loading dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "household_power_consumption.txt")

## Cleaning the data table
<<<<<<< HEAD
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
=======
powerData <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                colClasses = c('character','character','numeric','numeric',
                               'numeric','numeric','numeric','numeric','numeric'))
>>>>>>> parent of 816449f... fixing code anyway

powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")

## Filtering dataset from 2007-2-1 to 2007-2-2
powerData <- subset(powerData, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

powerData <- powerData[complete.cases(powerData),]

dateTime <- paste(powerData$Date, powerData$Time)
dateTime <- setNames(dateTime, "DateTime")

powerData <- powerData[ ,!(names(powerData) %in% c("Date","Time"))]
powerData <- cbind(dateTime, powerData)

powerData$dateTime <- as.POSIXct(dateTime)