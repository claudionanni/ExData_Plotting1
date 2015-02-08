# Load data
source('dataloader.R')

# Open png device
png(filename='plot2.png',width=480,height=480,units="px")

# Make plot
plot(y=house0102$Global_active_power,x=strptime(house0102$Time,format = "%Y-%m-%d %H:%M:%S"),type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Turn off device
dev.off()




