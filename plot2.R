#Plot 2 for course project
#This first command is for getting the weekday in english if your system is other language.
Sys.setlocale("LC_TIME", "en_US.UTF-8")
#Open the PNG device
png(file = "/home/carlos/coursera/exdata/plot2.png", bg = "white")
#Read the file and subset
power <- read.csv('/home/carlos/coursera/exdata/household_power_consumption.txt',na.strings=c("NA","?"),header=TRUE,sep=";")
subpower <- subset(power,as.Date(power$Date, format="%d/%m/%Y") == '2007/02/01' | as.Date(power$Date,format="%d/%m/%Y") == '2007/02/02')
#Put the Date and Time together
tiempo <- paste(subpower$Date,subpower$Time)
ex_p1_date <- strptime(tiempo, "%d/%m/%Y %H:%M:%S")
#Open the plot without data and then put the lines.
plot(ex_p1_date,subpower$Global_active_power,ylab=("Global Active Power (kilowatts)"),xlab = (""),type="n")
lines(ex_p1_date,subpower$Global_active_power,lwd=1)
#Close the device to write the png file
dev.off()