# Common function to load and prepare data

# Check and eventually download data file
if (!file.exists('household_power_consumption.txt')) {
    download.file(paste0('https://d396qusza40orc.cloudfront.net/',
                         'exdata%2Fdata%2Fhousehold_power_consumption.zip'),
                  method='curl', destfile='data.zip')
    unzip('data.zip')
}

# Read master file
house<-read.csv("household_power_consumption.txt",sep=";",na.strings='?')

# Convert Date field from Factor to Date data type
house$Date<-as.Date(house$Date,format="%d/%m/%Y")

# Subset data (now subset works on Date data type) for days 01 and 02
house0102<-subset(house,(Date=="2007-02-01" | Date=="2007-02-02")) 

# Convert Time field from Factor to DateTime data type(yes it contains again the Date, does not hurt and strptime needs also the date)
house0102$Time<-strptime(as.character(paste(house0102$Date,house0102$Time,sep=" ")), format = "%Y-%m-%d %H:%M:%S")

# Convert Time field from Factor to DateTime data type(yes it contains again the Date, does not hurt and strptime needs also the date)
house0102$Global_active_power<-as.numeric(house0102$Global_active_power)






