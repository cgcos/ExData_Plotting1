#Plot 2 for course project
#This first command is for getting the weekday in english if your system is other language.
Sys.setlocale("LC_TIME", "en_US.UTF-8")
#Open the PNG device
png(file = "/home/carlos/coursera/exdata/plot4.png", bg = "white")
#Read the file and subset
power <- read.csv('/home/carlos/coursera/exdata/household_power_consumption.txt',na.strings=c("NA","?"),header=TRUE,sep=";")
subpower <- subset(power,as.Date(power$Date, format="%d/%m/%Y") == '2007/02/01' | as.Date(power$Date,format="%d/%m/%Y") == '2007/02/02')
#Put the Date and Time together
tiempo <- paste(subpower$Date,subpower$Time)
ex_p1_date <- strptime(tiempo, "%d/%m/%Y %H:%M:%S")
#Create the 4 plots
par(mfrow=c(2,2))
#Open the plots without data and then put the data
plot(ex_p1_date,subpower$Global_active_power,ylab=("Global Active Power"),xlab = (""),type="n")
lines(ex_p1_date,subpower$Global_active_power,lwd=1)
plot(ex_p1_date,subpower$Voltage,ylab=("Voltage"),xlab = ("datetime"),type="n")
lines(ex_p1_date,subpower$Voltage,lwd=1)
plot(ex_p1_date,subpower$Sub_metering_1,ylab=("Energy sub metering"),xlab = (""),type="n")
lines(ex_p1_date,subpower$Sub_metering_1,col="black",lwd=1)
lines(ex_p1_date,subpower$Sub_metering_2,col="red",lwd=1)
lines(ex_p1_date,subpower$Sub_metering_3,col="blue",lwd=1)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1, bty = "n")
plot(ex_p1_date,subpower$Global_reactive_power,ylab=("Global_reactive_power"),xlab = ("datetime"),type="n")
lines(ex_p1_date,subpower$Global_reactive_power,lwd=1)
#Close the device to write the png file
dev.off()