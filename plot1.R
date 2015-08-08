#file: plot1.R
#Construct the plot and save it to the plot1.png file with a width of 480 pixels and a height of 480 pixels

source("./loadData.R")

plot1 <- function( ) {    
	df <- NULL
	#load the data
    df <- loadData()
	if ( !is.null( df ) ) {
	    #open the device
	    png( filename = "./plot1.png", width = 480, height = 480, bg = "white" )
		#create plot
		with(df, hist(Global_active_power, freq = TRUE, col = "red", border = "black", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frecuency" ))
		#close the device
	    dev.off()
	} else {
       print("couldn't load data." )
	}	
	
}	