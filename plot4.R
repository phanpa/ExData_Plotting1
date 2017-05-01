#Exploratory Data Analysis > Week 1 > Course Project 1 > Base Plot Multiple

	#Load dataset "household_power_consumption.txt"
	data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
	data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	
	#Filter dataset on Date"
	data_sub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

	#Combine Date and Time
	dt <- paste(as.Date(data_sub$Date), data_sub$Time)
	data_sub$Date_time <- as.POSIXct(dt)

	#Create Plot 4
	par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
	with(data_sub, {
    	plot(Global_active_power~Date_time, type="l", 
      ylab="Global Active Power", xlab="")
    	
	plot(Voltage~Date_time, type="l", 
      ylab="Voltage", xlab="")
    	
	plot(Sub_metering_1~Date_time, type="l", 
      ylab="Energy sub metering", xlab="")
    	lines(Sub_metering_2~Date_time,col='Red')
    	lines(Sub_metering_3~Date_time,col='Blue')

    	legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

    	plot(Global_reactive_power~Date_time, type="l", 
    	ylab="Global_Rective_Power",xlab="")
	})

	#Save as PNG file
	dev.copy(png, file="plot4.png", height=480, width=480)
	dev.off()

	#Clean up
	rm(data)
	rm(data_sub)
