#Exploratory Data Analysis > Week 1 > Course Project 1 > Base Plot Advance

	#Load dataset "household_power_consumption.txt"
	data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
	data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	
	#Filter dataset on Date"
	data_sub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

	#Combine Date and Time
	dt <- paste(as.Date(data_sub$Date), data_sub$Time)
	data_sub$Date_time <- as.POSIXct(dt)

	#Create Plot 3
	with(data_sub, {
    	plot(Sub_metering_1~Date_time, type="l",
      ylab="Energy sub metering", xlab="")
    	lines(Sub_metering_2~Date_time,col='Red')
    	lines(Sub_metering_3~Date_time,col='Blue')
	})

	#Add Legend
	legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

	#Save as PNG file
	dev.copy(png, file="plot3.png", height=480, width=480)
	dev.off()

	#Clean up
	rm(data)
	rm(data_sub)
