

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

	flist <- list.files("specdata", pattern="*.csv")
	
	result <- vector("numeric", length = 0)
	
	for (f in flist) {
	
		fName = file.path(directory, f)
		d <- read.csv(fName)
		good <- complete.cases(d)
		cctotal <- sum(good)
		if (cctotal > threshold) {
			dgood = d[good, ]
			corr <- cor(dgood$sulfate, dgood$nitrate)
			result <- c(result, corr)
		}
		
	}
	
	result

}
