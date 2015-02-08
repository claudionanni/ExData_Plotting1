# Load data
source('dataloader.R')

# Open png device
png(filename='plot4.png',width=480,height=480,units="px")

# Instruct for 2x2 graphs plot window
par(mfrow=c(2,2))

# Make plot #1 - Top Left
plot(y=house0102$Global_active_power,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),type="l",ylab="Global Active Power",xlab="")

# Make plot #2 - Top Right
plot(y=house0102$Voltage,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),type="l",ylab="Voltage",xlab="")
title(sub="datetime", adj=0.5, line=3, font=2)

# Make plot #3 - Bottom Left
plot(y=house0102$Sub_metering_1,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),type="l",xlab="",col="black",ylab="Energy sub metering")
lines(house0102$Sub_metering_2,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),col="red")
lines(house0102$Sub_metering_3,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),col="blue")
legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),
       col=c('black','red','blue'),ncol=1,bty ="n",cex=0.5)

# Make plot #4 - Top Right
plot(y=house0102$Global_reactive_power,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),type="l",ylab="Global_reactive_power",xlab="")
title(sub="datetime", adj=0.5, line=3, font=2)

# Turn off device
dev.off()

