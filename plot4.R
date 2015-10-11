power_data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?",colClasses = c(rep("character", 2), rep("numeric", 7)) )
two_days<-subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
two_days$FullTime<-with(two_days, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

par(mar=c(5, 4, 4, 2)+0.1)
par(mfrow=c(2,2))

plot(two_days$FullTime, two_days$Global_active_power, type="l", main="",ylab="Global Active Power", xlab="")

plot(two_days$FullTime, two_days$Voltage, type="l", main="",ylab="Voltage", xlab="datetime")

plot(two_days$FullTime, two_days$Sub_metering_1, type="l", main="",ylab="Energy sub metering", xlab="", col="black")
lines(two_days$FullTime, two_days$Sub_metering_2, col="red")
lines(two_days$FullTime, two_days$Sub_metering_3, col="blue")

legend("topright", legend=names(two_days)[7:9], lty=c(1,1,1),bty="n", col=c("black", "red", "blue"))

plot(two_days$FullTime, two_days$Global_reactive_power, type="l", main="",ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()



