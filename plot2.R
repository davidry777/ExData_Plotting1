## Create Plot 2
plot(powerData$Global_active_power~powerData$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()