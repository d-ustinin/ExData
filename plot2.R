power_data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?",colClasses = c(rep("character", 2), rep("numeric", 7)) )
two_days<-subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
two_days$FullTime<-with(two_days, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

par(mfrow = c(1,1))
par(mar=c(5, 5, 4, 2)+0.1)
plot(two_days$FullTime, two_days$Global_active_power, type="l", main="",ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
