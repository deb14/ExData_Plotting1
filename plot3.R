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
Sub_metering_1 <- as.numeric(subsset1$Sub_metering_1)
Sub_metering_2 <- as.numeric(subsset1$Sub_metering_2)
Sub_metering_3 <- as.numeric(subsset1$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()