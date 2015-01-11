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
globalactivePower <- as.numeric(subsset1$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalactivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()