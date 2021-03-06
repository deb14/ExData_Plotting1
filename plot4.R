# This is the directory where you have placed the "household_power_consumption.txt"

dirurl <- "Paste your file path here"

setwd(dirurl)

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"./exdata2Fdata2Fhousehold_power_consumption.zip")
unzip ("exdata2Fdata2Fhousehold_power_consumption.zip",exdir = dirurl)
file<-"./household_power_consumption.txt"

#subset the data as we dont need the complete set

data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsset1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subsset1$Date, subsset1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivePower <- as.numeric(subsset1$Global_active_power)
globalReactivePower <- as.numeric(subsset1$Global_reactive_power)
voltage <- as.numeric(subsset1$Voltage)
subMetering1 <- as.numeric(subsset1$Sub_metering_1)
subMetering2 <- as.numeric(subsset1$Sub_metering_2)
subMetering3 <- as.numeric(subsset1$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalactivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()