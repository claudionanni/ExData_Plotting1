# Load data
source('dataloader.R')

# Open png device
png(filename='plot3.png',width=480,height=480,units="px")

# Make plot
plot(y=house0102$Sub_metering_1,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),type="l",xlab="",col="black",ylab="Energy sub metering")
lines(house0102$Sub_metering_2,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),col="red")
lines(house0102$Sub_metering_3,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),col="blue")
legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),
       col=c('black','red','blue'),ncol=1,bty ="y")


# Turn off device
dev.off()


