pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## directory indicates the location of the csv files. It is a character vector of length 1
  ## Pollutant is a char vect length 1. Possible values are "sulfate" or "nitrate"
  ## id is an integer vector indicating the monitor ID numbers to be used. By default uses them all
  
  ## Return the mean of pollutant across all monite in the id vector (ignoring NA values). DO NOT ROUND RESULTS
  my_data <- list()
  n <- 1
  file_list <- paste(test_directory, "/", substr(dir(test_directory),1,3)[id], ".csv", sep ="")
  for (file_name in file_list) {    
      my_data[[n]] <- read.csv(file_name, header = TRUE)[,pollutant]
      n <- n + 1
  }
  mean(unlist(my_data), na.rm = TRUE)
}

test_directory <- c("/home/piergiorgio/coursera_dataScience/r_programming/w2_assignment/dataset")
a <- pollutantmean(test_directory, c("nitrate"), 1:332)




