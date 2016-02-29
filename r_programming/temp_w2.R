pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## directory indicates the location of the csv files. It is a character vector of length 1
  ## Pollutant is a char vect length 1. Possible values are "sulfate" or "nitrate"
  ## id is an integer vector indicating the monitor ID numbers to be used. By default uses them all
  
  ## Return the mean of pollutant across all monite in the id vector (ignoring NA values). DO NOT ROUND RESULTS
  my_data <- list()
  n <- 1
  for (file_name in dir(test_directory)) {    
    if (any(id == substr(file_name, 1,3))) {
      my_data[[n]] <- read.csv(paste(test_directory, "/", file_name, sep = ""), header = TRUE)
      n <- n + 1
    }
  }
  my_data
}
test_directory <- c("C:/Users/PiergiorgioC/Documents/pollutant/specdata")
a <- pollutantmean(test_directory, c("sulfate"))
