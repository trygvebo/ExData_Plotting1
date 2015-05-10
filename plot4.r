##Set working directory (this should be the folder where the unziped file 
##"household_power_consumption.txt" is contained contained)
setwd("~/Documents/Couersa/4 Exploratory Data Analysis/Assignments/Assignement 1/")
##Load the data into R.
data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
## Create a new variable combining the exisiting Date and Time variable. 
data["Date_Time"]<-paste(data$Date, data$Time, sep="-")
data$Date_Time<-as.character(data$Date_Time)
##Change the class of data in the new variable and column one and two into a 
##time and date format. 
data$Date_Time<-strptime(data$Date_Time, "%d/%m/%Y-%H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time,"%H:%M:%S")
##Make subset of the needed data.
datasub<-subset(data, data$Date==as.Date("01/02/2007", "%d/%m/%Y") | data$Date==as.Date("02/02/2007", "%d/%m/%Y"))
##Set the global paramters for mulitple graphs on same page, graphs will be
## printed by column. 
png("plot4.png")
par(mfcol=c(2,2), mar=c(4,4,1,1))
##First plot ("Global Active Power")
plot(datasub$Date_Time, datasub$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##Second plot ("Energy sub metering")
plot(datasub$Date_Time, datasub$Sub_metering_1, col="Black", type="l", xlab="", ylab="Energy sub metering")
points(datasub$Date_Time, datasub$Sub_metering_2, col="red", type="l", xlab="", ylab="")
points(datasub$Date_Time, datasub$Sub_metering_3, col="blue", type="l", xlab="", ylab="")
legend("topright",pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7)
##Third plot ("Voltage")
plot(datasub$Date_Time, datasub$Voltage, type="l", xlab="datetime", ylab="Voltage")
##Forth plot ("Global_reactive_power)
plot(datasub$Date_Time, datasub$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()