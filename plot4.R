epc <- read.table(unz("exdata-data-household_power_consumption.zip",
                      "household_power_consumption.txt"), header=TRUE, sep=";",
                  dec=".", stringsAsFactors=FALSE, na.strings="?",
                  colClasses=c(rep("character",2), rep("numeric",7)))
epc1 <- subset(epc, epc$Date %in% c("1/2/2007","2/2/2007"))
epc1$DateTime <- as.POSIXct(paste(epc1$Date,epc1$Time), format="%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(epc1,
     {plot(epc1$DateTime,epc1$Global_active_power,type="n",xlab="", ylab="Global Active Power")
      lines(epc1$DateTime,epc1$Global_active_power,type="l")
      plot(epc1$DateTime,epc1$Voltage,type="n",xlab="datetime", ylab="Voltage")
      lines(epc1$DateTime,epc1$Voltage,type="l")
      plot(epc1$DateTime,epc1$Sub_metering_1,type="n",xlab="", ylab="Energy sub metering")
      lines(epc1$DateTime,epc1$Sub_metering_1, col="black", type="l")
      lines(epc1$DateTime,epc1$Sub_metering_2, col="red", type="l")
      lines(epc1$DateTime,epc1$Sub_metering_3, col="blue", type="l")
      legend("topright", bty="n", lty=c(1,1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      plot(epc1$DateTime,epc1$Global_reactive_power,type="n",xlab="datetime", ylab="Global_reactive_power")
      lines(epc1$DateTime,epc1$Global_reactive_power,type="l")
     })
dev.off()