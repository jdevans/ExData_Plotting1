# Read in (all) the data
alldata <- read.table("../household_power_consumption.txt",header=TRUE, sep=";", na.strings='?')

# Extract the data we need
mydata <- subset(alldata, as.Date(alldata$Date, format="%d/%m/%Y") %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

# Set up our graphics environment
png("plot4.png")
par(bg="transparent")
par(mfcol=c(2,2))   # Prepare for a 2 x 2 layout

# Upper-left plot (this is from "plot2.R")
plot(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Global_active_power, 
     xlab="", ylab="Global Active Power", type="n")
lines(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Global_active_power)

# Lower-left plot (this is from "plot3.R")
plot(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Sub_metering_1, 
     xlab="", ylab="Energy Sub metering", type="n")
lines(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Sub_metering_1)
lines(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Sub_metering_2, col="red")
lines(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), 
       lwd=1, bty="n")

# Upper-right plot
plot(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Voltage, 
     xlab="datetime", ylab="Voltage", type="n")
lines(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Voltage)

# Lower-right plot
plot(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Global_reactive_power, 
     xlab="datetime", ylab="Global_reactive_power", type="n")
lines(strptime(paste(mydata$Date,mydata$Time), format="%d/%m/%Y %H:%M:%S"), mydata$Global_reactive_power)

dev.off()
