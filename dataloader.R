# <dataloader.R> common function to load data for plots


# Check if data file exists, if not download it again and unzip it.

if (!file.exists('household_power_consumption.txt')) {
    download.file(paste0('https://d396qusza40orc.cloudfront.net/',
                         'exdata%2Fdata%2Fhousehold_power_consumption.zip'),
                  method='curl', destfile='data.zip')
    unzip('data.zip')
}


# I choose a more verbose, beginner approach, converting each column separately.
# I know I can cast types during read.csv, but being a beginner in R I preferred to use more statements and test more casting functions.

# Read master file
house<-read.csv("household_power_consumption.txt",sep=";",na.strings='?')

# Convert Date field from Factor to Date data type
house$Date<-as.Date(house$Date,format="%d/%m/%Y")

# Subset data (now subset works) for day 01
house0102<-subset(house,(Date=="2007-02-01" | Date=="2007-02-02")) 

# Convert Time field from Factor to DateTime data type(yes it contains again the Date, does not hurt and strptime needs also the date)
house0102$Time<-strptime(as.character(paste(house0102$Date,house0102$Time,sep=" ")), format = "%Y-%m-%d %H:%M:%S")

# Convert Global active power Factor to number
house0102$Global_active_power<-as.numeric(house0102$Global_active_power)

# Convert submetering_1 from Factor to number
house0102$Sub_metering_1<-as.double(house0102$Sub_metering_1)

# Convert submetering_2 from Factor to number
house0102$Sub_metering_2<-as.double(house0102$Sub_metering_2)

# Convert submetering_3 from Factor to number
house0102$Sub_metering_3<-as.double(house0102$Sub_metering_3)

# Convert Voltage from Factor to number
house0102$Sub_metering_3<-as.double(house0102$Sub_metering_3)

