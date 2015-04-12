epc <- read.table(unz("exdata-data-household_power_consumption.zip",
                      "household_power_consumption.txt"), header=TRUE, sep=";",
                  dec=".", stringsAsFactors=FALSE, na.strings="?",
                  colClasses=c(rep("character",2), rep("numeric",7)))
epc1 <- subset(epc, epc$Date %in% c("1/2/2007","2/2/2007"))
epc1$DateTime <- as.POSIXct(paste(epc1$Date,epc1$Time), format="%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(epc1$DateTime,epc1$Global_active_power,type="n",xlab="", ylab="Global Active Power (kilowatts)")
lines(epc1$DateTime,epc1$Global_active_power,type="l")
dev.off()