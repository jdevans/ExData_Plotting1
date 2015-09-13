alldata <- read.table("../household_power_consumption.txt",header=TRUE, sep=";", na.strings='?')
mydata <- subset(alldata, as.Date(alldata$Date, format="%d/%m/%Y") %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
png("plot2.png")
par(bg="transparent")
plot(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Global_active_power, 
     xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Global_active_power)
dev.off()