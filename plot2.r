##Set working directory (this should be the folder where the unziped file 
##"household_power_consumption.txt" is contained contained).
setwd("~/Documents/Couersa/4 Exploratory Data Analysis/Assignments/Assignement 1/")
##Load the data into R.
data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
## Create a new variable combining date and time variables.
data["Date_Time"]<-paste(data$Date, data$Time, sep="-")
data$Date_Time<-as.character(data$Date_Time)
## Change the data in the new variable and the two first columns into a time and
## date class.
data$Date_Time<-strptime(data$Date_Time, "%d/%m/%Y-%H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time,"%H:%M:%S")
##Make subset of the needed data.
datasub<-subset(data, data$Date==as.Date("01/02/2007", "%d/%m/%Y") | data$Date==as.Date("02/02/2007", "%d/%m/%Y"))
##Create the second plot.
png("plot2.png")
plot(datasub$Date_Time, datasub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()