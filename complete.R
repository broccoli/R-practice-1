complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases


	# convert integer vector to padded character vector
	id_ch = sprintf("%03d.csv", id)
	
	result_df = NULL

	for (i in id) {

		id_ch = sprintf("%03d.csv", i)
		
		# get file and path
		fName = file.path(directory, id_ch)
		d <- read.csv(fName)
		
		# get total number of complete cases
		cctotal = sum(complete.cases(d))
		
		df = data.frame("id" = i, "nobs" = cctotal)

		result_df = rbind(result_df, df)
		
	}

	result_df

}
