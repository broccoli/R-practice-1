
pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        
	# convert integer vector to padded character vector
	id_ch = sprintf("%03d.csv", id)
	
	#initialize total
	tot <- numeric(0)

	for (i in id_ch) {

		
		# get file and path
		fName = file.path(directory, i)
		
		# get column w/o NO
		d <- read.csv(fName)
		dcol = d[pollutant]
		dcol = dcol[!is.na(dcol)]
		
		tot <- c(tot, dcol)
	}
	
	mean(tot)
}

