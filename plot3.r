##Set working directory (this should be the folder where the unziped file 
##"household_power_consumption.txt" is contained contained)
setwd("~/Documents/Couersa/4 Exploratory Data Analysis/Assignments/Assignement 1/")
##Load the data into R.
data<-read.table("./household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
##Create a new variable combining the Date and Time variable.
data["Date_Time"]<-paste(data$Date, data$Time, sep="-")
data$Date_Time<-as.character(data$Date_Time)
##Change the class for the data in the new variable and column one and two. 
data$Date_Time<-strptime(data$Date_Time, "%d/%m/%Y-%H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time,"%H:%M:%S")
##Make subset of the needed data.
datasub<-subset(data, data$Date==as.Date("01/02/2007", "%d/%m/%Y") | data$Date==as.Date("02/02/2007", "%d/%m/%Y"))
##Create the third plot
png("plot3.png")
plot(datasub$Date_Time, datasub$Sub_metering_1, col="Black", type="l", xlab="", ylab="Energy sub metering")
##Using the "points" command to annotate the plot created above rather than to
## create a new plot. 
points(datasub$Date_Time, datasub$Sub_metering_2, col="red", type="l", xlab="", ylab="")
points(datasub$Date_Time, datasub$Sub_metering_3, col="blue", type="l", xlab="", ylab="")
##Add a legend.
legend("topright",pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()