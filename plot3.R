#file: plot3.R
#Construct the plot and save it to the plot3.png file with a width of 480 pixels and a height of 480 pixels

source("./loadData.R")

plot3 <- function( ) {    
	df <- NULL
	#load the data
    df <- loadData()
	if ( !is.null( df ) ) {
	    #open the device
	    png( filename = "./plot3.png", width = 480, height = 480, bg = "white" )
		#create a plot
		with(df, {
			ylim <- c( 0, max( Sub_metering_1, Sub_metering_2, Sub_metering_3 ) )
			plot( DateTime , Sub_metering_1 , type = "n", main = "Plot 3", xlab = "", ylab = "Energy sub metering", ylim = ylim) 
			lines( DateTime , Sub_metering_1 , type = "l", col = "black" ) 
			lines( DateTime , Sub_metering_2 , type = "l", col = "red" ) 
			lines( DateTime , Sub_metering_3 , type = "l", col = "blue" )
		} )	
		legend( "topright", col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(2.0,2.0,2.0) )
		#close the device
	    dev.off()
	} else {
       print("couldn't load data." )
	}	
	
}	