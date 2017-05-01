#Exploratory Data Analysis > Week 1 > Course Project 1 > Base Plot

	#Load dataset "household_power_consumption.txt"
	data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
	data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	
	#Filter dataset on Date"
	data_sub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

	#Combine Date and Time
	dt <- paste(as.Date(data_sub$Date), data_sub$Time)
	data_sub$Date_time <- as.POSIXct(dt)

	#Create Plot 2
	plot(data_sub$Global_active_power~data_sub$Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")

	#Save as PNG file
	dev.copy(png, file="plot2.png", height=480, width=480)
	dev.off()

	#Clean up
	rm(data)
	rm(data_sub)
