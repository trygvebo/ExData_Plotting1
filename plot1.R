##Set working directory (this should be the folder where the unziped file 
##"household_power_consumption.txt" is contained)
setwd("~/Documents/Couersa/4 Exploratory Data Analysis/Assignments/Assignement 1/")
##Load the data into R.
data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
##Change the class for the data in collumn one and two into date and time class.
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time,"%H:%M:%S")
##Make subset of the needed data.
datasub<-subset(data, data$Date==as.Date("01/02/2007", "%d/%m/%Y") | data$Date==as.Date("02/02/2007", "%d/%m/%Y"))
##Create the first plot (histogram).
png("plot1.png")
hist(datasub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()