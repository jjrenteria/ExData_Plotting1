#file: plot2.R
#Construct the plot and save it to the plot2.png file with a width of 480 pixels and a height of 480 pixels

source("./loadData.R")

plot2 <- function( ) {    
	df <- NULL
	#load the data
    df <- loadData()
	if ( !is.null( df ) ) {
	    #open the device
	    png( filename = "./plot2.png", width = 480, height = 480, bg = "white" )
		#create a plot
		with(df, {
			plot( DateTime , Global_active_power , type = "l", main = "Plot 2", xlab = "", ylab = "Global Active Power (kilowatts)") 
		} )
		#close the device
	    dev.off()
	} else {
       print("couldn't load data." )
	}	
	
}	