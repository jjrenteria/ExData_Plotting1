#file: plot4.R
#Construct the plot and save it to the plot4.png file with a width of 480 pixels and a height of 480 pixels

source("./loadData.R")

plot4 <- function( ) {    
	df <- NULL
	#load the data
    df <- loadData()
	if ( !is.null( df ) ) {
   	    #open the device
	    png( filename = "./plot4.png", width = 480, height = 480, bg = "white" )
        ylim <- c( 0, max( df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3 ) )
	    par( mfrow = c(2,2) )
	    with( df, {
			# Top left
			plot( DateTime , Global_active_power , type = "l", xlab = "", ylab = "Global Active Power") 
			
			# Top right
			plot( DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage" ) 
			
			# Bottom left
			plot( DateTime , Sub_metering_1 , type = "n", xlab = "", ylab = "Energy sub metering", ylim = ylim ) 
			lines( DateTime , Sub_metering_1 , type = "l", col = "black" ) 
			lines( DateTime , Sub_metering_2 , type = "l", col = "red" ) 
			lines( DateTime , Sub_metering_3 , type = "l", col = "blue" ) 
			legend( "topright", col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(1.0,1.0,1.0), bty = "n" )
			
			# Bottom right
			plot( DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" ) 
		} )
		
		#close the device
	    dev.off()
	} else {
       print("couldn't load data." )
	}		
}	