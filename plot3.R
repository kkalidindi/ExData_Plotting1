epc <- read.table(unz("exdata-data-household_power_consumption.zip",
                      "household_power_consumption.txt"), header=TRUE, sep=";",
                  dec=".", stringsAsFactors=FALSE, na.strings="?",
                  colClasses=c(rep("character",2), rep("numeric",7)))
epc1 <- subset(epc, epc$Date %in% c("1/2/2007","2/2/2007"))
epc1$DateTime <- as.POSIXct(paste(epc1$Date,epc1$Time), format="%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(epc1$DateTime,epc1$Sub_metering_1,type="n",xlab="", ylab="Energy sub metering")
lines(epc1$DateTime,epc1$Sub_metering_1, col="black", type="l")
lines(epc1$DateTime,epc1$Sub_metering_2, col="red", type="l")
lines(epc1$DateTime,epc1$Sub_metering_3, col="blue", type="l")
legend("topright", lty=c(1,1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
