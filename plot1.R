# Load data
source('dataloader.R')

# Open png device
png(filename='plot1.png')

# Make plot
hist(as.numeric(house0102$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# Turn off device
dev.off()
