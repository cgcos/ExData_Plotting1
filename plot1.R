#Plot 1 for course project
#Open the PNG device
png(file = "/home/carlos/coursera/exdata/plot1.png", bg = "white")
#Read the file and subset
power <- read.csv('/home/carlos/coursera/exdata/household_power_consumption.txt',na.strings=c("NA","?"),header=TRUE,sep=";")
subpower <- subset(power,as.Date(power$Date, format="%d/%m/%Y") == '2007/02/01' | as.Date(power$Date,format="%d/%m/%Y") == '2007/02/02')
#Plot the histogram
hist(subpower$Global_active_power,xlab = "Global Active Power (kilowatts)",main=paste("Global Active Power"),col="red",ylim=c(0,1200))
#Close the device and write the png file
dev.off()