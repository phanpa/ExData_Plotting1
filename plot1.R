#Exploratory Data Analysis > Week 1 > Course Project 1 > Base Histogram

	#Load dataset "household_power_consumption.txt"
	data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
	data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	
	#Filter dataset on Date"
	data_sub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

	#Create Plot 1
	hist(data_sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency", col="red")

	#Save as PNG file
	dev.copy(png, file="plot1.png", height=480, width=480)
	dev.off()

	#Clean up
	rm(data)
	rm(data_sub)
