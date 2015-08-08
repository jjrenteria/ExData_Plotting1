#file: loadData.R
#load the data from a file 
# fileName  name of the file
# initialDate
# endDate
# only return rows from the dates [initalDate, endDate]

loadData <- function(initialDate = "2007-02-01" , endDate = "2007-02-02" , fileName = "./household_power_consumption.txt" ) {
    if ( !file.exists( fileName ) ) {
		urlFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
		download.file( urlFile, method='curl', destfile = "household_power_consumption.zip" )
		unzip( "household_power_consumption.zip" )
	}
	df <- read.delim(, file = fileName , header = TRUE, sep = ";")
	#transform column to Date class
	df$Date <- as.Date( df$Date, "%d/%m/%Y" )
	if ( class(initialDate) != "Date" ) {
	   initialDate <- as.Date(initialDate)
	}
    if ( class(endDate) != "Date" ) {		
	   endDate <- as.Date(endDate)
	}
	    
	#filter records
	df <- df[ df$Date >= initialDate & df$Date <= endDate, ]
	#convert to numeric type
	df$Global_active_power <- as.numeric( as.character(df$Global_active_power) )
	df$Global_reactive_power <- as.numeric( as.character(df$Global_reactive_power) )
	df$Voltage <- as.numeric( as.character(df$Voltage) )
	df$Global_intensity <- as.numeric( as.character(df$Global_intensity) )
	df$Sub_metering_1 <- as.numeric( as.character(df$Sub_metering_1) )
	df$Sub_metering_2 <- as.numeric( as.character(df$Sub_metering_2) )
	df$Sub_metering_3 <- as.numeric( as.character(df$Sub_metering_3) )
	#concat date and time
	df$DateStr <- paste( df$Date, df$Time, sep = " ")
	#conver to date type
	df$DateTime <- strptime(df$DateStr, format = "%Y-%m-%d %H:%M:%S")
	df			 
}